package com.yyh.bookshop.mapper;

import com.yyh.bookshop.pojo.Manager;

public interface ManagerMapper {

    Manager selectName(String username);//查询用户名
}
