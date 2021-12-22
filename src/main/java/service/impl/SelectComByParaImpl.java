package service.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;
import pojo.Com;
import service.SelectComByPara;
import util.MybatisUtils;
import java.util.List;
import java.util.Map;

/**
 * @author ZAY
 */
@Service
public class SelectComByParaImpl implements SelectComByPara {
    @Override
    public List<Com> selectComByPara(Map paraMap){
        SqlSession sqlSession= MybatisUtils.getSession();
        return sqlSession.selectList("mapper.ComMapper.selectComByPara",paraMap);
    }
}
