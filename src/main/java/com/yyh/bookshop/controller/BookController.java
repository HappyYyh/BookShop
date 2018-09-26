package com.yyh.bookshop.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.yyh.bookshop.pojo.Book;
import com.yyh.bookshop.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@RequestMapping("/Book")
public class BookController {

    @Autowired
    BookService bookService;

    /**
     * 进入首页，并放入书籍的信息
     * @param model
     * @return
     */
    @RequestMapping("/toIndex")
    public String toIndex(Model model){
        model.addAttribute("SaleBook",bookService.SaleBooks(6));
        model.addAttribute("RecommendBook",bookService.RecommendBooks(4));
        return "index";
    }

    /**
     * 书籍详情
     * @param id
     * @param model
     * @return
     */
    @RequestMapping("/detail")
    public String detail(Integer id,Model model){
        model.addAttribute("bookInfo",bookService.BeforeUpdate(id));
        return "detail";
    }

    /**
     * 查询书籍
     * @param pn
     * @param condition
     * @param model
     * @return
     */
    @RequestMapping("/Query")
    public String query(@RequestParam(value = "pn",defaultValue = "1")Integer pn,
            String condition,Model model){
        PageHelper.startPage(pn,6);
        List<Book> books = bookService.NameOrIsbn(condition);
        PageInfo pageInfo = new PageInfo(books,5);
        model.addAttribute("books",pageInfo);
        //查询条件回显
        model.addAttribute("condition",condition);
        return "books";
    }
}
