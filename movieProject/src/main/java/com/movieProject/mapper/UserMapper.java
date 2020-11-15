package com.movieProject.mapper;

import com.movieProject.entity.MessageGet;
import com.movieProject.entity.MessageGive;
import com.movieProject.entity.SimpleUser;
import com.movieProject.entity.User;
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

    SimpleUser givebackUserNameAndID(Integer user_id);

    List<Integer> showWishlist(Integer user_id);

    List<Integer> showBanlist(Integer user_id);

    int updateUser(Integer user_id, String password, String gender, Integer age, String email);

    int removeWishlist(Integer user_id, Integer wishList);

    int removeBanlist(Integer user_id, Integer user_baned_id);

    int addFollowlist(Integer user_id, Integer follow_id);

    int removeFollowlist(Integer user_id, Integer follow_id);

    List<Integer> showFollowlist(Integer user_id);

    int giveMessage(String message, Integer user_give_id, Integer user_get_id);

    int deleteMessage(Integer user_give_id, Integer user_get_id);

    List<MessageGive> showGetMessages(Integer user_get_id);

    List<MessageGet> showGiveMessages(Integer user_give_id);

}
