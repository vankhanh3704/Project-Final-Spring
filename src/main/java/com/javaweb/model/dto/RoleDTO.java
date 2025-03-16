package com.javaweb.model.dto;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class RoleDTO extends AbstractDTO<RoleDTO> {

	private static final long serialVersionUID = 5830885581031027382L;

    private String name;
    private String code;

}
