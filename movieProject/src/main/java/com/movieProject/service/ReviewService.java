package com.movieProject.service;


import com.movieProject.common.Result;

public interface ReviewService {
    Result addReview(String review, float rate, Integer user_id, Integer movie_id);
    Result listUserReview(Integer user_id);
    Result listMovieReview(Integer movie_id, Integer user_id);
    Result deleteReview(Integer review_id);
    Result updateReview(Integer review_id, String review, float rate, Integer user_id, Integer movie_id);
}
