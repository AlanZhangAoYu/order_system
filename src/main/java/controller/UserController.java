package controller;

import com.alibaba.fastjson.JSON;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import pojo.User;
import service.SelectUserByPara;
import service.impl.DeleteUserByUidImpl;
import service.impl.InsertUserImpl;
import service.impl.SelectAllUserImpl;
import service.impl.UpdateUserByUidImpl;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

/**
 * @author ZAY
 */
@Controller
@RequestMapping(value="/UserController")
public class UserController {
    @Autowired
    private SelectAllUserImpl selectAllUser;
    @Autowired
    private SelectUserByPara selectUserByPara;
    @Autowired
    private InsertUserImpl insertUser;
    @Autowired
    private UpdateUserByUidImpl updateUserByUid;
    @Autowired
    private DeleteUserByUidImpl deleteUserByUid;
    @RequestMapping(value="/selectAllUserController",produces = "application/json; charset=utf-8")
    @ResponseBody
    public String selectAllUserController(){
        ArrayList<User> userList= (ArrayList<User>) selectAllUser.selectAllUser();
        //System.out.println(json);
        return JSON.toJSONString(userList);
    }
    @RequestMapping(value = "/selectUserByPara",produces = "application/json; charset=utf-8")
    @ResponseBody
    public String selectUserByPara(@RequestBody User user){
        ArrayList<User> userList=(ArrayList<User>) selectUserByPara.selectUserByPara(user);
        //System.out.println(json);
        return JSON.toJSONString(userList);
    }
    @RequestMapping(value="/insertUserController",produces = "application/json; charset=utf-8")
    @ResponseBody
    public String insertUserController(@RequestBody User user){
        //System.out.println(user);
        int row=insertUser.insertUser(user);
        //System.out.println("修改了"+row+"行数据");
        Map<String, Integer> map=new HashMap<String, Integer>();
        map.put("row",row);
        return JSON.toJSONString(map);
    }
    @RequestMapping(value="/updateUserByUidController",produces = "application/json; charset=utf-8")
    @ResponseBody
    public String updateUserByUidController(@RequestBody User user){
        int row=updateUserByUid.updateUserByUid(user);
        Map<String,Integer> map=new HashMap<>();
        map.put("row",row);
        return JSON.toJSONString(map);
    }
    @RequestMapping(value="/deleteUserByUidController",produces = "application/json; charset=utf-8")
    @ResponseBody
    public String deleteUserByUidController(@RequestBody Map map){
        int row=deleteUserByUid.deleteUserByUid(map);
        Map<String,Integer> rowMap =new HashMap<>();
        rowMap.put("row",row);
        return JSON.toJSONString(rowMap);
    }
    @RequestMapping(value="/userZhuCeController",produces = "application/json; charset=utf-8")
    @ResponseBody
    public String userZhuCeController(@RequestBody User user){
        insertUser.insertUser(user);
        ArrayList<User> userList=(ArrayList<User>) selectUserByPara.selectUserByPara(user);
        return JSON.toJSONString(userList);
    }
}
