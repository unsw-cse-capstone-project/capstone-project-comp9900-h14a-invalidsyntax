package com.movieProject.service.Impl;

import com.movieProject.common.Result;
import com.movieProject.entity.Actor;
import com.movieProject.entity.Genre;
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
import java.util.HashSet;
import java.util.LinkedList;
import java.util.Set;

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

        for (Movie movie : movies) {
            List<Actor> director = movieMapper.findMovieDirector(movie.getMovie_id());
            movie.setDirector(director);
            
            List<Actor> actors = movieMapper.findMovieActor(movie.getMovie_id());
            movie.setActors(actors);

            List<Genre> genres = movieMapper.findMovieGenre(movie.getMovie_id());
            movie.setGenres(genres);
        }

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
        List<Actor>  director = movieMapper.findMovieDirector(movie_id);
        movie.setDirector(director);

        List<Genre> genres = movieMapper.findMovieGenre(movie_id);
        movie.setGenres(genres);

        List<Actor> actors = movieMapper.findMovieActor(movie.getMovie_id());
        movie.setActors(actors);

        if (user_id == 0) {
            return Result.ok("Movie found !", movie);
        }
        User user = userMapper.findUserByID(user_id);
        if (null == user) {
            return Result.fail("User not find !");
        }

        // recalculate movie rate, subtract rate in ban list
        List<Integer> banList = userMapper.showBanlist(user_id);
        if (!banList.isEmpty()) {
            for (Integer baned_id : banList) {
                List<Float> banRates = movieMapper.findRateByUser(movie_id, baned_id);
                for (Float banRate : banRates) {
                    float newRate = (movie.getRate() * movie.getRate_number() - banRate) / (movie.getRate_number() - 1);
                    newRate = (float) ((float) Math.round(newRate * 10.0) / 10.0);
                    movie.setRate(newRate);
                    movie.setRate_number(movie.getRate_number() - 1);
                }
            }
        }
        return Result.ok("Movie found !", movie);
    }

    @Override
    public Result listTopMovie() {
        List<Movie> movies = movieMapper.listMovie();
        for (Movie movie : movies) {
            List<Actor> director = movieMapper.findMovieDirector(movie.getMovie_id());
            movie.setDirector(director);

            List<Actor> actors = movieMapper.findMovieActor(movie.getMovie_id());
            movie.setActors(actors);

            List<Genre> genres = movieMapper.findMovieGenre(movie.getMovie_id());
            movie.setGenres(genres);
        }
        return Result.ok("Movie found !", movies);
    }

    @Override
    public Result recommendMoive(Integer user_id) {
        List<Integer> type_nums = movieMapper.findMovieGenreUserReview(user_id);
        List<Integer> movieId = new LinkedList<>();
        for (Integer num : type_nums) {
            List<Integer> reviewed_movie = movieMapper.findGenreMovieReviewed(user_id, num);
            List<Integer> same_genre_movie = movieMapper.findMovieByGenre(num);
            same_genre_movie.removeAll(reviewed_movie);
            movieId.addAll(same_genre_movie);
        }
        Set set = new HashSet();
        set.addAll(movieId);
        movieId.clear();
        movieId.addAll(set);
        return Result.ok("recomend movie found !", movieId);
    }

}
