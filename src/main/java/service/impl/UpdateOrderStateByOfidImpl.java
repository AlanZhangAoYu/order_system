package service.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;
import service.UpdateOrderStateByOfid;
import util.MybatisUtils;
import java.util.Map;

/**
 * @author ZAY
 */
@Service
public class UpdateOrderStateByOfidImpl implements UpdateOrderStateByOfid {
    @Override
    public int updateOrderStateByOfid(Map map){
        SqlSession sqlSession= MybatisUtils.getSession();
        int row= sqlSession.update("mapper.OrderMapper.updateOrderStateByOfid",map);
        sqlSession.commit();
        return row;
    }
}
