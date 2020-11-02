package com.movieProject.mapper;

import com.movieProject.entity.Movie;
import com.movieProject.utils.MyMapper;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface MovieMapper extends MyMapper<Movie> {
    List<Movie> findMovieByTitle(String title);
    Movie findMovieByID(Integer movie_id);
    int updateMovieRate(Movie movie);
    List<Float> findRateByUser(Integer movie_id, Integer user_id);
    List<Movie> listMovie();
}
