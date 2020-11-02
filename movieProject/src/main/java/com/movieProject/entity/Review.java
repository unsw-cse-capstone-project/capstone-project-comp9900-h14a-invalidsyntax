package com.movieProject.entity;

import lombok.Data;

import javax.persistence.*;

@Data
@Entity
@Table(name = "review")
public class Review {
    private String movie_title;
    private float rate;
    private String review;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "review_id", updatable = false)
    private Integer review_id;
    private String user_name;
    private Integer user_id;
}
