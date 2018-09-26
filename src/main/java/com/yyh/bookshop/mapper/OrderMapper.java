package com.yyh.bookshop.mapper;

import com.yyh.bookshop.pojo.Order;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface OrderMapper {

    void add(Order order);

    List<Order> queryOrderByUserId(Integer userId);//根据用户查询订单

    List<Order> queryOrders(@Param("condition") String recName);//查看所有订单
}
