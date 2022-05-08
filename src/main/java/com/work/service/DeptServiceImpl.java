package com.work.service;

import com.work.bean.Dept;
import com.work.dao.DeptMapper;
import com.work.vo.DeptPage;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;


@Service
@Transactional
public class DeptServiceImpl implements DeptService {
    @Resource
    private DeptMapper deptMapper;

    @Override
    public List<Dept> findDeptByPage(DeptPage deptPage) {
        return deptMapper.findDeptByPage(deptPage);
    }

    @Override
    public int addDept(Dept dept) {
        return deptMapper.addDept(dept);
    }

    @Override
    public int updateDept(Dept dept) {
        return deptMapper.updateDept(dept);
    }

    @Override
    public int deleteById(Integer deptId) {
        return deptMapper.deleteById(deptId);
    }

    @Override
    public List<Dept> findDeptList() {
        return deptMapper.findDeptList();
    }
}
