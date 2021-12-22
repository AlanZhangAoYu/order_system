package service.impl;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;
import pojo.User;
import service.SelectUserByPara;
import util.MybatisUtils;
import java.util.List;

/**
 * @author ZAY
 */
@Service
public class SelectUserByParaImpl implements SelectUserByPara {
    @Override
    public List<User> selectUserByPara(User user){
        SqlSession sqlSession= MybatisUtils.getSession();
        return sqlSession.selectList("mapper.UserMapper.selectUserByPara",user);
    }
}
