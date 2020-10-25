package com.movieProject.service.Impl;

import com.movieProject.common.Result;
import com.movieProject.entity.Movie;
import com.movieProject.mapper.MovieMapper;
import com.movieProject.service.MovieService;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.util.List;

@Slf4j
@Service
@AllArgsConstructor
public class MovieServiceImpl implements MovieService {
    private final MovieMapper movieMapper;

    @Override
    public Result findMovieByTitle(String title) {
        if (StringUtils.isEmpty(title)) {
            return Result.fail("Movie name can not be null !");
        }
        List<Movie> movies = movieMapper.findMovieByTitle(title);
        if (movies.isEmpty()) {
            return Result.fail("There is no result");
        }
        return Result.ok("Movie found !", movies);
    }

    @Override
    public Result findMovieByID(Integer movie_id) {
        if (movie_id == 0) {
            return Result.fail("Movie not find !");
        }
        Movie movie = movieMapper.findMovieByID(movie_id);
        if (movie == null) {
            return Result.fail("Movie not find !");
        }
        return Result.ok("Movie found !", movie);
    }
}
