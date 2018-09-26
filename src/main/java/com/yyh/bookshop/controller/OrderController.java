package com.yyh.bookshop.controller;

import com.yyh.bookshop.pojo.Order;
import com.yyh.bookshop.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/Order")
public class OrderController {

    @Autowired
    OrderService orderService;

    /**
     * 下订单
     * @param session
     * @return
     */
    @RequestMapping("/Add")
    public String AddOrder(HttpSession session, Order order){
        Integer userId = (Integer) session.getAttribute("userId");
        order.setUserId(userId);
        orderService.add(order);
        //下完订单以后注销session
        session.removeAttribute("price");
        return "redirect:/Order/Query";
    }

    /**
     * 查看个人订单
     * @param session
     * @param model
     * @return
     */
    @RequestMapping("/Query")
    public String QueryOrder(HttpSession session, Model model){
        Integer userId = (Integer) session.getAttribute("userId");
        List<Order> orders = orderService.queryOrdersByUserId(userId);
        model.addAttribute("orders",orders);
        return "UserOrder";
    }
}
