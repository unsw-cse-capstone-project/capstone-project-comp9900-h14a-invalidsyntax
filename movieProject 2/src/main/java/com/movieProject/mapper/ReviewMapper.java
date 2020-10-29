package com.movieProject.mapper;

import com.movieProject.entity.Review;
import com.movieProject.utils.MyMapper;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface ReviewMapper extends MyMapper<Review> {
    int addReview(Review review);
    int addUserReview(int user_id, int review_id);
    int addMovieReview(int movie_id, int review_id);
    List<Review> listUserReview(int user_id);
    Review searchReviewByID(Review review);
    Integer searchMovieID(int review_id);
}
