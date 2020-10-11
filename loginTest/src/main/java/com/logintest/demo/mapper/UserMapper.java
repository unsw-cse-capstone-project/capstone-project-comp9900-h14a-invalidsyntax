package com.logintest.demo.mapper;

import com.logintest.demo.entity.User;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface UserMapper {
    @Insert("INSERT INTO user(name, password) VALUES(#{name}, #{password})")
    int insertUser(@Param("name") String name, @Param("password") String password);

    @Select("SELECT id, name, password FROM user WHERE name = #{name}")
    User findUserByName(@Param("name") String name);
}
