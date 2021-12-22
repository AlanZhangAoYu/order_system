package service.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;
import service.InsertOrder;
import util.MybatisUtils;
import java.util.Map;

/**
 * @author ZAY
 */
@Service
public class InsertOrderImpl implements InsertOrder {
    @Override
    public int insertOrder(Map map){
        SqlSession sqlSession= MybatisUtils.getSession();
        int row=sqlSession.insert("mapper.OrderMapper.insertOrder",map);
        sqlSession.commit();
        return row;
    }
}
