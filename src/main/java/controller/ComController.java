package controller;

import com.alibaba.fastjson.JSON;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import pojo.Com;
import service.ComService;
import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

/**
 * @author ZAY
 */
@Controller
public class ComController {
    @Resource
    private ComService comService;
    @RequestMapping(value = "/selectAllCom",produces = "application/json; charset=utf-8")
    @ResponseBody
    public String selectAllComController(){
        ArrayList<Com> comList=(ArrayList<Com>) comService.selectAllCom();
        //System.out.println(json);
        return JSON.toJSONString(comList);
    }
    @RequestMapping(value = "/selectComByPara",produces = "application/json; charset=utf-8")
    @ResponseBody
    public String selectComByParaController(@RequestBody Map<String,Object> paraMap){
        ArrayList<Com> comList=(ArrayList<Com>) comService.selectComByPara(paraMap);
        //System.out.println(JSON.toJSONString(comList));
        return JSON.toJSONString(comList);
    }
    @RequestMapping(value = "/insertCom",produces = "application/json; charset=utf-8")
    @ResponseBody
    public String insertComController(@RequestBody Map<String,Object> map){
        int row= comService.insertCom(map);
        Map<String, Integer> rowMap=new HashMap<>(16);
        rowMap.put("row",row);
        return JSON.toJSONString(rowMap);
    }
    @RequestMapping(value = "/updateComByCid",produces = "application/json; charset=utf-8")
    @ResponseBody
    public String updateComByCidController(@RequestBody Map<String,Object> map){
        int row= comService.updateComByCid(map);
        Map<String, Integer> rowMap=new HashMap<>(16);
        rowMap.put("row",row);
        return JSON.toJSONString(rowMap);
    }
    @RequestMapping(value = "/deleteComByCid",produces = "application/json; charset=utf-8")
    @ResponseBody
    public String deleteComByCidController(@RequestBody Map<String,Object> map){
        int row= comService.deleteComByCid(map);
        Map<String, Integer> rowMap=new HashMap<>(16);
        rowMap.put("row",row);
        return JSON.toJSONString(rowMap);
    }
    @RequestMapping(value = "/gotoComInfo")
    public String gotoComInfo(){
        return "content/admin/com_info";
    }
    @RequestMapping(value = "/gotoComControl")
    public String gotoComControl(@RequestParam("sid")int sid, Model model){
        model.addAttribute("sid",sid);
        return "content/shop/com_control";
    }
}
