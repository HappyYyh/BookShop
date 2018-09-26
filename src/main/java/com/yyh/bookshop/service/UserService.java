package com.yyh.bookshop.service;

import com.yyh.bookshop.pojo.User;

import java.util.List;
import java.util.Map;

public interface UserService {

    User login(String condition);//用户登陆

    Map<String,Object> beforeAdd(String username);//注册前查询是否已经存在用户名

    void add(User user);//用户注册

    User beforeUpdate(Integer id);//修改之前信息回显

    void update(User user);//修改信息

    List<User> USERS(User user);//查询用户信息

    void delete(Integer id);//删除
}
