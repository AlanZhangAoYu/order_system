package service;

import mapper.ComMapper;
import org.springframework.stereotype.Service;
import pojo.Com;
import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * @author XL
 */
@Service
public class ComService {
    @Resource
    private ComMapper comMapper;
    public List<Com> selectAllCom(){
        return comMapper.selectAllCom();
    }
    public List<Com> selectComByPara(Map<String,Object> paraMap){
        return comMapper.selectComByPara(paraMap);
    }
    public int insertCom(Map<String,Object> map){
        return comMapper.insertCom(map);
    }
    public int updateComByCid(Map<String,Object> map){
        return comMapper.updateComByCid(map);
    }
    public int deleteComByCid(Map<String,Object> map) {
        return comMapper.deleteComByCid(map);
    }
}
