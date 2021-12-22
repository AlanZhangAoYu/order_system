package service.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;
import service.SelectAllCom;
import pojo.Com;
import util.MybatisUtils;
import java.util.List;

/**
 * @author ZAY
 */
@Service
public class SelectAllComImpl implements SelectAllCom {
    @Override
    public List<Com> selectAllCom(){
        final SqlSession sqlSession= MybatisUtils.getSession();
        return sqlSession.selectList("mapper.ComMapper.selectAllCom");
    }
}
