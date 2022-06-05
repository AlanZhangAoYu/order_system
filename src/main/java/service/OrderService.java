package service;

import mapper.OrderMapper;
import org.springframework.stereotype.Service;
import pojo.OrderForm;
import pojo.OrderItem;
import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * @author XL
 */
@Service
public class OrderService {
    @Resource
    private OrderMapper orderMapper;
    public List<OrderForm> selectAllOrder(){
        return orderMapper.selectAllOrder();
    }
    public List<OrderForm> selectOrderByPara(Map<String,Object> map){
        return orderMapper.selectOrderByPara(map);
    }
    public List<OrderItem> selectOrderItemByOfid(Map<String,Object> ofid){
        return orderMapper.selectOrderItemByOfid(ofid);
    }
    public List<OrderForm> selectOrderNotFinishByPara(Map<String,Object> map){
        return orderMapper.selectOrderNotFinishByPara(map);
    }
    public int insertOrderItem(Map<String,Object> map){
        return orderMapper.insertOrderItem(map);
    }
    public int insertOrder(Map<String,Object> map){
        return orderMapper.insertOrder(map);
    }
    public int updateOrderStateByOfid(Map<String,Object> map){
        return orderMapper.updateOrderStateByOfid(map);
    }
}
