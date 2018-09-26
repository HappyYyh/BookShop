package com.yyh.bookshop.service.impl;

import com.yyh.bookshop.mapper.BookMapper;
import com.yyh.bookshop.mapper.CartMapper;
import com.yyh.bookshop.mapper.OrderDetailMapper;
import com.yyh.bookshop.mapper.OrderMapper;
import com.yyh.bookshop.pojo.Book;
import com.yyh.bookshop.pojo.Cart;
import com.yyh.bookshop.pojo.Order;
import com.yyh.bookshop.pojo.OrderDetail;
import com.yyh.bookshop.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class OrderServiceImpl implements OrderService {

    @Autowired
    OrderMapper orderMapper;

    @Autowired
    OrderDetailMapper orderDetailMapper;

    @Autowired
    CartMapper cartMapper;

    @Autowired
    BookMapper bookMapper;

    @Override
    public void add(Order order) {
        Integer userId = order.getUserId();
        //1、获取购物车中的信息
        List<Cart> carts = cartMapper.queryForOrder(userId);

        OrderDetail orderDetail = new OrderDetail();
        //2、循环 添加到订单详情
        for (Cart cart:carts){
            orderDetail.setNum(cart.getNum());
            orderDetail.setBookId(cart.getBookId());
            orderDetail.setOrderId(order.getOrderId());
            orderDetailMapper.add(orderDetail);
        }

        //3、添加 到订单
        orderMapper.add(order);

        //4、清空购物车
        cartMapper.deleteAll(userId);
    }

    @Override
    public List<Order> queryOrdersByUserId(Integer userId) {
        List<Order> orders = orderMapper.queryOrderByUserId(userId);
        for(Order o :orders){
            for(OrderDetail od:o.getOrderDetails()){
                //查询出书籍信息
                Book book = bookMapper.selectByPKID(od.getBookId());
                //放入OrderDetail
                od.setBook(book);
            }
        }
        return orders;
    }

    @Override
    public List<Order> queryOrders(String recName) {
        return orderMapper.queryOrders(recName);
    }


}
