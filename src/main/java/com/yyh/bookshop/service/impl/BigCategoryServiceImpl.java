package com.yyh.bookshop.service.impl;

import com.yyh.bookshop.mapper.BigCategoryMapper;
import com.yyh.bookshop.pojo.BigCategory;
import com.yyh.bookshop.service.BigCategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BigCategoryServiceImpl implements BigCategoryService {

    @Autowired
    BigCategoryMapper bigCategoryMapper;

    @Override
    public List<BigCategory> query() {
        return bigCategoryMapper.selectAll();
    }
}
