package mapper;

import org.apache.ibatis.annotations.Mapper;
import pojo.Com;
import java.util.List;
import java.util.Map;

/**
 * @author XL
 */
@Mapper
public interface ComMapper {
    List<Com> selectAllCom();
    List<Com> selectComByPara(Map<String,Object> paraMap);
    int insertCom(Map<String,Object> map);
    int updateComByCid(Map<String,Object> map);
    int deleteComByCid(Map<String,Object> map);
}
