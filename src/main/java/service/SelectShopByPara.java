package service;

import pojo.Shop;
import java.util.List;

/**
 * @author ZAY
 */
public interface SelectShopByPara {
    List<Shop> selectShopByShop(Shop shop);
}
