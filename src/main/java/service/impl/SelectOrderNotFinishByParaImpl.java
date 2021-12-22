package service.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;
import pojo.OrderForm;
import service.SelectOrderNotFinishByPara;
import util.MybatisUtils;
import java.util.List;
import java.util.Map;

/**
 * @author ZAY
 */
@Service
public class SelectOrderNotFinishByParaImpl implements SelectOrderNotFinishByPara {
    @Override
    public List<OrderForm> selectOrderNotFinishByPara(Map map){
        SqlSession sqlSession= MybatisUtils.getSession();
        return sqlSession.selectList("mapper.OrderMapper.selectOrderNotFinishByPara",map);
    }
}
