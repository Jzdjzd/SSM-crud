package com.jzd.dao;

import com.jzd.pojo.Customer;
import com.jzd.pojo.CustomerExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface CustomerMapper {
    long countByExample(CustomerExample example);

    int deleteByExample(CustomerExample example);

    int deleteByPrimaryKey(Integer custId);

    int insert(Customer record);

    Customer selectByPrimaryKey(Integer custId);

    int insertSelective(Customer record);
    List<Customer> selectCustomerList(Customer customer);


    List<Customer> selectByExample(CustomerExample example);

    int updateByExampleSelective(@Param("record") Customer record, @Param("example") CustomerExample example);

    int updateByExample(@Param("record") Customer record, @Param("example") CustomerExample example);
    int updateByPrimaryKeySelective(Customer record);

    int updateByPrimaryKey(Customer record);


}
