package com.yyh.bookshop.service;

import com.yyh.bookshop.pojo.Cart;

import java.util.List;
import java.util.Map;

public interface CartService {

    List<Cart> list(Integer userId);//查询用户的购物车

    List<Double> getSum(List<Cart> list);//查询购物车列表 相关价格信息

    void add(Cart cart);//添加到购物车

    void deleteOne(Integer id);//删除单个

    void deleteAll(Integer id);//清空购物车

    Map<String,Object> queryForOrder(Integer userId);//生成订单信息
}
