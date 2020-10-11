package com.logintest.demo.common;

import lombok.Data;

@Data
public class Result {
    private static final int SUCCESS = 200;
    private static final int FAILED = 500;
    private int code;
    private String message;
    private Object data;
    public Result(int code, String message, Object data) {
        this.code = code;
        this.message = message;
        this.data = data;
    }
    public static Result ok(String message, Object data) {
        return new Result(SUCCESS, message, data);
    }
    public static Result fail(String message) {
        return new Result(FAILED, message, null);
    }
}
