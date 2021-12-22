package service.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;
import pojo.Shop;
import service.UpdateShopBySid;
import util.MybatisUtils;

/**
 * @author ZAY
 */
@Service
public class UpdateShopBySidImpl implements UpdateShopBySid {
    @Override
    public int updateShopBySid(Shop shop){
        SqlSession sqlSession= MybatisUtils.getSession();
        int row= sqlSession.update("mapper.ShopMapper.updateShopBySid",shop);
        sqlSession.commit();
        return row;
    }
}
