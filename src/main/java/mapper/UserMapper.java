package mapper;

import org.apache.ibatis.annotations.Mapper;
import pojo.User;
import java.util.List;
import java.util.Map;

/**
 * @author XL
 */
@Mapper
public interface UserMapper {
    List<User> selectAllUser();
    List<User> selectUserByPara(User user);
    int insertUser(User user);
    int updateUserByUid(User user);
    int deleteUserByUid(Map<String,Object> map);
}
