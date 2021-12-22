package service.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;
import pojo.User;
import service.InsertUser;
import util.MybatisUtils;

/**
 * @author ZAY
 */
@Service
public class InsertUserImpl implements InsertUser {
    @Override
    public int insertUser(User user){
        SqlSession sqlSession= MybatisUtils.getSession();
        int row=sqlSession.insert("mapper.UserMapper.insertUser",user);
        sqlSession.commit();//一定要加这句话，不然数据库自动回滚
        return row;
    }
}
