package com.movieProject.mapper;

import com.movieProject.entity.User;
import com.movieProject.utils.MyMapper;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface UserMapper extends MyMapper<User> {
    int insertUser(String name, String gender, Integer age, String password, String email);

    User findUserByName(String name);

    User findUserByID(Integer user_id);
}
