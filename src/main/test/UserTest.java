import com.yyh.bookshop.mapper.ManagerMapper;
import com.yyh.bookshop.mapper.UserMapper;
import com.yyh.bookshop.pojo.Manager;
import com.yyh.bookshop.pojo.User;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
//告诉junit spring配置文件
@ContextConfiguration("classpath:applicationContext.xml")
public class UserTest {

    @Autowired
    ManagerMapper managerMapper;

    @Autowired
    UserMapper userMapper;

    @Test
    public void ManagerLogin(){
        Manager manager =managerMapper.selectName("admin");
        System.out.println(manager.toString());
    }

    @Test
    public void UserLogin(){
        User user =userMapper.selectUsernameOrEmail("张三@qq.com");
        System.out.println(user.toString());
    }

    @Test
    public void BeforeUserAdd(){
        int count = userMapper.selectByUsername("李四1");
        System.out.println(count);
    }

    @Test
    public void UserAdd(){
        User user =new User("wangwu","123","wangwu@qq.com","李四");
        userMapper.add(user);
    }

    @Test
    public void Users(){
        User user = new User();
        //user.setUsername("i");
        //user.setStatus(2);
        //user.setStartDate("");
        List<User> users = userMapper.selectUsers(user);
        for(User u:users){
            System.out.println(u.toString());
        }
    }

    @Test
    public void update(){
        User user = new User();
        user.setPhone("17314111222");
        user.setId(1);
        userMapper.update(user);
    }
}
