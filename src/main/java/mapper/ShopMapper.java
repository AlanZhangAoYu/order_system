package mapper;

import org.apache.ibatis.annotations.Mapper;
import pojo.Shop;
import java.util.List;
import java.util.Map;

/**
 * @author XL
 */
@Mapper
public interface ShopMapper {
    List<Shop> selectAllShop();
    List<Shop> selectShopByPara(Shop shop);
    int insertShop(Shop shop);
    int updateShopBySid(Shop shop);
    int deleteShopBySid(Map<String,Object> map);
}
