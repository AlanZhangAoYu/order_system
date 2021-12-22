package pojo;

import java.math.BigDecimal;
/**
 * @author ZAY
 */
public class Com {
    private int cid;
    private String cname;
    private Shop shop;
    private BigDecimal price;
    private ComType comType;
    private String describe;
    private String imagePath;
    public void setCid(int cid) {
        this.cid = cid;
    }
    public void setCname(String cname) {
        this.cname = cname;
    }
    public void setShop(Shop shop) {
        this.shop = shop;
    }
    public void setPrice(BigDecimal price) {
        this.price = price;
    }
    public void setComType(ComType comType) {
        this.comType = comType;
    }
    public void setDescribe(String describe) {
        this.describe = describe;
    }
    public void setImagePath(String imagePath) {
        this.imagePath = imagePath;
    }
    public int getCid() {
        return cid;
    }
    public String getCname() {
        return cname;
    }
    public Shop getShop() {
        return shop;
    }
    public BigDecimal getPrice() {
        return price;
    }
    public ComType getComType() {
        return comType;
    }
    public String getDescribe() {
        return describe;
    }
    public String getImagePath() {
        return imagePath;
    }
}
