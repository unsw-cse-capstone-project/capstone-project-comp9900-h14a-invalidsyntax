package com.movieProject.service;

import com.movieProject.common.Result;



public interface MovieService {
    Result findMovieByTitle(String title);
    Result findMovieByUserID(Integer movie_id, Integer user_id);
    Result findMovieByUserGenre(Integer user_id, Integer type_id);
    Result listTopMovie();
    Result recommendMovie(Integer user_id);
}
