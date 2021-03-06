package com.movieProject.mapper;

import com.movieProject.entity.Actor;
import com.movieProject.entity.Genre;
import com.movieProject.entity.Movie;
import com.movieProject.utils.MyMapper;
import io.swagger.models.auth.In;
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
    List<Actor> findMovieDirector(Integer movie_id);
    List<Genre> findMovieGenre(Integer movie_id);
    List<Actor> findMovieActor(Integer movie_id);
    List<Integer> findMovieGenreUserReview(Integer user_id);
    List<Integer> findGenreMovieReviewed(Integer user_id,Integer type_id);
    List<Integer> findMovieByGenre(Integer type_id);
    List<Integer> findMovieByDes(String des);
    Integer findMovieIDByName(String type_name);
}
