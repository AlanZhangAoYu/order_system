package pojo;

import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.Date;
/**
 * @author ZAY
 */
public class OrderForm {
    private int ofid;
    private User user;
    private Shop shop;
    private Timestamp date;
    private BigDecimal price;
    private State state;
    public void setOfid(int ofid) {
        this.ofid = ofid;
    }
    public void setUser(User user) {
        this.user = user;
    }
    public void setShop(Shop shop) {
        this.shop = shop;
    }
    public void setDate(Timestamp date) {
        this.date = date;
    }
    public void setPrice(BigDecimal price) {
        this.price = price;
    }
    public void setState(State state) {
        this.state = state;
    }
    public int getOfid() {
        return ofid;
    }
    public User getUser() {
        return user;
    }
    public Shop getShop() {
        return shop;
    }
    public Timestamp getDate() {
        return date;
    }
    public BigDecimal getPrice() {
        return price;
    }
    public State getState() {
        return state;
    }
}
