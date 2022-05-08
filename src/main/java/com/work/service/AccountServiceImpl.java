package com.work.service;

import com.work.bean.Account;
import com.work.dao.AccountMapper;
import com.work.utils.PasswordUtil;
import com.work.utils.SystemConstant;
import com.work.utils.UUIDUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;

@Service
@Transactional
public class AccountServiceImpl implements AccountService{
    @Resource
    private AccountMapper accountMapper;

    @Override
    public int addAccount(Account account) {
        account.setSalt(UUIDUtils.randomUUID());//shiro安全验证框架
        //密码加密
        account.setPassword(PasswordUtil.md5(account.getPassword(),account.getSalt(), SystemConstant.PASSWORD_COUNT));
        return accountMapper.addAccount(account);
    }

    @Override
    public Account findAccountByName(String loginName) {
        return accountMapper.findAccountByName(loginName);
    }

    public Account login(String loginName, String password) {
        Account loginUser = accountMapper.findAccountByName(loginName);
        if(loginUser!=null){
            String newPassword = PasswordUtil.md5(password, loginUser.getSalt(),SystemConstant.PASSWORD_COUNT);
            if(loginUser.getPassword().equals(newPassword)){
                return loginUser;
            }
        }
        return null;
    }
}
