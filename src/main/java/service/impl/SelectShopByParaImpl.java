package service.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;
import pojo.Shop;
import service.SelectShopByPara;
import util.MybatisUtils;
import java.util.List;

/**
 * @author ZAY
 */
@Service
public class SelectShopByParaImpl implements SelectShopByPara {
    @Override
    public List<Shop> selectShopByShop(Shop shop){
        SqlSession sqlSession= MybatisUtils.getSession();
        return sqlSession.selectList("mapper.ShopMapper.selectShopByPara",shop);
    }
}
