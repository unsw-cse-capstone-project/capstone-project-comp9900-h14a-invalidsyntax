package com.movieProject.controller;

import com.movieProject.common.Result;
import com.movieProject.service.MovieService;
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
@RequestMapping("movie")
@AllArgsConstructor
@CrossOrigin
@Api(value="Movie Controller")
public class MovieController {
    private final MovieService movieService;

    @ApiOperation("Search movie API, return movie data")
    @GetMapping("searchMovieByTitle")
    public Result searchMovieByTitle(String title){
        return movieService.findMovieByTitle(title);
    }

    @ApiOperation("Search movie API, return movie data")
    @GetMapping("searchMovieByID")
    public Result searchMovieByID(Integer movie_id, Integer user_id){
        return movieService.findMovieByUserID(movie_id, user_id);
    }

    @ApiOperation("Search movie API, return movie data")
    @GetMapping("searchMovieByGenre")
    public Result searchMovieByGenre(Integer user_id, String type_name){
        return movieService.findMovieByUserGenre(user_id, type_name);
    }

    @ApiOperation("List movie API, return movie data")
    @GetMapping("list_top_movie")
    public Result listTopMoive(){
        return movieService.listTopMovie();
    }

    @ApiOperation("recommend movie according to user's review")
    @GetMapping("recommend_movie")
    public Result recommendMoive(Integer user_id){
        return movieService.recommendMovie(user_id);
    }
}
