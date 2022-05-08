package com.work.service;

import com.work.bean.Account;

public interface AccountService {
    int addAccount(Account account);
    Account findAccountByName(String loginName);
    Account login(String loginName, String password);
}
