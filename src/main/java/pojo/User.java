package pojo;

/**
 * @author ZAY
 */
public class User {
    private int uid;
    private String uname;
    private String password;
    private String realname;
    private String idcard;
    private String phone;
    private String address;
    public void setUid(int uid) {
        this.uid = uid;
    }
    public void setUname(String uname) {
        this.uname = uname;
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
    public int getUid() {
        return uid;
    }
    public String getUname() {
        return uname;
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
        return "User{" +
                "uid=" + uid +
                ", uname='" + uname + '\'' +
                ", realname='" + realname + '\'' +
                '}';
    }
}
