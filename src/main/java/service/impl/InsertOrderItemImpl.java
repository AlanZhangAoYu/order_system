package service.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;
import service.InsertOrderItem;
import util.MybatisUtils;
import java.util.Map;

/**
 * @author ZAY
 */
@Service
public class InsertOrderItemImpl implements InsertOrderItem {
    @Override
    public int insertOrderItem(Map map){
        SqlSession sqlSession= MybatisUtils.getSession();
        int row= sqlSession.insert("mapper.OrderMapper.insertOrderItem",map);
        sqlSession.commit();
        return row;
    }
}
