package service.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;
import service.DeleteShopBySid;
import util.MybatisUtils;
import java.util.Map;

/**
 * @author ZAY
 */
@Service
public class DeleteShopBySidImpl implements DeleteShopBySid {
    @Override
    public int deleteShopBySid(Map map){
        SqlSession sqlSession= MybatisUtils.getSession();
        int row= sqlSession.delete("mapper.ShopMapper.deleteShopBySid",map);
        sqlSession.commit();
        return row;
    }
}
