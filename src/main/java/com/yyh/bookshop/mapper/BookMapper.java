package com.yyh.bookshop.mapper;

import com.yyh.bookshop.pojo.Book;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface BookMapper {

    List<Book> BOOKS(Book book);//查询书籍列表

    void add(Book book);//增加

    void delete(Integer id);//删除

    void update(Book book);//修改

    Book selectByPKID(Integer id);//根据主键查询

    List<Book> selectSaleBook(Integer num);//查询热卖图书

    List<Book> selectRecommendBook(Integer num);//查询推荐图书

    List<Book> selectByName(@Param("condition") String condition);//根据isbn或者书名搜索
}
