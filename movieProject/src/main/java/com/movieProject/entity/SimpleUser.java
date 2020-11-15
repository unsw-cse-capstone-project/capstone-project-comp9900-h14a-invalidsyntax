package com.movieProject.entity;

import lombok.Data;

import javax.persistence.*;


@Data
@Entity
@Table(name = "simpleuser")
public class SimpleUser {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "user_id", updatable = false)
    private Integer user_id;
    private String name;
}
