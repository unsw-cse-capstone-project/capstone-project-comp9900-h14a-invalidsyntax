package com.movieProject.entity;

import lombok.Data;

import javax.persistence.*;

@Data
@Entity
@Table(name = "review")
public class Review {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "review_id", updatable = false)
    private Integer review_id;
    private Integer user_id;
    private Integer movie_id;
    private float rate;
    private String review;

}
