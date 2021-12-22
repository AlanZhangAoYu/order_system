package service.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;
import pojo.Com;
import service.InsertCom;
import util.MybatisUtils;
import java.util.Map;

/**
 * @author ZAY
 */
@Service
public class InsertComImpl implements InsertCom {
    @Override
    public int insertCom(Map map){
        SqlSession sqlSession= MybatisUtils.getSession();
        int row= sqlSession.insert("mapper.ComMapper.insertCom",map);
        sqlSession.commit();
        return row;
    }
}
