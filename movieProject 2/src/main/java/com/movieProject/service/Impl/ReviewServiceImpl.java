package com.movieProject.service.Impl;

import com.movieProject.common.Result;
import com.movieProject.entity.Movie;
import com.movieProject.entity.Review;
import com.movieProject.entity.User;
import com.movieProject.mapper.MovieMapper;
import com.movieProject.mapper.ReviewMapper;
import com.movieProject.mapper.UserMapper;
import com.movieProject.service.ReviewService;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Slf4j
@Service
@AllArgsConstructor
public class ReviewServiceImpl implements ReviewService {
    private final UserMapper usermapper;
    private final MovieMapper moviemapper;
    private final ReviewMapper reviewMapper;

    @Override
    public Result addReview(String review, float rate, Integer user_id, Integer movie_id){
        User user = usermapper.findUserByID(user_id);
        if (null == user) {
            return Result.fail("User can not be find !");
        }

        Movie movie = moviemapper.findMovieByID(movie_id);
        if (movie == null) {
            return Result.fail("Movie not find !");
        }

        // update rate and rate number

        float new_rate = (rate+movie.getRate()*movie.getRate_number())/(movie.getRate_number()+1);
        new_rate = (float) ((float)Math.round(new_rate*10.0)/10.0);
        movie.setRate_number(movie.getRate_number()+1);
        movie.setRate(new_rate);
        int resultCount = moviemapper.updateMovieRate(movie);
        if (resultCount == 0) {
            return Result.fail("Movie rate updating failed !");
        }

        // add review
        Review new_review = new Review();
        new_review.setRate(rate);
        new_review.setReview(review);

        resultCount = reviewMapper.addReview(new_review);
        if (resultCount == 0) {
            return Result.fail("Add review failed !");
        }

        int review_id = new_review.getReview_id();

        resultCount = reviewMapper.addUserReview(user_id, review_id);
        if (resultCount == 0) {
            return Result.fail("User add review failed !");
        }
        new_review.setUser_id(user_id);

        resultCount = reviewMapper.addMovieReview(movie_id, review_id);
        if (resultCount == 0) {
            return Result.fail("Movie add review failed !");
        }
        new_review.setMovie_id(movie_id);

        return Result.ok("Add review Success", new_review);
    }

    @Override
    public Result listUserReview(Integer user_id){
        User user = usermapper.findUserByID(user_id);
        if (null == user) {
            return Result.fail("User can not be find !");
        }
        List<Review> reviewList = reviewMapper.listUserReview(user_id);

        if (reviewList.isEmpty()) {
            return Result.fail("User does not have any review !");
        }

        List<Review> newReviewList = new ArrayList<>();
        for (Review review : reviewList) {
            Review new_review;
            new_review = reviewMapper.searchReviewByID(review);
            Integer movie_id = reviewMapper.searchMovieID(review.getReview_id());
            if (movie_id == null){
                return Result.fail("Movie not find !");
            }
            Movie movie = moviemapper.findMovieByID(movie_id);
            if (movie == null) {
                return Result.fail("Movie not find !");
            }
            new_review.setMovie_id(movie_id);
            new_review.setUser_id(review.getUser_id());
            new_review.setReview_id(review.getReview_id());
            newReviewList.add(new_review);
        }
        return Result.ok("User reviews find !", newReviewList);
    }

}
