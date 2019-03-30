import com.jzd.dao.CustomerMapper;
import com.jzd.dao.DeptMapper;
import com.jzd.pojo.Customer;
import com.jzd.pojo.Dept;
import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;
import java.util.UUID;

//导入Springtest

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations ={"classpath:applicationContext.xml"})
public class MapperTest {
    @Autowired
    DeptMapper dept;
    @Autowired
    CustomerMapper customerMapper;
    @Autowired
    SqlSession sqlSession;
    @Test
    public void test(){
        //测试 dept 数据
        //spring 项目推荐使用 spring 单元测试，可以自动注入需要的组件
        // 1 创建springIOC容器
        // 2从容器中获取mapper
        //原生测试  ApplicationContext ioc= new ClassPathXmlApplicationContext("applicationContext.xml");
        //          deptMapper dp= ioc.getBean(deptMapper.class);
        System.out.println(customerMapper);
        // 插入数据样式
        // customerMapper.insertSelective(new Customer(null,"rotk",null,7,"1","7","3",null,null,null,null,null,null));
        // 执行批量操作
//        CustomerMapper cmapper= sqlSession.getMapper(CustomerMapper.class);
//        for (int i = 0; i < 3; i++) {
//          String uid=  UUID.randomUUID().toString().substring(0,4);
//            cmapper.insertSelective(new Customer(null,uid,null,7,"1","7","3",null,null,null,null,null,null));
//            System.out.println("批量完成");
//        List<Customer> customers = customerMapper.selectCustomerList(new Customer());
//        System.out.println(customers);

//        }

    }
}
