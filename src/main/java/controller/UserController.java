package controller;

import com.alibaba.fastjson.JSON;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import pojo.User;
import service.UserService;
import util.Md5Util;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

/**
 * @author ZAY
 */
@Controller
public class UserController {
    @Resource
    private UserService userService;
    @RequestMapping(value="/selectAllUser",produces = "application/json; charset=utf-8")
    @ResponseBody
    public String selectAllUserController(){
        ArrayList<User> userList= (ArrayList<User>) userService.selectAllUser();
        //System.out.println(json);
        return JSON.toJSONString(userList);
    }
    @RequestMapping(value = "/selectUserByPara",produces = "application/json; charset=utf-8")
    @ResponseBody
    public String selectUserByPara(@RequestBody User user){
        if(!"".equals(user.getPassword())){
            user.setPassword(Md5Util.getMd5Str(user.getPassword()));
        }
        ArrayList<User> userList=(ArrayList<User>) userService.selectUserByPara(user);
        return JSON.toJSONString(userList);
    }
    @RequestMapping(value="/insertUser",produces = "application/json; charset=utf-8")
    @ResponseBody
    public String insertUserController(@RequestBody User user){
        if(!"".equals(user.getPassword())){
            user.setPassword(Md5Util.getMd5Str(user.getPassword()));
        }
        int row=userService.insertUser(user);
        //System.out.println("修改了"+row+"行数据");
        Map<String, Integer> map=new HashMap<>(1);
        map.put("row",row);
        return JSON.toJSONString(map);
    }
    @RequestMapping(value="/updateUserByUid",produces = "application/json; charset=utf-8")
    @ResponseBody
    public String updateUserByUidController(@RequestBody User user){
        if(!"".equals(user.getPassword())){
            user.setPassword(Md5Util.getMd5Str(user.getPassword()));
        }
        int row=userService.updateUserByUid(user);
        Map<String,Integer> map=new HashMap<>(1);
        map.put("row",row);
        return JSON.toJSONString(map);
    }
    @RequestMapping(value="/deleteUserByUid",produces = "application/json; charset=utf-8")
    @ResponseBody
    public String deleteUserByUidController(@RequestBody Map<String,Object> map){
        int row=userService.deleteUserByUid(map);
        Map<String,Integer> rowMap =new HashMap<>(1);
        rowMap.put("row",row);
        return JSON.toJSONString(rowMap);
    }
    @RequestMapping(value="/userZhuCe",produces = "application/json; charset=utf-8")
    @ResponseBody
    public String userZhuCeController(@RequestBody User user){
        userService.insertUser(user);
        ArrayList<User> userList=(ArrayList<User>) userService.selectUserByPara(user);
        return JSON.toJSONString(userList);
    }
    @RequestMapping(value = "/gotoUserIndex")
    public String gotoUserIndex(@RequestParam("uid") int uid, @RequestParam("uname") String uname, Model model){
        model.addAttribute("uid",uid);
        model.addAttribute("uname",uname);
        return "content/user/user_index";
    }
    @RequestMapping(value = "/gotoUserInfo")
    public String gotoUserInfo(){
        return "content/admin/user_info";
    }
    @RequestMapping(value = "/gotoUserBrowseShop")
    public String gotoUserBrowseShop(@RequestParam("uid")int uid,
                                     @RequestParam("uname")String uname,
                                     @RequestParam("sid")int sid,Model model){
        model.addAttribute("uid",uid);
        model.addAttribute("uname",uname);
        model.addAttribute("sid",sid);
        return "content/user/user_browse_shop";
    }
    @RequestMapping(value = "/gotoUserZhuCe")
    public String gotoUserZhuCe(){
        return "content/user/user_zhuce";
    }
}
