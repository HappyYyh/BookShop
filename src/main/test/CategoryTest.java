import com.yyh.bookshop.mapper.BigCategoryMapper;
import com.yyh.bookshop.mapper.SmallCategoryMapper;
import com.yyh.bookshop.pojo.BigCategory;
import com.yyh.bookshop.pojo.SmallCategory;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
//告诉junit spring配置文件
@ContextConfiguration("classpath:applicationContext.xml")
public class CategoryTest {

    @Autowired
    BigCategoryMapper bigCategoryMapper;

    @Autowired
    SmallCategoryMapper smallCategoryMapper;

    @Test
    public void queryBig(){
        List<BigCategory> bigCategories = bigCategoryMapper.selectAll();
        for (BigCategory bigCategory:bigCategories){
            System.out.println(bigCategory.toString());
        }
    }

    @Test
    public void querySmall(){
        List<SmallCategory> smallCategories = smallCategoryMapper.selectByBid(2);
        for (SmallCategory s:smallCategories){
            System.out.println(s.toString());
        }
    }

}
