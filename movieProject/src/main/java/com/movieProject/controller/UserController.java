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

    @ApiOperation("Add movie to wishlist, return user")
    @GetMapping("add_to_wishlist")
    public Result addwishlist(String user_id, String movie_id) {
        log.info("user_id:{}", user_id);
        log.info("movie_id:{}", movie_id);
        return userService.addwishlist(user_id, movie_id);
    }

    @ApiOperation("Remove movie from wishlist, return user")
    @GetMapping("remove_from_wishlist")
    public Result removeWishlist(String user_id, String movie_id) {
        log.info("user_id:{}", user_id);
        log.info("movie_id:{}", movie_id);
        return userService.removeWishlist(user_id, movie_id);
    }

    @ApiOperation("Ban other user, return user")
    @GetMapping("ban_someone")
    public Result addBanlist(String user_id, String ban_id) {
        log.info("user_id:{}", user_id);
        log.info("ban_id:{}", ban_id);
        return userService.addBanlist(user_id, ban_id);
    }

    @ApiOperation("Cancel banlist, return user")
    @GetMapping("cancel_ban_someone")
    public Result removeBanlist(String user_id, String ban_id) {
        log.info("user_id:{}", user_id);
        log.info("ban_id:{}", ban_id);
        return userService.removeBanlist(user_id, ban_id);
    }

    @ApiOperation("Search user API, return user data")
    @GetMapping("searchUserById")
    public Result searchUserById(Integer user_id){
        return userService.searchUserById(user_id);
    }

    @ApiOperation("Show wishlist API, return wishlist")
    @GetMapping("showWishList")
    public Result showwish(String user_id){
        return userService.showwish(user_id);
    }

    @ApiOperation("Show banlist API, return banlist")
    @GetMapping("showBanList")
    public Result showban(String user_id){
        return userService.showban(user_id);
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


    @ApiOperation("Follow other user, return user")
    @GetMapping("follow_someone")
    public Result addFollowlist(String user_id, String follow_id) {
        log.info("user_id:{}", user_id);
        log.info("follow_id:{}", follow_id);
        return userService.addFollowlist(user_id, follow_id);
    }

    @ApiOperation("Cancel followlist, return user")
    @GetMapping("cancel_follow_someone")
    public Result removeFollowlist(String user_id, String follow_id) {
        log.info("user_id:{}", user_id);
        log.info("follow_id:{}", follow_id);
        return userService.removeFollowlist(user_id, follow_id);
    }

    @ApiOperation("Show followlist API, return followlist")
    @GetMapping("showFollowList")
    public Result showFollow(String user_id){
        return userService.showFollow(user_id);
    }

    @ApiOperation("Add message, return user who give message")
    @GetMapping("add_message")
    public Result addMessage(String message, String user_give_id, String user_get_id) {
        log.info("user_give_id:{}", user_give_id);
        log.info("user_get_id:{}", user_get_id);
        return userService.addMessage(message, user_give_id, user_get_id);
    }

    @ApiOperation("Delete message, return user who give message")
    @GetMapping("delete_message")
    public Result removeMessage(String user_give_id, String user_get_id) {
        log.info("user_give_id:{}", user_give_id);
        log.info("user_get_id:{}", user_get_id);
        return userService.removeMessage(user_give_id, user_get_id);
    }

    @ApiOperation("Show Show giveMessage API, return messages")
    @GetMapping("showGiveMessage")
    public Result showGiveMessage(String user_give_id){
        return userService.showGiveMessage(user_give_id);
    }

    @ApiOperation("Show getMessage API, return messages")
    @GetMapping("showGetMessage")
    public Result showGetMessage(String user_get_id){
        return userService.showGetMessage(user_get_id);
    }

}
