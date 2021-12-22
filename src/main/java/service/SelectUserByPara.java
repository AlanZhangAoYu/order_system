package service;

import pojo.User;
import java.util.List;

/**
 * @author ZAY
 */
public interface SelectUserByPara {
    List<User> selectUserByPara(User user);
}
