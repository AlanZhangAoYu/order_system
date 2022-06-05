package mapper;

import org.apache.ibatis.annotations.Mapper;
import pojo.OrderForm;
import pojo.OrderItem;
import java.util.List;
import java.util.Map;

/**
 * @author XL
 */
@Mapper
public interface OrderMapper {
    List<OrderForm> selectAllOrder();
    List<OrderItem> selectOrderItemByOfid(Map<String,Object> map);
    List<OrderForm> selectOrderByPara(Map<String,Object> map);
    List<OrderForm> selectOrderNotFinishByPara(Map<String,Object> map);
    int insertOrder(Map<String,Object> map);
    int insertOrderItem(Map<String,Object> map);
    int updateOrderStateByOfid(Map<String,Object> map);
}
