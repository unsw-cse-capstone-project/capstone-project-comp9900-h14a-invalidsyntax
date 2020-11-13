package com.movieProject.entity;

import lombok.Data;

import javax.persistence.*;

@Data
@Entity
@Table(name = "messageboard")
public class MessageGive {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "messageboard_id", updatable = false)
    private Integer messageboard_id;
    private Integer user_give_id;
    private String name;
    private String message;
}
