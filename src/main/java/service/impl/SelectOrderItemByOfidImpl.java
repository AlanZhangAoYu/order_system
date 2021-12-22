package service.impl;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;
import pojo.OrderItem;
import service.SelectOrderItemByOfid;
import util.MybatisUtils;
import java.util.List;
import java.util.Map;

/**
 * @author ZAY
 */
@Service
public class SelectOrderItemByOfidImpl implements SelectOrderItemByOfid{
    @Override
    public List<OrderItem> selectOrderItemByOfid(Map ofid){
        SqlSession sqlSession = MybatisUtils.getSession();
        return sqlSession.selectList("mapper.OrderMapper.selectOrderItemByOfid",ofid);
    }
}
