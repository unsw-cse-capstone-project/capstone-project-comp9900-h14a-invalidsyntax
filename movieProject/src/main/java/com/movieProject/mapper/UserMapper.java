package com.movieProject.mapper;

import com.movieProject.entity.User;
import com.movieProject.utils.MyMapper;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface UserMapper extends MyMapper<User> {
    int insertUser(String name, String gender, Integer age, String password, String email);

    int addWishlist(Integer user_id, Integer movie_id);

    int addBanlist(Integer user_id, Integer ban_id);

    User findUserByName(String name);

    User findUserByID(Integer user_id);

    int updateUser(Integer user_id, String password, String gender, Integer age, String email);
}
