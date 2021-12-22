package service.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;
import pojo.OrderForm;
import service.SelectOrderByPara;
import util.MybatisUtils;
import java.util.List;
import java.util.Map;

/**
 * @author ZAY
 */
@Service
public class SelectOrderByParaImpl implements SelectOrderByPara {
    @Override
    public List<OrderForm> selectOrderByPara(Map map){
        SqlSession sqlSession= MybatisUtils.getSession();
        return sqlSession.selectList("mapper.OrderMapper.selectOrderByPara",map);
    }
}
