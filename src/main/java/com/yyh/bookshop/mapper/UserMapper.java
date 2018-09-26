package com.yyh.bookshop.mapper;

import com.yyh.bookshop.pojo.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserMapper {

    User selectUsernameOrEmail(@Param("condition") String condition);

    void add(User user);

    User selectByPKId(Integer id);

    void update(User user);

    int selectByUsername(String username);//查询是否存在

    List<User> selectUsers(User user);//查询用户列表

    void delete(Integer id);//删除
}
