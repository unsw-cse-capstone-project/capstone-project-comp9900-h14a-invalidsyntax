package com.movieProject.entity;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

@Data
@Entity
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@Table(name = "movie")
public class Movie extends BaseEntity{
    private String title;
    private String year;
    private String poster;

    @Column(name = "vote_average")
    private float voteAverage;

    private String homepage;
    private String keywords;
    private String overview;
}
