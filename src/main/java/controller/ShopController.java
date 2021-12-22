package controller;

import com.alibaba.fastjson.JSON;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import pojo.Shop;;
import service.impl.*;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

/**
 * @author ZAY
 */
@Controller
@RequestMapping(value = "/ShopController")
public class ShopController {
    @Autowired
    private SelectAllShopImpl selectAllShop;
    @Autowired
    private SelectShopByParaImpl selectShopByPara;
    @Autowired
    private InsertShopImpl insertShop;
    @Autowired
    private UpdateShopBySidImpl updateShopBySid;
    @Autowired
    private DeleteShopBySidImpl deleteShopBySid;
    @RequestMapping(value = "/selectAllShopController",produces = "application/json; charset=utf-8")
    @ResponseBody
    public String selectAllShopController(){
        ArrayList<Shop> shoplist=(ArrayList<Shop>) selectAllShop.selectAllShop();
        //System.out.println(json);
        return JSON.toJSONString(shoplist);
    }
    @RequestMapping(value = "/selectShopByParaController",produces = "application/json; charset=utf-8")
    @ResponseBody
    public String selectShopByParaController(@RequestBody Shop shop){
        ArrayList<Shop> shopList=(ArrayList<Shop>) selectShopByPara.selectShopByShop(shop);
        return JSON.toJSONString(shopList);
    }
    @RequestMapping(value="/insertShopController",produces = "application/json; charset=utf-8")
    @ResponseBody
    public String insertShopController(@RequestBody Shop shop){
        int row= insertShop.insertShop(shop);
        //System.out.println("修改了"+row+"行数据");
        Map<String, Integer> map=new HashMap<>();
        map.put("row",row);
        return JSON.toJSONString(map);
    }
    @RequestMapping(value="/updateShopBySidController",produces = "application/json; charset=utf-8")
    @ResponseBody
    public String updateShopBySidController(@RequestBody Shop shop){
        int row= updateShopBySid.updateShopBySid(shop);
        //System.out.println("修改了"+row+"行数据");
        Map<String, Integer> map=new HashMap<>();
        map.put("row",row);
        return JSON.toJSONString(map);
    }
    @RequestMapping(value="/deleteShopBySidController",produces = "application/json; charset=utf-8")
    @ResponseBody
    public String deleteShopBySidController(@RequestBody Map map){
        int row= deleteShopBySid.deleteShopBySid(map);
        //System.out.println("修改了"+row+"行数据");
        Map<String, Integer> rowMap=new HashMap<>();
        rowMap.put("row",row);
        return JSON.toJSONString(rowMap);
    }
    @RequestMapping(value="/shopZhuCeController",produces = "application/json; charset=utf-8")
    @ResponseBody
    public String shopZhuCeController(@RequestBody Shop shop){
        insertShop.insertShop(shop);
        ArrayList<Shop> shopList=(ArrayList<Shop>) selectShopByPara.selectShopByShop(shop);
        return JSON.toJSONString(shopList);
    }
}
