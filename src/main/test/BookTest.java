import com.yyh.bookshop.mapper.BookMapper;
import com.yyh.bookshop.mapper.CartMapper;
import com.yyh.bookshop.pojo.Book;
import com.yyh.bookshop.pojo.Cart;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
//告诉junit spring配置文件
@ContextConfiguration("classpath:applicationContext.xml")
public class BookTest {

    @Autowired
    BookMapper bookMapper;

    @Autowired
    CartMapper cartMapper;

    @Test
    public void Books(){
        Book book = new Book();
        //book.setSuperType("网络文学");
        //book.setSubType("自然科学");
        //book.setName("自由");
        //book.setStartPrice(1.0);
        //book.setEndPrice(28.0);
        //book.setNewBook(true);
        book.setSaleBook(false);
        List<Book> books = bookMapper.BOOKS(book);
        for (Book b:books){
            System.out.println(b.getId()+"--"+b.getName());
        }
    }

    @Test
    public void update(){
        Book book = bookMapper.selectByPKID(24);
        book.setIntroduce("11111");
        bookMapper.update(book);
        System.out.println(book);
    }

    @Test
    public void SaleBook(){
        List<Book> books = bookMapper.selectSaleBook(6);
        for (Book b:books){
            System.out.println(b.getId()+"--"+b.getName()+"--"+b.getAddDate());
        }
    }

    @Test
    public void nameOrIsbn(){
        List<Book> books = bookMapper.selectByName("哈利");
        for (Book b:books){
            System.out.println(b.getId()+"--"+b.getName()+"--"+b.getAddDate());
        }
    }

    @Test
    public void Cart(){
        List<Cart> carts = cartMapper.list(1);
        for (Cart c:carts){
           /* System.out.println(c.getUserId()+"---"+c.getBookId()+"---"+c.getNum()
            +"---"+c.getBook().getName());*/
            System.out.println(c.toString());
        }
    }

    @Test
    public void cartAdd(){
        /*Cart c=new Cart();
        c.setUserId(2);
        c.setBookId(16);*/
        Cart cart = cartMapper.selectByBookID(2,1);
        System.out.println(cart.toString());
    }
}
