package com.movieProject.controller;

import com.movieProject.common.Result;
import com.movieProject.service.ReviewService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;

@Slf4j
@RestController
@RequestMapping("review")
@AllArgsConstructor
@CrossOrigin
@Api(value="Review Controller")
public class ReviewController {
    private final ReviewService reviewService;

    @ApiOperation("Add movie review, return review")
    @PostMapping("add_review")
    public Result addReview(String review, float rate, Integer user_id, Integer movie_id) {
        log.info("user_id:{}", user_id);
        log.info("movie_id:{}", movie_id);
        return reviewService.addReview(review, rate, user_id, movie_id);
    }

    @ApiOperation("List user review, return reviews")
    @GetMapping("List_user_review")
    public  Result listUserReview(Integer user_id){
        return reviewService.listUserReview(user_id);
    }

}
