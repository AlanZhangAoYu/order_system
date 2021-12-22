package controller;

import com.alibaba.fastjson.JSON;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import java.util.HashMap;
import java.util.Map;

/**
 * @author ZAY
 */
@Controller
public class LoginController {
    final String adminId = "1933140340";
    final String adminPassword = "QianNvYouHun";
    @RequestMapping(value = "/adminLoginController",produces = "application/json;charset=utf-8")
    @ResponseBody
    public String adminLoginController(@RequestBody Map<String,String> map){
        Map<String,String> result = new HashMap<>();
        if(adminId.equals(map.get("admin_id"))&&adminPassword.equals(map.get("password"))){
            result.put("admin_name","张傲宇");
        }else{
            result.put("state","error");
        }
        return JSON.toJSONString(result);
    }
}
