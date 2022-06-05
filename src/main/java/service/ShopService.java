package service;

import mapper.ShopMapper;
import org.springframework.stereotype.Service;
import pojo.Shop;
import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * @author XL
 */
@Service
public class ShopService {
    @Resource
    private ShopMapper shopMapper;
    public List<Shop> selectAllShop(){
        return shopMapper.selectAllShop();
    }
    public List<Shop> selectShopByShop(Shop shop){
        return shopMapper.selectShopByPara(shop);
    }
    public int insertShop(Shop shop){
        return shopMapper.insertShop(shop);
    }
    public int deleteShopBySid(Map<String,Object> map){
        return shopMapper.deleteShopBySid(map);
    }
    public int updateShopBySid(Shop shop){
        return shopMapper.updateShopBySid(shop);
    }
}
