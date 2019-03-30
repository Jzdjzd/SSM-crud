package com.jzd.service;


import com.jzd.dao.CustomerMapper;
import com.jzd.pojo.Customer;
import com.jzd.pojo.CustomerExample;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.util.List;

@Service
public class CustomerService {
    //    查询所有员工
    @Autowired
    CustomerMapper customerMapper;


    public List<Customer> getAll(String custlevel) {
   Customer customer =new Customer();
        if (custlevel!=null){
            customer.setCustLevel(custlevel);
        }
        return customerMapper.selectCustomerList(customer);
    }

    ;

    //员工保存方法
    public void saveCust(Customer customer) {
        customerMapper.insertSelective(customer);
    }

    //   检验用户名是否可用
    public boolean checkUser(String custName) {
        CustomerExample customerExample = new CustomerExample();
        CustomerExample.Criteria criteria = customerExample.createCriteria();
        criteria.andCustNameEqualTo(custName);
        long count = customerMapper.countByExample(customerExample);
        return count == 0;
    }

    public Customer getCust(Integer id) {
        Customer customer = customerMapper.selectByPrimaryKey(id);
        return customer;
    }
//员工更新
    public void updateCust(Customer customer) {
        customerMapper.updateByPrimaryKeySelective(customer);
    }

//员工删除
    public void deleteCust(Integer id) {
        customerMapper.deleteByPrimaryKey(id);
    }

    public void deleteBatch(List<Integer> ids) {
        CustomerExample example=new CustomerExample();
        CustomerExample.Criteria criteria = example.createCriteria();
        criteria.andCustIdIn(ids);
        customerMapper.deleteByExample(example);

    }

    public List<Customer> getTest(Customer customer) {
        return customerMapper.selectCustomerList(null);
    }

//    public List<Customer> getsel(String custLevel) {
////     return   customerMapper.selectCustomerList(custLevel);
////    }
}
