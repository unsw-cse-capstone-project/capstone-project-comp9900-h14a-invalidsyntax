package com.movieProject.service.Impl;

import com.movieProject.common.Result;
import com.movieProject.entity.User;
import com.movieProject.mapper.UserMapper;
import com.movieProject.service.UserService;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.util.Objects;

@Slf4j
@Service
@AllArgsConstructor
public class UserServiceImpl implements UserService {
    private final UserMapper usermapper;

    @Override
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

    @Override
    public Result addUser(String name, String gender, Integer age, String password, String email) {
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

        int resultCount = usermapper.insertUser(name, gender, age, password, email);
        if (resultCount == 0) {
            return Result.fail("Register failed !");
        }

        User newUser = usermapper.findUserByName(name);

        return Result.ok("Register Success", newUser);
    }

    @Override
    public Result searchUserById(Integer user_id) {
        if (user_id == 0) {
            return Result.fail("User not find !");
        }
        User user = usermapper.findUserByID(user_id);
        if (null == user) {
            return Result.fail("User not find !");
        }
        return Result.ok("User found !", user);
    }
}
