package controller;

import com.alibaba.fastjson.JSON;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import pojo.Shop;
import service.ShopService;
import util.Md5Util;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

/**
 * @author ZAY
 */
@Controller
public class ShopController {
    @Resource
    private ShopService shopService;
    @RequestMapping(value = "/selectAllShop",produces = "application/json; charset=utf-8")
    @ResponseBody
    public String selectAllShopController(){
        ArrayList<Shop> shoplist=(ArrayList<Shop>) shopService.selectAllShop();
        //System.out.println(json);
        return JSON.toJSONString(shoplist);
    }
    @RequestMapping(value = "/selectShopByPara",produces = "application/json; charset=utf-8")
    @ResponseBody
    public String selectShopByParaController(@RequestBody Shop shop){
        if(!"".equals(shop.getPassword())){
            shop.setPassword(Md5Util.getMd5Str(shop.getPassword()));
        }
        ArrayList<Shop> shopList=(ArrayList<Shop>) shopService.selectShopByShop(shop);
        return JSON.toJSONString(shopList);
    }
    @RequestMapping(value="/insertShop",produces = "application/json; charset=utf-8")
    @ResponseBody
    public String insertShopController(@RequestBody Shop shop){
        if(!"".equals(shop.getPassword())){
            shop.setPassword(Md5Util.getMd5Str(shop.getPassword()));
        }
        int row= shopService.insertShop(shop);
        //System.out.println("修改了"+row+"行数据");
        Map<String, Integer> map=new HashMap<>(1);
        map.put("row",row);
        return JSON.toJSONString(map);
    }
    @RequestMapping(value="/updateShopBySid",produces = "application/json; charset=utf-8")
    @ResponseBody
    public String updateShopBySidController(@RequestBody Shop shop){
        if(!"".equals(shop.getPassword())){
            shop.setPassword(Md5Util.getMd5Str(shop.getPassword()));
        }
        int row= shopService.updateShopBySid(shop);
        //System.out.println("修改了"+row+"行数据");
        Map<String, Integer> map=new HashMap<>(1);
        map.put("row",row);
        return JSON.toJSONString(map);
    }
    @RequestMapping(value="/deleteShopBySid",produces = "application/json; charset=utf-8")
    @ResponseBody
    public String deleteShopBySidController(@RequestBody Map<String,Object> map){
        int row= shopService.deleteShopBySid(map);
        //System.out.println("修改了"+row+"行数据");
        Map<String, Integer> rowMap=new HashMap<>(1);
        rowMap.put("row",row);
        return JSON.toJSONString(rowMap);
    }
    @RequestMapping(value="/shopZhuCe",produces = "application/json; charset=utf-8")
    @ResponseBody
    public String shopZhuCeController(@RequestBody Shop shop){
        shopService.insertShop(shop);
        ArrayList<Shop> shopList=(ArrayList<Shop>) shopService.selectShopByShop(shop);
        return JSON.toJSONString(shopList);
    }
    @RequestMapping(value = "/gotoShopInfo")
    public String gotoShopInfo(){
        return "content/admin/shop_info";
    }
    @RequestMapping(value = "/gotoShopIndex")
    public String gotoShopIndex(@RequestParam("sid")int sid, @RequestParam("sname")String sname, Model model){
        model.addAttribute("sid",sid);
        model.addAttribute("sname",sname);
        return "content/shop/shop_index";
    }
    @RequestMapping(value = "/gotoShopZhuCe")
    public String gotoShopZhuCe(){
        return "content/shop/shop_zhuce";
    }
}
