package com.javaweb.model.dto;


import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CustomerDTO extends AbstractDTO<CustomerDTO>
{
    private Long id;
    private String fullName;
    private String managementStaff;
    private String customerPhone;
    private String email;
    private String note;
    private String status;
    private String companyName;

    @Override
    public Long getId() {
        return id;
    }

    @Override
    public void setId(Long id) {
        this.id = id;
    }


}
