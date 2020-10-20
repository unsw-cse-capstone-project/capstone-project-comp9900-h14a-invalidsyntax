package com.movieProject.service;

import com.movieProject.common.Result;
import com.movieProject.entity.User;
import com.movieProject.mapper.UserMapper;
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

    public Result addUser(String name, String password, String email) {
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

        int resultCount = usermapper.insertUser(name, password, email);
        if (resultCount == 0) {
            return Result.fail("Register failed !");
        }
        newUser.setName(name);
        newUser.setPassword(password);
        newUser.setEmail(email);
        return Result.ok("Register Success", newUser);
    }

    public Result updateUser(String name, String password, String email) {
        if (StringUtils.isEmpty(name)) {
            return Result.fail("Account name can not be null !");
        }
        if (StringUtils.isEmpty(password) && StringUtils.isEmpty(email)) {
            return Result.fail("There is nothing to change !");
        }
        User user = usermapper.findUserByName(name);
        if (null == user) {
            return Result.fail("Can not find user to update !");
        }

        if (StringUtils.isEmpty(password)) {
            password = user.getPassword();
        }
        if (StringUtils.isEmpty(email)) {
            email = user.getEmail();
        }

        int resultCount = usermapper.updateUser(name, password, email);

        if (resultCount == 0) {
            return Result.fail("Update failed !");
        }

        return Result.ok("Update Success", user);
    }
}