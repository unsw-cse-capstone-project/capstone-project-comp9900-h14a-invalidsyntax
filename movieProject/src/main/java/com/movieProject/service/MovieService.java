package com.movieProject.service;

import com.movieProject.common.Result;



public interface MovieService {
    Result findMovieByTitle(String title);
    Result findMovieByUserID(Integer movie_id, Integer user_id);
    Result findMovieByUserGenre(Integer user_id, String type_name);
    Result findMovieByUserDescription(Integer user_id, String des);
    Result listTopMovie();
    Result recommendMovie(Integer user_id);
}
