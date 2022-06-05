package service;

import mapper.UserMapper;
import org.springframework.stereotype.Service;
import pojo.User;
import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * @author XL
 */
@Service
public class UserService {
    @Resource
    private UserMapper userMapper;
    public List<User> selectAllUser(){
        return userMapper.selectAllUser();
    }
    public List<User> selectUserByPara(User user){
        return userMapper.selectUserByPara(user);
    }
    public int insertUser(User user){
        return userMapper.insertUser(user);
    }
    public int deleteUserByUid(Map<String,Object> map){
        return userMapper.deleteUserByUid(map);
    }
    public int updateUserByUid(User user){
        return userMapper.updateUserByUid(user);
    }
}
