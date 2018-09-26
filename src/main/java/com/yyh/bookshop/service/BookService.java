package com.yyh.bookshop.service;

import com.yyh.bookshop.pojo.Book;

import java.util.List;

public interface BookService {

    List<Book> BOOKS(Book book);//查询书籍列表

    void add(Book book);//添加书籍

    void delete(Integer id);//删除书籍

    void update(Book book);//修改书籍

    Book BeforeUpdate(Integer id);//修改之前信息显示

    List<Book> SaleBooks(Integer num);//查询热卖图书

    List<Book> RecommendBooks(Integer num);//查询推荐图书

    List<Book> NameOrIsbn(String condition);//
}
