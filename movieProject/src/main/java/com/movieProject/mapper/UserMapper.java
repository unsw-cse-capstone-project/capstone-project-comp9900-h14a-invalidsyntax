package com.movieProject.mapper;

import com.movieProject.entity.User;
import com.movieProject.entity.Movie;
import com.movieProject.utils.MyMapper;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface UserMapper extends MyMapper<User> {
    int insertUser(String name, String gender, Integer age, String password, String email);

    int addWishlist(Integer user_id, Integer wishList);

    int addBanlist(Integer user_id, Integer user_baned_id);

    User findUserByName(String name);

    User findUserByID(Integer user_id);

    List<Movie> showWishlist(Integer user_id);

    List<User> showBanlist(Integer user_id);

    int updateUser(Integer user_id, String password, String gender, Integer age, String email);

    int removeWishlist(Integer user_id, Integer wishList);

    int removeBanlist(Integer user_id, Integer user_baned_id);
}
