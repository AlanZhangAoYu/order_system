package controller;

import com.alibaba.fastjson.JSON;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import pojo.Com;
import service.SelectAllCom;
import service.SelectComByPara;
import service.impl.DeleteComByCidImpl;
import service.impl.InsertComImpl;
import service.impl.UpdateComByCidImpl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

/**
 * @author ZAY
 */
@Controller
@RequestMapping(value = "/ComController")
public class ComController {
    @Autowired
    private SelectAllCom selectAllCom;
    @Autowired
    private SelectComByPara selectComByPara;
    @Autowired
    private InsertComImpl insertCom;
    @Autowired
    private UpdateComByCidImpl updateComByCid;
    @Autowired
    private DeleteComByCidImpl deleteComByCid;
    @RequestMapping(value = "/selectAllComController",produces = "application/json; charset=utf-8")
    @ResponseBody
    public String selectAllComController(){
        ArrayList<Com> comList=(ArrayList<Com>) selectAllCom.selectAllCom();
        //System.out.println(json);
        return JSON.toJSONString(comList);
    }
    @RequestMapping(value = "/selectComByParaController",produces = "application/json; charset=utf-8")
    @ResponseBody
    public String selectComByParaController(@RequestBody Map paraMap){
        ArrayList<Com> comList=(ArrayList<Com>) selectComByPara.selectComByPara(paraMap);
        //System.out.println(JSON.toJSONString(comList));
        return JSON.toJSONString(comList);
    }
    @RequestMapping(value = "/insertComController",produces = "application/json; charset=utf-8")
    @ResponseBody
    public String insertComController(@RequestBody Map map){
        int row= insertCom.insertCom(map);
        Map<String, Integer> rowMap=new HashMap<>(16);
        rowMap.put("row",row);
        return JSON.toJSONString(rowMap);
    }
    @RequestMapping(value = "/updateComByCidController",produces = "application/json; charset=utf-8")
    @ResponseBody
    public String updateComByCidController(@RequestBody Map map){
        int row= updateComByCid.updateComByCid(map);
        Map<String, Integer> rowMap=new HashMap<>(16);
        rowMap.put("row",row);
        return JSON.toJSONString(rowMap);
    }
    @RequestMapping(value = "/deleteComByCidController",produces = "application/json; charset=utf-8")
    @ResponseBody
    public String deleteComByCidController(@RequestBody Map map){
        int row= deleteComByCid.deleteComByCid(map);
        Map<String, Integer> rowMap=new HashMap<>(16);
        rowMap.put("row",row);
        return JSON.toJSONString(rowMap);
    }
}
