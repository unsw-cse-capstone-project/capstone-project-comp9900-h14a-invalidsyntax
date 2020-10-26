package com.movieProject.controller;

import com.movieProject.common.Result;
import com.movieProject.service.UserService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@Slf4j
@RestController
@RequestMapping("user")
@AllArgsConstructor
@CrossOrigin
@Api(value="User Controller")
public class UserController {
    private final UserService userService;

    @ApiOperation("Login API, return user data")
    @GetMapping("login")
    public Result login(String name, String password){
        return userService.login(name, password);
    }

    @ApiOperation("Register API, return user data")
    @GetMapping("register")
    public Result register(String name, String gender, Integer age, String password, String email) {
        log.info("name:{}", name);
        log.info("password:{}", password);
        return userService.addUser(name, gender, age, password, email);
    }

    @ApiOperation("Search user API, return user data")
    @GetMapping("searchUserById")
    public Result login(Integer user_id){
        return userService.searchUserById(user_id);
    }

    @ApiOperation("Update API, return user data")
    @GetMapping("update")
    public Result update(String user_id, String password, String gender, String age, String email) {
        log.info("user_id:{}", user_id);
        log.info("password:{}", password);
        log.info("gender:{}", gender);
        log.info("age:{}", age);
        log.info("email:{}", email);
        return userService.updateUser(user_id, password, gender, age, email);
    }

}
