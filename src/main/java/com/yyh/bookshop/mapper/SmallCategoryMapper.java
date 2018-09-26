package com.yyh.bookshop.mapper;

import com.yyh.bookshop.pojo.SmallCategory;

import java.util.List;

public interface SmallCategoryMapper {

    List<SmallCategory> selectByBid(Integer bid);
}
