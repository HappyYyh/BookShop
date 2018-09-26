package com.yyh.bookshop.pojo;

import java.util.Date;

public class User {
    private Integer id;
    private String  username; //用户名
    private String  password; //密码
    private String  email;    //邮箱
    private String  realname; //姓名
    private Integer sex;      //性别（1位）
    private Date    birthday; //出身日期
    private String  address;  //地址
    private String  postcode; //邮编
    private String  phone;    //电话（11位）
    private Integer status;   //状态（1位）
    private Date    addDate;  //注册日期
    //查询注册日期区间
    private Date    startDate;
    private Date    endDate;

    public User(Integer id, String username, String password, String email, String realname, Integer sex, Date birthday, String address, String postcode, String phone, Integer status, Date addDate) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.email = email;
        this.realname = realname;
        this.sex = sex;
        this.birthday = birthday;
        this.address = address;
        this.postcode = postcode;
        this.phone = phone;
        this.status = status;
        this.addDate = addDate;
    }

    public User(String username, String password, String email, String realname) {
        this.username = username;
        this.password = password;
        this.email = email;
        this.realname = realname;
    }

    public User() {
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getRealname() {
        return realname;
    }

    public void setRealname(String realname) {
        this.realname = realname;
    }

    public Integer getSex() {
        return sex;
    }

    public void setSex(Integer sex) {
        this.sex = sex;
    }

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPostcode() {
        return postcode;
    }

    public void setPostcode(String postcode) {
        this.postcode = postcode;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Date getAddDate() {
        return addDate;
    }

    public void setAddDate(Date addDate) {
        this.addDate = addDate;
    }

    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", email='" + email + '\'' +
                ", realname='" + realname + '\'' +
                ", sex=" + sex +
                ", birthday=" + birthday +
                ", address='" + address + '\'' +
                ", postcode='" + postcode + '\'' +
                ", phone=" + phone +
                ", status=" + status +
                ", addDate=" + addDate +
                '}';
    }
}
