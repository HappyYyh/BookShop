package com.yyh.bookshop.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.yyh.bookshop.pojo.Book;
import com.yyh.bookshop.pojo.Manager;
import com.yyh.bookshop.pojo.Order;
import com.yyh.bookshop.pojo.User;
import com.yyh.bookshop.service.BookService;
import com.yyh.bookshop.service.ManagerService;
import com.yyh.bookshop.service.OrderService;
import com.yyh.bookshop.service.UserService;
import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

@Controller
@RequestMapping("/Manager")
//不能用manager
public class ManagerController {

    @Autowired
    ManagerService managerService;

    @Autowired
    UserService userService;

    @Autowired
    BookService bookService;

    @Autowired
    OrderService orderService;

    /**
     * 管理员登陆
     *
     * @param username:用户名
     * @param password:密码
     * @return msg:信息，status:状态
     */
    @RequestMapping("/login")
    @ResponseBody
    public Map<String, Object> login(String username, String password, HttpSession session) {
        Map<String, Object> map = new HashMap<>();
        Manager manager = managerService.login(username);
        if (null == manager) {
            map.put("msg", "该账户不存在");
            map.put("status", 1);
        } else {
            if (!password.equals(manager.getPassword())) {
                map.put("msg", "密码错误");
                map.put("status", 2);
            } else {
                map.put("msg", "登陆成功");
                map.put("status", 3);
                session.setAttribute("Manager_name", manager.getUsername());
            }
        }
        return map;
    }

    /**
     * 注销
     *
     * @param request
     * @return
     */
    @RequestMapping("/logout")
    public String logout(HttpServletRequest request) {
        HttpSession session = request.getSession();
        session.removeAttribute("Manager_name");
        return "redirect:/Book/toIndex";
    }

    /**
     * 用户列表
     *
     * @param pn:当前页码
     * @param user：查询条件
     * @param model
     * @return
     */
    @RequestMapping("/Users")
    public String Users(@RequestParam(value = "pn", defaultValue = "1") Integer pn,
                        User user, Model model) {
        PageHelper.startPage(pn, 5);
        List<User> users = userService.USERS(user);
        PageInfo pageInfo = new PageInfo(users, 5);
        model.addAttribute("pageInfo", pageInfo);
        //用户查询条件回调
        model.addAttribute("user",user);
        return "admin/user_list";
    }

    /**
     * 账户冻结和解锁
     * @param id
     * @return
     */
    @RequestMapping("/UserLock")
    public String UserLock(Integer id) {
        //首先查询出信息
        User user = userService.beforeUpdate(id);
        if (user.getStatus() == 1) {
            //如果之前是正常，则锁定账户
            user.setStatus(2);
        } else {
            //如果之前是冻结，则解锁账户
            user.setStatus(1);
        }
        userService.update(user);
        return "redirect:/Manager/Users";
    }

    /**
     * 删除用户
     * @param id
     * @return
     */
    @RequestMapping("/UserDel")
    public String UserDel(Integer id) {
        userService.delete(id);
        return "redirect:/Manager/Users";
    }

    /**
     * 图书列表
     *
     * @param pn  ：页码数
     * @param book
     * @param model
     * @return
     */
    @RequestMapping("/Books")
    public String Books(@RequestParam(value = "pn", defaultValue = "1") Integer pn,
                        Book book, Model model) {
        PageHelper.startPage(pn, 5);
        List<Book> books = bookService.BOOKS(book);
        PageInfo pageInfo = new PageInfo(books, 5);
        model.addAttribute("pageInfo", pageInfo);
        //回调查询条件
        model.addAttribute("book",book);
        return "admin/book_list";
    }

    /**
     *  管理图书的推荐
     * @param pn
     * @param book
     * @param model
     * @return
     */
    @RequestMapping("/BookManage")
    public String BookManage(@RequestParam(value = "pn", defaultValue = "1") Integer pn,
                        Book book, Model model) {
        PageHelper.startPage(pn, 5);
        List<Book> books = bookService.BOOKS(book);
        PageInfo pageInfo = new PageInfo(books, 5);
        model.addAttribute("pageInfo", pageInfo);
        //回调查询条件
        model.addAttribute("book",book);
        return "admin/book_manage";
    }

    /**
     * 书籍添加
     * @param file ：文件
     * @param book
     * @param session
     * @return
     * @throws IOException
     */
    @RequestMapping("/BookAdd")
    public String BookAdd(@RequestParam("File") MultipartFile file,
                          Book book, HttpSession session) throws IOException {
        String fileName = file.getOriginalFilename();
        if (!fileName.equals("")) {
            //创建新文件名，为了防止用户提交的文件名有重复，所以用UUID+后缀名来构成新的文件名（UUID几乎不会重复）
            String newFileName = UUID.randomUUID().toString() + fileName.substring(fileName.lastIndexOf("."));
            //为了防止tomcat重启文件消失，把图片存放在硬盘中
            File newFile = new File("D:\\Dev-Tools\\imgs\\" + newFileName);
            //文件复制
            FileUtils.copyInputStreamToFile(file.getInputStream(), newFile);
            //把存放数据库的model中的photo赋值
            book.setPhoto(newFileName);

        }
        bookService.add(book);
        return "redirect:/Manager/Books";
    }

    /**
     * 删除书籍
     * @param id
     * @return
     */
    @RequestMapping("/BookDelete")
    public String BookDelete(Integer id){
        bookService.delete(id);
        return "redirect:/Manager/Books";
    }

    /**
     * 修改之前信息显示
     * @param id
     * @return
     */
    @RequestMapping("/BeforeUpdate")
    public String BeforeUpdate(Integer id,Model model){
        Book book = bookService.BeforeUpdate(id);
        model.addAttribute("book",book);
        return "admin/book_update";
    }

    /**
     * 书籍信息修改
     * @param book
     * @return
     */
    @RequestMapping("/BookUpdate")
    public String BookUpdate(Book book){
        bookService.update(book);
        return "redirect:/Manager/Books";
    }

    /**
     * 推送管理，修改推送
     * @param bookId
     * @param who
     * @return
     */
    @RequestMapping("/UpdateByBtn")
    public String BookManage(Integer bookId,Integer who){
        //查询出要修改的书籍
        Book book = bookService.BeforeUpdate(bookId);
        switch (who){
            case 1:
                if(book.getNewBook()==true){
                    book.setNewBook(false);
                }else {
                    book.setNewBook(true);
                }
                break;
            case 2:
                if(book.getSaleBook()==true){
                    book.setSaleBook(false);
                }else {
                    book.setSaleBook(true);
                }
                break;
            case 3:
                if(book.getSpecialBook()==true){
                    book.setSpecialBook(false);
                }else {
                    book.setSpecialBook(true);
                }
                break;
            case 4:
                if(book.getRecommendBook()==true){
                    book.setRecommendBook(false);
                }else {
                    book.setRecommendBook(true);
                }
                break;
        }
        bookService.update(book);
        return "redirect:/Manager/BookManage";
    }

    @RequestMapping("/Orders")
    public String Orders(@RequestParam(value = "pn",defaultValue = "1") Integer pn,
            String recName,Model model){
        PageHelper.startPage(pn,5);
        List<Order> orders = orderService.queryOrders(recName);
        PageInfo pageInfo = new PageInfo(orders,5);
        model.addAttribute("orders",pageInfo);
        //查询条件回显
        model.addAttribute("recName",recName);
        return "admin/order_list";
    }
}
