package com.work.dao;

import com.work.bean.Dept;
import com.work.vo.DeptPage;

import java.util.List;

public interface DeptMapper {
    List<Dept> findDeptByPage(DeptPage deptPage);
    int addDept(Dept dept);
    int updateDept(Dept dept);
    int deleteById(Integer deptId);
    List<Dept> findDeptList();
}
