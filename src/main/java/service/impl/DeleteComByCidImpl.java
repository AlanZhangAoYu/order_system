package service.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;
import service.DeleteComByCid;
import util.MybatisUtils;
import java.util.Map;

/**
 * @author ZAY
 */
@Service
public class DeleteComByCidImpl implements DeleteComByCid {
    @Override
    public int deleteComByCid(Map map) {
        SqlSession sqlSession= MybatisUtils.getSession();
        int row= sqlSession.delete("mapper.ComMapper.deleteComByCid",map);
        sqlSession.commit();
        return row;
    }
}
