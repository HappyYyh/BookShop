package com.yyh.bookshop.service;

import com.yyh.bookshop.pojo.SmallCategory;

import java.util.List;

public interface SmallCategoryService {

    List<SmallCategory> queryByBid(Integer bid);
}
