package com.yyh.bookshop.service.impl;

import com.yyh.bookshop.mapper.CartMapper;
import com.yyh.bookshop.pojo.Cart;
import com.yyh.bookshop.service.CartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.*;

@Service
public class CartServiceImpl implements CartService {

    @Autowired
    CartMapper cartMapper;

    @Override
    public List<Cart> list(Integer userId) {
        return cartMapper.list(userId);
    }

    @Override
    public List<Double> getSum(List<Cart> list) {
        double sum = 0;//原价
        double nowSum = 0;//折后价
        double goods=0;//商品数量
        List<Double> info = new ArrayList<>();
        for (Cart c:list){
            sum+=c.getNum()*c.getBook().getPrice();
            nowSum+=c.getNum()*c.getBook().getNowPrice();
            goods+=c.getNum();
        }
        double discount = nowSum/sum;
        info.add(sum);
        info.add(nowSum);
        info.add(discount);
        info.add(goods);
        return info;
    }

    @Override
    public void add(Cart cart) {
        //1、首先查询是否存在该商品
        Cart c =cartMapper.selectByBookID(cart.getBookId(),cart.getUserId());
        if(c==null){
            //2、如果不存在，则进行添加操作
            cartMapper.add(cart);
        }else {
            System.out.println(c.toString());
            //3、如果存在，则进行修改操作
            c.setNum(c.getNum()+cart.getNum());//原先的加上要添加的
            cartMapper.update(c);
        }
    }

    @Override
    public void deleteOne(Integer id) {
        cartMapper.deleteOne(id);
    }

    @Override
    public void deleteAll(Integer id) {
        cartMapper.deleteAll(id);
    }

    @Override
    public Map<String, Object> queryForOrder(Integer userId) {
        Map<String, Object> map = new HashMap<>();
        //生成orderid，规则是时间+用户id
        SimpleDateFormat sdf= new SimpleDateFormat("yyyyMMddHHmmss");
        //id为两位数
        String id =userId<10?("0"+userId):userId.toString();

        String orderId = sdf.format(new Date())+id;
        map.put("orderId",orderId);
        //数据显示
        List<Cart> carts = cartMapper.queryForOrder(userId);
        map.put("forOrder",carts);
        return map;
    }
}
