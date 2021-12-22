package service.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;
import pojo.Shop;
import service.InsertShop;
import util.MybatisUtils;

/**
 * @author ZAY
 */
@Service
public class InsertShopImpl implements InsertShop {
    @Override
    public int insertShop(Shop shop){
        SqlSession sqlSession= MybatisUtils.getSession();
        int row= sqlSession.insert("mapper.ShopMapper.insertShop",shop);
        sqlSession.commit();
        return row;
    }
}
