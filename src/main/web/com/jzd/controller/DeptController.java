package com.jzd.controller;

import com.jzd.pojo.Dept;
import com.jzd.pojo.Msg;
import com.jzd.service.DeptService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

//处理和部门有关的请求
@Controller
public class DeptController {
    @Autowired
    DeptService deptService;
//返回所有信息
    @RequestMapping("/depts")
    @ResponseBody
    public Msg getDepts(){
          // 查所有部门信息
        List<Dept>list =deptService.getDepts();
        return  Msg.success().add("depts",list);
    }

}
