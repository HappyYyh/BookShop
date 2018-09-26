package com.yyh.bookshop.service.impl;

import com.yyh.bookshop.mapper.UserMapper;
import com.yyh.bookshop.pojo.User;
import com.yyh.bookshop.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    UserMapper userMapper;

    @Override
    public User login(String condition) {
        return userMapper.selectUsernameOrEmail(condition);
    }

    @Override
    public Map<String, Object> beforeAdd(String username) {
        Map<String, Object> map = new HashMap();
        int count = userMapper.selectByUsername(username);
        if(0==count){
            map.put("msg","可以注册");
            map.put("status",200);
        }else {
            map.put("msg","已存在用户");
            map.put("status",404);
        }
        return map;
    }

    @Override
    public void add(User user) {
        userMapper.add(user);
    }

    @Override
    public User beforeUpdate(Integer id) {
        return userMapper.selectByPKId(id);
    }

    @Override
    public void update(User user) {
        userMapper.update(user);
    }

    @Override
    public List<User> USERS(User user) {
        return userMapper.selectUsers(user);
    }

    @Override
    public void delete(Integer id) {
        userMapper.delete(id);
    }
}
