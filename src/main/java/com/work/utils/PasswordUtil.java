package com.work.utils;

import org.apache.shiro.crypto.hash.Md5Hash;
import org.apache.shiro.crypto.hash.Sha1Hash;

import java.util.UUID;

public class PasswordUtil {
    public static String md5(String source, Object salt, Integer hashIterations) {
        return new Md5Hash(source, salt, hashIterations).toString();
    }

    public static String sha1(String source, Object salt, Integer hashIterations) {
        return new Sha1Hash(source, salt, hashIterations).toString();
    }

    public static void main(String[] args) {
        String password = "123456";
        String salt = UUID.randomUUID().toString().replace("-","");
        System.out.println("salt value："+salt);
        System.out.println("password after salt："+ PasswordUtil.md5(password,salt,5));
    }

}
