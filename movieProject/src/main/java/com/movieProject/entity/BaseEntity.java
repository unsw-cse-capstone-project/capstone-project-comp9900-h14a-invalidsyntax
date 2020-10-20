package com.movieProject.entity;

import lombok.Data;

import javax.persistence.*;

@MappedSuperclass
@Data
abstract class BaseEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", updatable = false)
    private Integer id;
}
