package service;

import pojo.OrderItem;
import java.util.List;
import java.util.Map;

/**
 * @author ZAY
 */
public interface SelectOrderItemByOfid {
    List<OrderItem> selectOrderItemByOfid(Map ofid);
}
