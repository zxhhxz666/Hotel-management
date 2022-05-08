package com.work.controller.admin;

import com.work.bean.Account;
import com.work.service.AccountService;
import com.work.utils.EmailUtil;
import com.work.utils.SystemConstant;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.alibaba.fastjson.JSON;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@Controller
@RequestMapping("/account")
public class AccountController {
    @Resource
    private AccountService accountService;


    @ResponseBody
    @RequestMapping("/register")
    public String register(Account account){
        Map<String,Object> map = new HashMap<String,Object>();
        if(accountService.addAccount(account)>0){
            map.put(SystemConstant.SUCCESS,true);
            map.put(SystemConstant.MESSAGE,"Register Success!");
        }else{
            map.put(SystemConstant.SUCCESS,false);
            map.put(SystemConstant.MESSAGE,"Register Fail");
        }
        return JSON.toJSONString(map);
    }



    @ResponseBody
    @RequestMapping("/checkName")
    public String checkName(String loginName){

        Map<String,Object> map = new HashMap<String,Object>();
        if (loginName.length() > 10) {
            map.put(SystemConstant.EXIST,true);
            map.put(SystemConstant.MESSAGE,"Login name is too long");
            return JSON.toJSONString(map);
        }

        Pattern p = Pattern.compile("[0-9a-zA-Z]{1,}");
        Matcher m = p.matcher(loginName);

        if (!m.matches()) {
            map.put(SystemConstant.EXIST,true);
            map.put(SystemConstant.MESSAGE,"Login name can only contain a-z, A-Z and 0-9");
        } else if(accountService.findAccountByName(loginName)!=null){
            map.put(SystemConstant.EXIST,true);
            map.put(SystemConstant.MESSAGE,"Login name has been used！");
        }else{
            map.put(SystemConstant.EXIST,false);
        }
        return JSON.toJSONString(map);
    }

    @ResponseBody
    @RequestMapping("/checkPassword")
    public String checkPassword(String password){

        Map<String,Object> map = new HashMap<String,Object>();
        if (password.length() > 20) {
            map.put(SystemConstant.EXIST,true);
            map.put(SystemConstant.MESSAGE,": Too long");
            return JSON.toJSONString(map);
        }

        Pattern p0 = Pattern.compile("^(?![0-9]+$)(?![a-z]+$)(?![A-Z]+$)[0-9A-Za-z]{1,20}$");
        Matcher m0 = p0.matcher(password);
        if (!m0.matches()) {
            map.put(SystemConstant.EXIST,true);
            map.put(SystemConstant.MESSAGE,"Invalid");
        } else{
            if (password.length() <= 6) {
                map.put(SystemConstant.MESSAGE,"Weak");
            } else if (password.length() <= 12) {
                map.put(SystemConstant.MESSAGE, "Normal");
            } else{
                map.put(SystemConstant.MESSAGE,"Strong");
            }

            map.put(SystemConstant.EXIST,false);
        }
        return JSON.toJSONString(map);
    }

    @ResponseBody
    @RequestMapping("/sendEmail")
    public String sendEmail(String email){

        Map<String,Object> map = new HashMap<String,Object>();
        Random rand = new Random();
        int value = rand.nextInt(89999) + 10000;
        try {
            EmailUtil.send(email, String.valueOf(value));
            map.put(SystemConstant.EXIST,false);
            map.put(SystemConstant.MESSAGE,String.valueOf(value));
        } catch (Exception e) {
            map.put(SystemConstant.EXIST,true);
            map.put(SystemConstant.MESSAGE,"Error");
        }
        return JSON.toJSONString(map);
    }

    @ResponseBody
    @RequestMapping("/login")
    public String login(String loginName, String password, HttpSession session){

        Map<String,Object> map = new HashMap<String,Object>();
        Account loginUser = accountService.login(loginName, password);

        if(loginUser!=null){
            map.put(SystemConstant.SUCCESS,true);
            loginUser.setPassword(null);
            session.setAttribute(SystemConstant.FRONT_LOGIN_USER,loginUser);
        }else{
            map.put(SystemConstant.SUCCESS,false);
            map.put(SystemConstant.MESSAGE,"Username or password is wrong!");
        }
        return JSON.toJSONString(map);
    }

    @RequestMapping("/logout")
    public String logout(HttpSession httpSession) {
        httpSession.invalidate();
        return "redirect:/index.html";
    }
}
