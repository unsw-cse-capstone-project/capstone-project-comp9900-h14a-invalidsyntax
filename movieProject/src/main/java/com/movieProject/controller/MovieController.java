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
    private final MovieService MovieService;

    @ApiOperation("Search movie API, return movie data")
    @GetMapping("search")
    public Result search(String title){
        return MovieService.findByTitle(title);
    }
}
