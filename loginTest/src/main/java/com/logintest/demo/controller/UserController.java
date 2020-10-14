package com.logintest.demo.controller;

import com.logintest.demo.common.Result;
import com.logintest.demo.service.UserService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@Slf4j
@RestController
@RequestMapping("user")
@AllArgsConstructor
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
    public Result register(String name, String password, String email) {
        log.info("name:{}", name);
        log.info("password:{}", password);
        return userService.addUser(name, password, email);
    }
}
