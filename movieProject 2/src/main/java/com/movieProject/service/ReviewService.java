package com.movieProject.service;


import com.movieProject.common.Result;

public interface ReviewService {
    Result addReview(String review, float rate, Integer user_id, Integer movie_id);
    Result listUserReview(Integer user_id);
}
