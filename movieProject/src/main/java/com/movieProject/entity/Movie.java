package com.movieProject.entity;

import lombok.Data;


import javax.persistence.*;
import java.util.List;

@Data
@Entity
@Table(name = "movie")
public class Movie {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "movie_id", updatable = false)
    private Integer movie_id;

    private String title;
    private String poster;

    private float rate;
    private Integer rate_number;
    private String release_time;

    private String homepage;
    private String overview;

    private List<Genre> genres;
    private List<Actor> director;
    private List<Actor> actors;
}
