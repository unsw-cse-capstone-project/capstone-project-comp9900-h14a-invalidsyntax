package com.logintest.demo.entity;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import javax.persistence.Entity;
import javax.persistence.Table;


@Data
@Entity
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@Table(name = "user")

public class User extends BaseEntity{
//    private Integer id;
    private String name;
    private String password;
}
