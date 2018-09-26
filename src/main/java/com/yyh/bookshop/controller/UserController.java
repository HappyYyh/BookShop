package com.yyh.bookshop.controller;

import com.yyh.bookshop.pojo.User;
import com.yyh.bookshop.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Map;

@RequestMapping("/User")
@Controller
public class UserController {

    @Autowired
    UserService userService;

    /**
     * 用户登陆
     * @param condition:用户名/邮箱
     * @param password:密码
     * @return msg:信息，status:状态
     */
    @RequestMapping("/login")
    @ResponseBody
    public Map<String,Object> login(String condition, String password, HttpSession session){
        Map<String,Object> map = new HashMap<>();
        User user = userService.login(condition);
        if(null==user){
            map.put("status",1);
            map.put("msg","该账户不存在");
        }else {
            if(!password.equals(user.getPassword())){
                map.put("status",2);
                map.put("msg","密码错误");
            }else if(user.getStatus()==2){
                map.put("status",3);
                map.put("msg","账户已被冻结，请联系管理员解封");
            }else{
                map.put("status",4);
                map.put("msg","登陆成功");
                session.setAttribute("username",user.getUsername());
                session.setAttribute("userId",user.getId());
            }
        }
        return map;
    }

    /**
     * 注销
     * @param request
     * @return
     */
    @RequestMapping("/logout")
    public String logout(HttpServletRequest request){
        HttpSession session = request.getSession();
        session.removeAttribute("username");
        session.removeAttribute("userId");
        return "redirect:/Book/toIndex";
    }

    /**
     * 注册之前查询用户是否已经存在
     * @param username
     * @return
     */
    @RequestMapping("/beforeAdd")
    @ResponseBody
    public Map<String,Object> beforeAdd(String username){
        return userService.beforeAdd(username);
    }

    /**
     * 注册
     * @param user
     */
    @RequestMapping("/Register")
    public String add(User user){
        System.out.println(user.toString());
        userService.add(user);
        return "redirect:/Book/toIndex";
    }

    /**
     * 修改之前信息回显
     * @param request
     * @return
     */
    @RequestMapping("/beforeUpdate")
    @ResponseBody
    public User beforeUpdate(HttpServletRequest request){
        Integer id = (Integer) request.getSession().getAttribute("userId");
        return userService.beforeUpdate(id);
    }

    /**
     * 信息修改
     * @param user
     * @return
     */
    @RequestMapping("/update")
    public String update(User user){
        userService.update(user);
        return "redirect:/Book/toIndex";
    }

}
