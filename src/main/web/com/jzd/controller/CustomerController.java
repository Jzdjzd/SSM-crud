package com.jzd.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.jzd.pojo.Customer;
import com.jzd.pojo.Dept;
import com.jzd.pojo.Msg;
import com.jzd.service.CustomerService;
import com.jzd.service.DeptService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.filter.HttpPutFormContentFilter;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

//处理员工增删改查请求
@Controller
public class CustomerController {
    @Autowired
    CustomerService customerService;


    //    导入Jackson包
    @RequestMapping(value = "/customerJson")
    @ResponseBody
    public Msg getCustomerJson(@RequestParam(value = "pn", defaultValue = "1") Integer pn,String custLevel) {
        //引用分页插件PageHelper
        PageHelper.startPage(pn, 8);
        List<Customer> customer = customerService.getAll(custLevel);

        //使用pageinfo包装,包装后发送到页面即可
        //封装了详细的分页信息  连续传入7页

        PageInfo page = new PageInfo(customer, 7);

        return Msg.success().add("pageInfo", page);
    }
//    @ResponseBody
//    @RequestMapping(value = "/customerJson1/{custLevel}")
//public  Msg getcustJson(@PathVariable("custLevel")String custLevel){
//        List<Customer> customers = customerService.getsel(custLevel);
//        return  Msg.success().add("cust",customers);
//}
//    //查询顾客数据分页
//    @RequestMapping("/customer")
//    public String getCustomer(@RequestParam(value = "pn", defaultValue = "1") Integer pn, Model model) {
//        //引用分页插件PageHelper
//        PageHelper.startPage(pn, 8);
//        List<Customer> customer = customerService.getTest();
//        //使用pageinfo包装,包装后发送到页面即可
//        //封装了详细的分页信息  连续传入7页
//        PageInfo page = new PageInfo(customer, 7);
//        model.addAttribute("pageInfo", page);
////        page.getNavigatepageNums();
//        return "customerList";
//    }

    @RequestMapping(value = "/custSave", method = RequestMethod.POST)
    @ResponseBody
    public Msg saveCust(@Valid Customer customer, BindingResult result) {
        if (result.hasErrors()) {
//            j校验失败 应该返回失败
            Map<String, Object> map = new HashMap<>();
            List<FieldError> errors = result.getFieldErrors();
            for (FieldError fieldError : errors
                    ) {
                System.out.println("错误的字段名" + fieldError.getField());
                System.out.println("错误的字段名" + fieldError.getDefaultMessage());
                map.put(fieldError.getField(), fieldError.getDefaultMessage());
            }
            return Msg.fail().add("errorField", map);
        } else {
            customerService.saveCust(customer);
            return Msg.success();
        }


    }

    //    检查用户名是否可用
    @ResponseBody
    @RequestMapping("/checkuser")
    public Msg checkUser(@RequestParam("custName") String custName) {
        String regx = "(^[a-zA-Z0-9_-]{6,16}$)|(^[\\u2E80-\\u9FFF]{2,5})";
        if (!custName.matches(regx)) {
            return Msg.fail().add("VA_msg", "您输入的格式不正确");
        }
        //           数据库用户名重复校验
        Boolean b = customerService.checkUser(custName);
        if (b) {
            return Msg.success();
        } else {
            return Msg.fail().add("VA_msg", "用户名已存在");
        }
    }

    //    更新客户
    @RequestMapping(value = "/cust/{id}", method = RequestMethod.GET)
    @ResponseBody
    public Msg getCust(@PathVariable("id")Integer id) {
        Customer customer = customerService.getCust(id);
        return Msg.success().add("cust", customer);
    }
    /** 如果直接发送ajax-put请求
     *请求中有数据
     *但是实体类customer封装不上
     *原因
     * Tomcat
     *    1.将请求体中的数据 封装一个map
     *    2.request.getParamter("custName") 就会从map中取值
     *    3.springMvc 封装POJO对象的时候
     *                 会把POJO中的每个值request.getParamter("custName")
     *   AJAX发送PUT请求引发的血案
     *         PUT请求，请求体中的数据 request.getParamter("custName")都拿不到
     *         Tomcat一看是put请求 就不会封装请求体中的数据为map
     *          只要post形式的请求才封装请求体为map
     *          +"&_method=PUT",data： 后＋
     *          配置HttpPutFormContentFilter可以使用put
     *          将put请求数据解析成一个map
     *          request.getparamter （）被重写
     **/
    @ResponseBody
    @RequestMapping(value = "/cust/{custId}",method = RequestMethod.PUT)
    public  Msg updateCust(Customer customer, HttpServletRequest request){
        System.out.println("传来的数据"+customer);
        customerService.updateCust(customer);

        return Msg.success();
    }
//    单个批量二合一
//    批量删除1-2-3

    @ResponseBody
    @RequestMapping(value = "/cust/{ids}",method = RequestMethod.DELETE)
   public Msg deleteCust(@PathVariable("ids")String ids){
        //  批量
        if (ids.contains("-")){
            List<Integer> del_ids=new ArrayList<>();
         String[] str_ids=   ids.split("-");
            for (String string:str_ids
                 ) {
              del_ids.add(Integer.parseInt(string))  ;
                
            }
         customerService.deleteBatch(del_ids);
       //单个
        }else {
          Integer id=  Integer.parseInt(ids);
            customerService.deleteCust(id);
        }

       return  Msg.success();
   }
}
