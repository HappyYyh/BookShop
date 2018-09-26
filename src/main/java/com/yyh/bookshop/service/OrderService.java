package com.yyh.bookshop.service;

import com.yyh.bookshop.pojo.Order;


import java.util.List;


public interface OrderService {

    void add(Order order);

    List<Order> queryOrdersByUserId(Integer userId);//根据用户查询订单

    List<Order> queryOrders(String recName);//查看所有订单
}
