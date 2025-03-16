package com.javaweb.model.dto;



import lombok.Getter;
import lombok.Setter;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Setter
@Getter
public class UserDTO extends AbstractDTO<UserDTO> {

    private String userName;
    private String fullName;
    private String password;
    private Integer status;
    private List<RoleDTO> roles = new ArrayList<>();
    private String roleName;
    private String roleCode;
    private String rePassword;
    private Map<String,String> roleDTOs = new HashMap<>();

}
