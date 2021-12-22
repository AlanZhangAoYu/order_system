package service.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;
import pojo.User;
import service.SelectAllUser;
import util.MybatisUtils;
import java.util.List;
/**
 * @author ZAY
 */
@Service
public class SelectAllUserImpl implements SelectAllUser {
    @Override
    public List<User> selectAllUser(){
        final SqlSession sqlSession=MybatisUtils.getSession();
        return sqlSession.selectList("mapper.UserMapper.selectAllUser");
    }
}
