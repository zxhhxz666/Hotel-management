package com.work.dao;

import com.work.bean.Account;

public interface AccountMapper {
    int addAccount(Account account);
    Account findAccountByName(String loginName);
}
