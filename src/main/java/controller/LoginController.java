package controller;

import com.alibaba.fastjson.JSON;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import util.Md5Util;

import java.util.HashMap;
import java.util.Map;

/**
 * @author ZAY
 */
@Controller
public class LoginController {
    final String adminId = "1933140336";
    final String adminPassword = "36e3fc81be8c4635cf93aa14266650d8";
    @RequestMapping(value = "/loginAdmin")
    public String gotoAdminLoginPage(){
        return "content/loginAdmin";
    }
    @RequestMapping(value = "/")
    public String gotoIndex(){
        return "content/index";
    }
    @RequestMapping(value = "gotoAdminIndex")
    public String gotoAdminIndex(@RequestParam("admin_name")String adminName, Model model){
        model.addAttribute("adminName",adminName);
        return "content/admin/index_admin";
    }
    @RequestMapping(value = "/adminLoginController",produces = "application/json;charset=utf-8")
    @ResponseBody
    public String adminLoginController(@RequestBody Map<String,String> map){
        Map<String,String> result = new HashMap<>(1);
        map.put("password", Md5Util.getMd5Str(map.get("password")));
        System.out.println(map);
        if(adminId.equals(map.get("admin_id"))&&adminPassword.equals(map.get("password"))){
            result.put("admin_name","谢林");
        }else{
            result.put("state","error");
        }
        return JSON.toJSONString(result);
    }
}
