package com.movieProject.service.Impl;

import com.movieProject.common.Result;
import com.movieProject.entity.Movie;
import com.movieProject.entity.User;
import com.movieProject.mapper.MovieMapper;
import com.movieProject.mapper.UserMapper;
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
    private final UserMapper userMapper;

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
    public Result findMovieByUserID(Integer movie_id, Integer user_id) {
        if (movie_id == 0) {
            return Result.fail("Movie not find !");
        }
        Movie movie = movieMapper.findMovieByID(movie_id);
        if (movie == null) {
            return Result.fail("Movie not find !");
        }

        if (user_id == 0) {
            return Result.ok("Movie found !", movie);
        }
        User user = userMapper.findUserByID(user_id);
        if (null == user) {
            return Result.fail("User not find !");
        }

        List<Integer> banList = userMapper.showBanlist(user_id);
        if (!banList.isEmpty()) {
            for (int i = 0; i< banList.size(); i++) {
                List<Float> banRates = movieMapper.findRateByUser(movie_id, banList.get(i));
                for (int j = 0; j <banRates.size();j++){
                    float newRate = (movie.getRate()*movie.getRate_number()-banRates.get(j))/(movie.getRate_number()-1);
                    newRate = (float) ((float)Math.round(newRate*10.0)/10.0);
                    movie.setRate(newRate);
                    movie.setRate_number(movie.getRate_number()-1);
                }
            }
        }
        return Result.ok("Movie found !", movie);
    }
}
