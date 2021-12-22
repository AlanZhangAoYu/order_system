package service.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;
import pojo.OrderForm;
import service.SelectAllOrder;
import util.MybatisUtils;
import java.util.List;

/**
 * @author ZAY
 */
@Service
public class SelectAllOrderImpl implements SelectAllOrder {
    @Override
    public List<OrderForm> selectAllOrder(){
        SqlSession sqlSession= MybatisUtils.getSession();
        return sqlSession.selectList("mapper.OrderMapper.selectAllOrder");
    }
}
