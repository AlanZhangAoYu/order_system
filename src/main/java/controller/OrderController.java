package controller;

import com.alibaba.fastjson.JSON;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import pojo.OrderForm;
import pojo.OrderItem;
import service.impl.*;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

/**
 * @author ZAY
 */
@Controller
@RequestMapping(value = "/OrderController")
public class OrderController {
    @Autowired
    private SelectAllOrderImpl selectAllOrder;
    @Autowired
    private SelectOrderItemByOfidImpl selectOrderItemByOfidImpl;
    @Autowired
    private SelectOrderByParaImpl selectOrderByPara;
    @Autowired
    private InsertOrderImpl insertOrder;
    @Autowired
    private InsertOrderItemImpl insertOrderItem;
    @Autowired
    private SelectOrderNotFinishByParaImpl selectOrderNotFinishByPara;
    @Autowired
    private UpdateOrderStateByOfidImpl updateOrderStateByOfid;
    @RequestMapping(value = "/selectAllOrderController",produces = "application/json; charset=utf-8")
    @ResponseBody
    public String selectAllOrderController(){
        ArrayList<OrderForm> orderList=(ArrayList<OrderForm>) selectAllOrder.selectAllOrder();
        //System.out.println(json);
        return JSON.toJSONString(orderList);
    }
    @RequestMapping(value = "/selectOrderItemByOfidController",produces = "application/json; charset=utf-8")
    @ResponseBody
    public String selectOrderItemByOfidController(@RequestBody Map ofidMap){
        ArrayList<OrderItem> orderItemList=(ArrayList<OrderItem>) selectOrderItemByOfidImpl.selectOrderItemByOfid(ofidMap);
        //System.out.println(JSON.toJSONString(orderItemList));
        return JSON.toJSONString(orderItemList);
    }
    @RequestMapping(value = "/selectOrderByParaController",produces = "application/json; charset=utf-8")
    @ResponseBody
    public String selectOrderByParaController(@RequestBody Map map){
        //System.out.println(map);
        ArrayList<OrderForm> orderList=(ArrayList<OrderForm>) selectOrderByPara.selectOrderByPara(map);
        //System.out.println(JSON.toJSONString(orderList));
        return JSON.toJSONString(orderList);
    }
    @RequestMapping(value = "/insertOrderController",produces = "application/json; charset=utf-8")
    @ResponseBody
    public String insertOrderController(@RequestBody Map map){
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Timestamp now = new Timestamp(System.currentTimeMillis());
        String date = df.format(now);
        map.put("date",date);
        //System.out.println(map);
        insertOrder.insertOrder(map);
        ArrayList<OrderForm> orderList=(ArrayList<OrderForm>) selectOrderByPara.selectOrderByPara(map);
        return JSON.toJSONString(orderList);
    }
    @RequestMapping(value = "/insertOrderItemController",produces = "application/json; charset=utf-8")
    @ResponseBody
    public String insertOrderItemController(@RequestBody Map map){
        int row= insertOrderItem.insertOrderItem(map);
        Map<String,Integer> rowMap=new HashMap<>();
        rowMap.put("row",row);
        return JSON.toJSONString(rowMap);
    }
    @RequestMapping(value = "/selectOrderNotFinishByParaController",produces = "application/json; charset=utf-8")
    @ResponseBody
    public String selectOrderNotFinishByParaController( @RequestBody Map map){
        ArrayList<OrderForm> orderList=(ArrayList<OrderForm>) selectOrderNotFinishByPara.selectOrderNotFinishByPara(map);
        return JSON.toJSONString(orderList);
    }
    @RequestMapping(value = "/updateOrderStateByOfidController",produces = "application/json; charset=utf-8")
    @ResponseBody
    public String updateOrderStateByOfidContoller(@RequestBody Map map){
        int row= updateOrderStateByOfid.updateOrderStateByOfid(map);
        Map<String,Integer> rowMap=new HashMap<>();
        rowMap.put("row",row);
        return JSON.toJSONString(rowMap);
    }
}
