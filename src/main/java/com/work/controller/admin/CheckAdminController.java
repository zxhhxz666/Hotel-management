package com.work.controller.admin;

import com.alibaba.fastjson.JSON;
import com.work.bean.Check;
import com.work.bean.User;
import com.work.service.CheckService;
import com.work.utils.DataGridViewResult;
import com.work.utils.SystemConstant;
import com.work.vo.CheckVo;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.work.bean.Check;
import com.work.service.CheckService;
import com.work.utils.DataGridViewResult;
import com.work.utils.SystemConstant;
import com.work.vo.CheckVo;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/admin/checkin")
public class CheckAdminController {

    @Resource
    private CheckService checkService;

    @RequestMapping("/list")
    public DataGridViewResult list(CheckVo checkVo){

        PageHelper.startPage(checkVo.getPage(),checkVo.getLimit());

        List<Check> checkinList = checkService.findCheckinList(checkVo);

        PageInfo<Check> pageInfo = new PageInfo<Check>(checkinList);

        return new DataGridViewResult(pageInfo.getTotal(),pageInfo.getList());
    }

    @RequestMapping("/addCheckin")
    public String addCheckin(Check checkin, HttpSession session){
        Map<String,Object> map = new HashMap<String,Object>();
        User employee = (User) session.getAttribute(SystemConstant.LOGIN_USER);
        checkin.setCreatedBy(employee.getId());
        if(checkService.addCheckin(checkin)>0){
            map.put(SystemConstant.SUCCESS,true);
            map.put(SystemConstant.MESSAGE,"Check in success!");
        }else{
            map.put(SystemConstant.SUCCESS,false);
            map.put(SystemConstant.MESSAGE,"Check in fail!");
        }
        return JSON.toJSONString(map);
    }


}
