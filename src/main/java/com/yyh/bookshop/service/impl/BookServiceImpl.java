package com.yyh.bookshop.service.impl;

import com.yyh.bookshop.mapper.BookMapper;
import com.yyh.bookshop.pojo.Book;
import com.yyh.bookshop.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BookServiceImpl implements BookService {

    @Autowired
    BookMapper bookMapper;

    @Override
    public List<Book> BOOKS(Book book) {
        return bookMapper.BOOKS(book);
    }

    @Override
    public void add(Book book) {
        bookMapper.add(book);
    }

    @Override
    public void delete(Integer id) {
        bookMapper.delete(id);
    }

    @Override
    public void update(Book book) {
        bookMapper.update(book);
    }

    @Override
    public Book BeforeUpdate(Integer id) {
        return bookMapper.selectByPKID(id);
    }

    @Override
    public List<Book> SaleBooks(Integer num) {
        return bookMapper.selectSaleBook(num);
    }

    @Override
    public List<Book> RecommendBooks(Integer num) {
        return bookMapper.selectRecommendBook(num);
    }

    @Override
    public List<Book> NameOrIsbn(String condition) {
        return bookMapper.selectByName(condition);
    }
}
