package com.movieProject.service;

import com.movieProject.common.Result;



public interface MovieService {
    Result findMovieByTitle(String title);
    Result findMovieByID(Integer movie_id);
}
