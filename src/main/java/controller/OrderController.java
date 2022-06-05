package controller;

import com.alibaba.fastjson.JSON;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import pojo.OrderForm;
import pojo.OrderItem;
import service.OrderService;
import javax.annotation.Resource;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

/**
 * @author ZAY
 */
@Controller
public class OrderController {
    @Resource
    private OrderService orderService;
    @RequestMapping(value = "/selectAllOrder",produces = "application/json; charset=utf-8")
    @ResponseBody
    public String selectAllOrderController(){
        ArrayList<OrderForm> orderList=(ArrayList<OrderForm>) orderService.selectAllOrder();
        //System.out.println(json);
        return JSON.toJSONString(orderList);
    }
    @RequestMapping(value = "/selectOrderItemByOfid",produces = "application/json; charset=utf-8")
    @ResponseBody
    public String selectOrderItemByOfidController(@RequestBody Map<String,Object> ofidMap){
        ArrayList<OrderItem> orderItemList=(ArrayList<OrderItem>) orderService.selectOrderItemByOfid(ofidMap);
        //System.out.println(JSON.toJSONString(orderItemList));
        return JSON.toJSONString(orderItemList);
    }
    @RequestMapping(value = "/selectOrderByPara",produces = "application/json; charset=utf-8")
    @ResponseBody
    public String selectOrderByParaController(@RequestBody Map<String,Object> map){
        //System.out.println(map);
        ArrayList<OrderForm> orderList=(ArrayList<OrderForm>) orderService.selectOrderByPara(map);
        //System.out.println(JSON.toJSONString(orderList));
        return JSON.toJSONString(orderList);
    }
    @RequestMapping(value = "/insertOrder",produces = "application/json; charset=utf-8")
    @ResponseBody
    public String insertOrderController(@RequestBody Map<String,Object> map){
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Timestamp now = new Timestamp(System.currentTimeMillis());
        String date = df.format(now);
        map.put("date",date);
        //System.out.println(map);
        orderService.insertOrder(map);
        ArrayList<OrderForm> orderList=(ArrayList<OrderForm>) orderService.selectOrderByPara(map);
        return JSON.toJSONString(orderList);
    }
    @RequestMapping(value = "/insertOrderItem",produces = "application/json; charset=utf-8")
    @ResponseBody
    public String insertOrderItemController(@RequestBody Map<String,Object> map){
        int row= orderService.insertOrderItem(map);
        Map<String,Integer> rowMap=new HashMap<>(1);
        rowMap.put("row",row);
        return JSON.toJSONString(rowMap);
    }
    @RequestMapping(value = "/selectOrderNotFinishByPara",produces = "application/json; charset=utf-8")
    @ResponseBody
    public String selectOrderNotFinishByParaController( @RequestBody Map<String,Object> map){
        ArrayList<OrderForm> orderList=(ArrayList<OrderForm>) orderService.selectOrderNotFinishByPara(map);
        return JSON.toJSONString(orderList);
    }
    @RequestMapping(value = "/updateOrderStateByOfid",produces = "application/json; charset=utf-8")
    @ResponseBody
    public String updateOrderStateByOfidContoller(@RequestBody Map<String,Object> map){
        int row= orderService.updateOrderStateByOfid(map);
        Map<String,Integer> rowMap=new HashMap<>(1);
        rowMap.put("row",row);
        return JSON.toJSONString(rowMap);
    }
    @RequestMapping(value = "/gotoOrderFormInfo")
    public String gotoOrderFormInfo(){
        return "content/admin/order_form";
    }
    @RequestMapping(value = "/gotoOrderControl")
    public String gotoOrderControl(@RequestParam("sid")int sid, Model model){
        model.addAttribute("sid",sid);
        return "content/shop/order_control";
    }
}
