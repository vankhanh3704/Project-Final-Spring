package com.javaweb.model.dto;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class PasswordDTO extends AbstractDTO<PasswordDTO> {

    private static final long serialVersionUID = 8835146939192307340L;

    private String oldPassword;
    private String newPassword;
    private String confirmPassword;

}
