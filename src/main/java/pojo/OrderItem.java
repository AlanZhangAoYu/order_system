package pojo;

import java.math.BigDecimal;

/**
 * @author ZAY
 */
public class OrderItem {
    private OrderForm orderForm;
    private Com com;
    private int num;
    private BigDecimal price;
    private String tips;
    public void setOrderForm(OrderForm orderForm) {
        this.orderForm = orderForm;
    }
    public void setCom(Com com) {
        this.com = com;
    }
    public void setNum(int num) {
        this.num = num;
    }
    public void setPrice(BigDecimal price) {
        this.price = price;
    }
    public void setTips(String tips) {
        this.tips = tips;
    }
    public OrderForm getOrderForm() {
        return orderForm;
    }
    public Com getCom() {
        return com;
    }
    public int getNum() {
        return num;
    }
    public BigDecimal getPrice() {
        return price;
    }
    public String getTips() {
        return tips;
    }
}
