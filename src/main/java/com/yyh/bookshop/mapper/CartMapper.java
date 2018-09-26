package com.yyh.bookshop.mapper;

import com.yyh.bookshop.pojo.Cart;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CartMapper {

    List<Cart> list(Integer userId);//查看列表

    void deleteOne(Integer id);//单个删除

    void deleteAll(Integer userId);//删除全部

    void add(Cart cart);//添加

    void update(Cart cart);//修改

    Cart selectByBookID(@Param("bookId") Integer bookId, @Param("userId") Integer userId);


    List<Cart> queryForOrder(Integer userId);//下单之前显示信息
}
