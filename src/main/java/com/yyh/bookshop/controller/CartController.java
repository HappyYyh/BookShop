package com.yyh.bookshop.controller;

import com.yyh.bookshop.pojo.Cart;
import com.yyh.bookshop.service.CartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/Cart")
public class CartController {

    @Autowired
    CartService cartService;

    /**
     * 查询购物车列表
     * @param session
     * @param model
     * @return
     */
    @RequestMapping("/List")
    public String CartList(HttpSession session, Model model){
        Integer userId = (Integer) session.getAttribute("userId");
        //如果用户未登陆
        if(null==userId){
            model.addAttribute("msg","请登录后再添加物品");
            return "login";
        }
        List<Cart> list = cartService.list(userId);
        //计算价格
        List<Double> price = cartService.getSum(list);
        session.setAttribute("price",price);
        model.addAttribute("cart",list);
        return "cart";
    }

    /**
     * 添加商品到购物车
     * @param cart
     * @param session
     * @param model
     * @return
     */
    @RequestMapping("/Add")
    public String add(Cart cart,HttpSession session, Model model){
        Integer userId = (Integer) session.getAttribute("userId");
        //如果用户未登陆
        if(null==userId){
            model.addAttribute("msg","请登录后再添加物品");
            return "login";
        }
        cart.setUserId(userId);
        System.out.println(cart.toString());
        cartService.add(cart);

        return "redirect:/Cart/List";
    }

    /**
     * 删除单个
     * @param id
     */
    @RequestMapping("/deleteOne")
    @ResponseBody
    public void deleteOne(Integer id){
        cartService.deleteOne(id);
    }

    /**
     * 清空购物车
     * @param session
     * @param model
     * @return
     */
    @RequestMapping("/deleteAll")
    public String deleteAll(HttpSession session,Model model){
        Integer userId = (Integer) session.getAttribute("userId");
        cartService.deleteAll(userId);
        session.removeAttribute("price");
        return "toIndex";
    }

    @RequestMapping("/toOrder")
    public String toOrder(HttpSession session,Model model){
        //购物车页面已经登陆过了
        Integer userId = (Integer) session.getAttribute("userId");
        Map<String, Object> map = cartService.queryForOrder(userId);
        model.addAttribute("OrderInfo",map);
        return "order";
    }


}
