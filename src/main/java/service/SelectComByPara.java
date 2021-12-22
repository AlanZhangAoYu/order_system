package service;

import pojo.Com;
import java.util.List;
import java.util.Map;

/**
 * @author ZAY
 */
public interface SelectComByPara {
    List<Com> selectComByPara(Map paraMap);
}
