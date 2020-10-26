package com.movieProject.service.Impl;

import com.movieProject.common.Result;
import com.movieProject.entity.User;
import com.movieProject.entity.Movie;
import com.movieProject.mapper.UserMapper;
import com.movieProject.mapper.MovieMapper;
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
    private final MovieMapper moviemapper;

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

//    @Override
//    public Result addWishlist(String user_id, String movie_id) {
//        if (StringUtils.isEmpty(user_id)) {
//            return Result.fail("User_id can not be NULL !");
//        }
//        if (StringUtils.isEmpty(movie_id)) {
//            return Result.fail("Movie_id can not be NULL !");
//        }
//        int new_user_id = Integer.parseInt(user_id);
//        User user = usermapper.findUserByID(new_user_id);
//        if (null != user) {
//            return Result.fail("User can not be find !");
//        }
//        int new_movie_id = Integer.parseInt(movie_id);
//        Movie movie = moviemapper.findMovieByID(new_movie_id);
//        if (null != movie) {
//            return Result.fail("Movie can not be find !");
//        }
//
//        int resultCount = usermapper.addWishlist(new_user_id, new_movie_id);
//        if (resultCount == 0) {
//            return Result.fail("Register failed !");
//        }
//
//        return Result.ok("Register Success", );
//    }

//    @Override
//    public Result addBanlist(String user_id, String ban_id) {
//        if (StringUtils.isEmpty(name)) {
//            return Result.fail("Account name can not be null !");
//        }
//        if (StringUtils.isEmpty(password)) {
//            return Result.fail("Account password can not be null !");
//        }
//        User user = usermapper.findUserByName(name);
//        if (null != user) {
//            return Result.fail("Register failed ! User already exist !");
//        }
//
//        int resultCount = usermapper.insertUser(name, gender, age, password, email);
//        if (resultCount == 0) {
//            return Result.fail("Register failed !");
//        }
//
//        User newUser = usermapper.findUserByName(name);
//
//        return Result.ok("Register Success", newUser);
//    }

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

    @Override
    public Result updateUser(String user_id, String password, String gender, String age, String email) {
        if (StringUtils.isEmpty(user_id)) {
            return Result.fail("User not find !");
        }
        if (StringUtils.isEmpty(password) && StringUtils.isEmpty(email) && StringUtils.isEmpty(gender) && StringUtils.isEmpty(age)) {
            return Result.fail("There is nothing to change !");
        }

        int new_user_id = Integer.parseInt(user_id);

        User user = usermapper.findUserByID(new_user_id);
        if (null == user) {
            return Result.fail("Can not find user to update !");
        }

        if (StringUtils.isEmpty(password)) {
            password = user.getPassword();
        }
        if (StringUtils.isEmpty(email)) {
            email = user.getEmail();
        }
        if (StringUtils.isEmpty(gender)) {
            gender = user.getGender();
        }
        if (StringUtils.isEmpty(age)){
            age = String.valueOf(user.getAge());
        }


        int new_age = Integer.parseInt(age);

        int resultCount = usermapper.updateUser(new_user_id, password, gender, new_age, email);

        if (resultCount == 0) {
            return Result.fail("Update failed !");
        }

        User updateuser = usermapper.findUserByID(new_user_id);

        return Result.ok("Update Success", updateuser);
    }
}
