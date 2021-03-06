package com.movieProject.service;

import com.movieProject.common.Result;



public interface UserService {

    Result login(String name, String password);

    Result addUser(String name, String gender, Integer age, String password, String email);

    Result addwishlist(String user_id, String movie_id);

    Result addBanlist(String user_id, String ban_id);

    Result searchUserById(Integer user_id);

    Result showwish(String user_id);

    Result showban(String user_id);

    Result updateUser(String user_id, String password, String gender, String age, String email);

    Result removeWishlist(String user_id, String movie_id);

    Result removeBanlist(String user_id, String ban_id);

    Result addFollowlist(String user_id, String follow_id);

    Result removeFollowlist(String user_id, String follow_id);

    Result showFollow(String user_id);

    Result addMessage(String message, String user_give_id, String user_get_id);

    Result removeMessage(String user_give_id, String user_get_id);

    Result showGiveMessage(String user_give_id);

    Result showGetMessage(String user_get_id);


}