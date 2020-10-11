package com.logintest.demo.service;

import com.logintest.demo.common.Result;
import com.logintest.demo.entity.User;
import com.logintest.demo.mapper.UserMapper;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.util.Objects;

@Slf4j
@Service
@AllArgsConstructor
public class UserService {
    private final UserMapper usermapper;

    public Result login(String name, String password) {
        if (StringUtils.isEmpty(name)) {
            return Result.fail("Account name can not be null !");
        }
        if (StringUtils.isEmpty(password)) {
            return Result.fail("Account password can not be null !");
        }
        User user = usermapper.findUserByName(name);
        if (null == user) {
            return Result.fail("Login failed !");
        }
        if (Objects.equals(password, user.getPassword())) {
            return Result.ok("Login Success", user);
        }

        return Result.fail("Login failed, wrong password !");
    }

    public Result addUser(String name, String password) {
        User newUser = new User();
        if (StringUtils.isEmpty(name)) {
            return Result.fail("Account name can not be null !");
        }
        if (StringUtils.isEmpty(password)) {
            return Result.fail("Account password can not be null !");
        }
        User user = usermapper.findUserByName(name);
        if (null != user) {
            return Result.fail("Register failed ! User already exist !");
        }

        int resultCount = usermapper.insertUser(name, password);
        if (resultCount == 0) {
            return Result.fail("Register failed !");
        }
        newUser.setName(name);
        newUser.setPassword(password);
        return Result.ok("Register Success", newUser);
    }
}