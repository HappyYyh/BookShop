package com.yyh.bookshop.service.impl;

import com.yyh.bookshop.mapper.SmallCategoryMapper;
import com.yyh.bookshop.pojo.SmallCategory;
import com.yyh.bookshop.service.SmallCategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SmallCategoryServiceImpl implements SmallCategoryService {

    @Autowired
    SmallCategoryMapper smallCategoryMapper;

    @Override
    public List<SmallCategory> queryByBid(Integer bid) {
        return smallCategoryMapper.selectByBid(bid);
    }
}
