package service.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;
import service.DeleteUserByUid;
import util.MybatisUtils;
import java.util.Map;

/**
 * @author ZAY
 */
@Service
public class DeleteUserByUidImpl implements DeleteUserByUid {
    @Override
    public int deleteUserByUid(Map map){
        SqlSession sqlSession= MybatisUtils.getSession();
        int row=sqlSession.delete("mapper.UserMapper.deleteUserByUid",map);
        sqlSession.commit();
        return row;
    }
}
