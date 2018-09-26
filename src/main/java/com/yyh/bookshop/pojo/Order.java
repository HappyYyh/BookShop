package com.yyh.bookshop.pojo;

import java.util.Date;
import java.util.List;

public class Order {
    private Integer  id;
    private String   orderId;   //订单号
    private Integer  userId;    //用户id
    private String   recName;   //收件人
    private String   address;   //地址
    private String   phone;     //电话
    private Integer  status;    //订单状态
    private Date     shipDate;  //发货日期
    private Date     orderDate; //订单日期

    //一对多
    private List<OrderDetail> orderDetails;


    public Order(String orderId, Integer userId, String recName, String address, String phone, Integer status, Date shipDate, Date orderDate) {
        this.orderId = orderId;
        this.userId = userId;
        this.recName = recName;
        this.address = address;
        this.phone = phone;
        this.status = status;
        this.shipDate = shipDate;
        this.orderDate = orderDate;
    }

    public Order() {
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getOrderId() {
        return orderId;
    }

    public void setOrderId(String orderId) {
        this.orderId = orderId;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getRecName() {
        return recName;
    }

    public void setRecName(String recName) {
        this.recName = recName;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
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

    public Date getShipDate() {
        return shipDate;
    }

    public void setShipDate(Date shipDate) {
        this.shipDate = shipDate;
    }

    public Date getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }

    public List<OrderDetail> getOrderDetails() {
        return orderDetails;
    }

    public void setOrderDetails(List<OrderDetail> orderDetails) {
        this.orderDetails = orderDetails;
    }


    @Override
    public String toString() {
        return "Order{" +
                "id=" + id +
                ", orderId='" + orderId + '\'' +
                ", userId=" + userId +
                ", recName='" + recName + '\'' +
                ", address='" + address + '\'' +
                ", phone='" + phone + '\'' +
                ", status=" + status +
                ", shipDate=" + shipDate +
                ", orderDate=" + orderDate +
                ", orderDetails=" + orderDetails +
                '}';
    }
}
