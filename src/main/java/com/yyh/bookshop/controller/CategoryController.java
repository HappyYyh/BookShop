package com.yyh.bookshop.controller;

import com.yyh.bookshop.pojo.BigCategory;
import com.yyh.bookshop.pojo.SmallCategory;
import com.yyh.bookshop.service.BigCategoryService;
import com.yyh.bookshop.service.SmallCategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/Category")
public class CategoryController {

    @Autowired
    BigCategoryService bigCategoryService;

    @Autowired
    SmallCategoryService smallCategoryService;

    /**
     * 查看大类
     * @return
     */
    @RequestMapping("/Big")
    public List<BigCategory> queryBig(){
        return bigCategoryService.query();
    }

    /**
     * 查看小类
     * @param bid : 大类id
     * @return
     */
    @RequestMapping("/Small")
    public List<SmallCategory> queryByBid(Integer bid){
        return smallCategoryService.queryByBid(bid);
    }
}
