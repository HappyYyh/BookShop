package com.yyh.bookshop.service.impl;

import com.yyh.bookshop.mapper.ManagerMapper;
import com.yyh.bookshop.pojo.Manager;
import com.yyh.bookshop.service.ManagerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ManagerServiceImpl implements ManagerService {

    @Autowired
    ManagerMapper managerMapper;

    @Override
    public Manager login(String username) {
        return managerMapper.selectName(username);
    }
}
