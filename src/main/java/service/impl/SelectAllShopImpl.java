package service.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;
import pojo.Shop;
import java.util.List;
import service.SelectAllShop;
import util.MybatisUtils;
/**
 * @author ZAY
 */
@Service
public class SelectAllShopImpl implements SelectAllShop {
    @Override
    public List<Shop> selectAllShop(){
        final SqlSession sqlSession= MybatisUtils.getSession();
        return sqlSession.selectList("mapper.ShopMapper.selectAllShop");
    }
}
