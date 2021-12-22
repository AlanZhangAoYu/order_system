package service;

import pojo.OrderForm;
import java.util.List;
import java.util.Map;

/**
 * @author ZAY
 */
public interface SelectOrderByPara {
    List<OrderForm> selectOrderByPara(Map map);
}
