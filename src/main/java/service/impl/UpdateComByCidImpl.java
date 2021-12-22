package service.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;
import service.UpdateComByCid;
import util.MybatisUtils;
import java.util.Map;

/**
 * @author ZAY
 */
@Service
public class UpdateComByCidImpl implements UpdateComByCid {
    @Override
    public int updateComByCid(Map map){
        SqlSession sqlSession= MybatisUtils.getSession();
        int row= sqlSession.update("mapper.ComMapper.updateComByCid",map);
        sqlSession.commit();
        return row;
    }
}
