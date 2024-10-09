package com.xlf.school.experiment2.model;

/**
 * 基础响应类
 * <p>
 * 用于封装响应数据
 * 该类为所有响应类的基类
 *
 * @since v1.0-SNAPSHOT
 * @since v1.1-SNAPSHOT
 * @author xiao_lfeng
 */
public class BaseResponse {
    private String output;
    private Integer code;
    private String message;
    private String data;

    public String getOutput() {
        return output;
    }

    public BaseResponse setOutput(String output) {
        this.output = output;
        return this;
    }

    public Integer getCode() {
        return code;
    }

    public BaseResponse setCode(Integer code) {
        this.code = code;
        return this;
    }

    public String getMessage() {
        return message;
    }

    public BaseResponse setMessage(String message) {
        this.message = message;
        return this;
    }

    public String getData() {
        return data;
    }

    public BaseResponse setData(String data) {
        this.data = data;
        return this;
    }
}
