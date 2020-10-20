package com.movieProject.service;

import com.movieProject.common.Result;
import com.movieProject.entity.Movie;
import com.movieProject.mapper.MovieMapper;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

@Slf4j
@Service
@AllArgsConstructor
public class MovieService {
    private final MovieMapper movieMapper;

    public Result findByTitle(String title) {
        if (StringUtils.isEmpty(title)) {
            return Result.fail("Movie name can not be null !");
        }
        Movie movie = movieMapper.findByTitle(title);
        if (movie == null) {
            return Result.fail("There is no result");
        }
        return Result.ok("Movie found !", movie);
    }
}
