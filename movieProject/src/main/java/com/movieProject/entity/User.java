package com.movieProject.entity;

import lombok.Data;

import javax.persistence.*;


@Data
@Entity
@Table(name = "user")

public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "user_id", updatable = false)
    private Integer user_id;
    private String name;
    private String password;
    private String email;
    private String gender;
    private Integer age;

}
