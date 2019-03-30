package com.jzd.service;

import com.jzd.dao.DeptMapper;
import com.jzd.pojo.Dept;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class DeptService {
    @Autowired
    private DeptMapper deptMapper;
    public List<Dept>getDepts(){
        List<Dept>list=deptMapper.selectByExample(null);
        return list;
    };
}
