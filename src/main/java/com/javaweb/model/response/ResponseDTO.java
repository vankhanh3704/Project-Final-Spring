package com.javaweb.model.response;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class ResponseDTO {
    private Object data;
    private String message;
    private String detail;

}
