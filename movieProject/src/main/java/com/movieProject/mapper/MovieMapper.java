package com.movieProject.mapper;

import com.movieProject.entity.Movie;
import com.movieProject.utils.MyMapper;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface MovieMapper extends MyMapper<Movie> {
    Movie findByTitle(String title);
}
