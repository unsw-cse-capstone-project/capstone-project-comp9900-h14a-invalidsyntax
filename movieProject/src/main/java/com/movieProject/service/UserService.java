package com.movieProject.service;

import com.movieProject.common.Result;



public interface UserService {

    Result login(String name, String password);

    Result addUser(String name, String gender, Integer age, String password, String email);

    Result searchUserById(Integer user_id);

    Result updateUser(String user_id, String password, String gender, String age, String email);


}