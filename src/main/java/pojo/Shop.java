package pojo;

/**
 * @author ZAY
 */
public class Shop {
    private int sid;
    private String sname;
    private String password;
    private String realname;
    private String idcard;
    private String phone;
    private String address;
    public void setSid(int sid) {
        this.sid = sid;
    }
    public void setSname(String sname) {
        this.sname = sname;
    }
    public void setPassword(String password) {
        this.password = password;
    }
    public void setRealname(String realname) {
        this.realname = realname;
    }
    public void setIdcard(String idcard) {
        this.idcard = idcard;
    }
    public void setPhone(String phone) {
        this.phone = phone;
    }
    public void setAddress(String address) {
        this.address = address;
    }
    public int getSid() {
        return sid;
    }
    public String getSname() {
        return sname;
    }
    public String getPassword() {
        return password;
    }
    public String getRealname() {
        return realname;
    }
    public String getIdcard() {
        return idcard;
    }
    public String getPhone() {
        return phone;
    }
    public String getAddress() {
        return address;
    }
    @Override
    public String toString() {
        return "Shop{" +
                "sid=" + sid +
                ", sname='" + sname + '\'' +
                '}';
    }
}
