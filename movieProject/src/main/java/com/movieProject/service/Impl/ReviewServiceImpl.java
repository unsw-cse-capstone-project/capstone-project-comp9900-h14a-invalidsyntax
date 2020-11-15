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
        new_review.setUser_name(user.getName());

        resultCount = reviewMapper.addMovieReview(movie_id, review_id);
        if (resultCount == 0) {
            return Result.fail("Movie add review failed !");
        }
        new_review.setMovie_title(movie.getTitle());

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
            Review new_review = reviewMapper.searchReviewByID(review);
            // search movie in movie_review
            Integer movie_id = reviewMapper.searchMovieID(review.getReview_id());
            if (movie_id == null){
                return Result.fail("Movie not find !");
            }
            Movie movie = moviemapper.findMovieByID(movie_id);
            if (movie == null) {
                return Result.fail("Movie not find !");
            }
            new_review.setMovie_id(movie_id);
            new_review.setMovie_title(movie.getTitle());
            new_review.setUser_name(user.getName());
            newReviewList.add(new_review);
        }
        return Result.ok("User reviews find !", newReviewList);
    }

    @Override
    public Result listMovieReview(Integer movie_id, Integer user_id) {
        Movie movie = moviemapper.findMovieByID(movie_id);
        if (movie == null) {
            return Result.fail("Movie not find !");
        }

        List<Integer> reviewIds = reviewMapper.searchReviewByMovie(movie_id);
        List<Review> movieReviews = new ArrayList<>();
        for (Integer reviewId : reviewIds) {
            Review review = new Review();
            review.setReview_id(reviewId);
            review = reviewMapper.searchReviewByID(review);
            Integer userId = reviewMapper.searchUserByReview(reviewId);
            User user = usermapper.findUserByID(userId);
            if (null == user) {
                return Result.fail("User can not be find !");
            }
            review.setUser_id(userId);
            review.setUser_name(user.getName());
            review.setMovie_title(movie.getTitle());

            // if user_id is 0, list all review
            if (user_id == 0) {
                movieReviews.add(review);
            } else {
                user = usermapper.findUserByID(user_id);
                if (null == user) {
                    return Result.fail("User can not be find !");
                }
                // list reviews which add by user who is in the banList
                List<Integer> banList = usermapper.showBanlist(user_id);
                boolean banned = false;
                for (Integer integer : banList) {
                    if (userId.equals(integer)) {
                        banned = true;
                        break;
                    }
                }
                if (!banned) {
                    movieReviews.add(review);
                }
            }
        }
        return Result.ok("Movie reviews found !", movieReviews);
    }

    @Override
    public Result deleteReview(Integer review_id) {
        Review review = new Review();
        review.setReview_id(review_id);
        review = reviewMapper.searchReviewByID(review);
        if (review == null) {
            return Result.fail("Review not found !");
        }

        Integer movie_id = reviewMapper.searchMovieID(review.getReview_id());
        if (movie_id == null){
            return Result.fail("Movie not find !");
        }

        Movie movie = moviemapper.findMovieByID(movie_id);
        if (movie == null) {
            return Result.fail("Movie not find !");
        }

        // update rate and rate number

        float new_rate = (movie.getRate()*movie.getRate_number() - review.getRate())/(movie.getRate_number()-1);
        new_rate = (float) ((float)Math.round(new_rate*10.0)/10.0);
        movie.setRate_number(movie.getRate_number()-1);
        movie.setRate(new_rate);
        int resultCount = moviemapper.updateMovieRate(movie);
        if (resultCount == 0) {
            return Result.fail("Movie rate updating failed !");
        }

        resultCount = reviewMapper.deleteReview(review_id);
        if (resultCount == 0) {
            return Result.fail("Review delete fail !");
        }

        return Result.ok("Delete success !", review);
    }

    @Override
    public Result updateReview(Integer review_id, String review, float rate, Integer user_id, Integer movie_id) {
        deleteReview(review_id);
        return addReview(review, rate, user_id, movie_id);
    }
}
