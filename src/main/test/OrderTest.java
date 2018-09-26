import com.yyh.bookshop.mapper.BookMapper;
import com.yyh.bookshop.mapper.CartMapper;
import com.yyh.bookshop.mapper.OrderDetailMapper;
import com.yyh.bookshop.mapper.OrderMapper;
import com.yyh.bookshop.pojo.Book;
import com.yyh.bookshop.pojo.Cart;
import com.yyh.bookshop.pojo.Order;
import com.yyh.bookshop.pojo.OrderDetail;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
//告诉junit spring配置文件
@ContextConfiguration("classpath:applicationContext.xml")
public class OrderTest {

    @Autowired
    CartMapper cartMapper;

    @Autowired
    BookMapper bookMapper;

    @Autowired
    OrderMapper orderMapper;

    @Autowired
    OrderDetailMapper orderDetailMapper;

    @Test
    public void selectForOrder(){
        List<Cart> carts = cartMapper.queryForOrder(2);
        for (Cart cart:carts){
            System.out.print("  id:" + cart.getId());
            System.out.print("  num:" + cart.getNum());
            System.out.print("  书名:" + cart.getBook().getName());
            System.out.print("  价格:" + cart.getBook().getNowPrice());
            System.out.print("  userID:" + cart.getUser().getId());
            System.out.print("  姓名:" + cart.getUser().getRealname());
            System.out.print("  地址:" + cart.getUser().getAddress());
            System.out.println();
        }
    }


    @Test
    public void orderId(){
        SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMdd_HHmmss");
        String date = sdf.format(new Date());
        System.out.println(date);
    }

    @Test
    public void queryBook(){
        Book book = bookMapper.selectByPKID(16);
        System.out.println(book.toString());
    }

    @Test
    public void queryOrder(){
        List<Order> orders = orderMapper.queryOrderByUserId(10);
        for(Order o:orders){
            for (OrderDetail od:o.getOrderDetails()){
                /*System.out.print("  num:"+od.getNum());
                System.out.print("  bookId:"+od.getBookId());*/
                Book book = bookMapper.selectByPKID(od.getBookId());
                //System.out.print("  name:"+ book.getName());
                od.setBook(book);
                System.out.print(od.toString());
                System.out.println();
            }

            System.out.print("  id:" +  o.getId());
            System.out.print("  orderId:" + o.getOrderId());
            System.out.print("  userID:" + o.getUserId());
            System.out.print("  姓名:" + o.getRecName());
            System.out.print("  地址:" + o.getAddress());
            System.out.println();
        }

    }

    @Test
    public void orders(){
        List<Order> orders = orderMapper.queryOrders("张");
        for (Order o:orders){
            System.out.println(o.toString());
        }
    }
}
