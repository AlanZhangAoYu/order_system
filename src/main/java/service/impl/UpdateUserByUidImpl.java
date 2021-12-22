package service.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;
import pojo.User;
import service.UpdateUserByUid;
import util.MybatisUtils;

/**
 * @author ZAY
 */
@Service
public class UpdateUserByUidImpl implements UpdateUserByUid {
    @Override
    public int updateUserByUid(User user){
        SqlSession sqlSession= MybatisUtils.getSession();
        int row= sqlSession.update("mapper.UserMapper.updateUserByUid",user);
        sqlSession.commit();
        return row;
    }
}
