package com.javaweb.model.response;

import com.javaweb.model.dto.AbstractDTO;
import lombok.Data;
import lombok.EqualsAndHashCode;

@EqualsAndHashCode(callSuper = true)
@Data
public class CustomerSearchResponse extends AbstractDTO
{
    private Long id;
    private String fullName;
    private String phone;
    private String email;
    private String note;
    private String status;

    @Override
    public Long getId() {
        return id;
    }

    @Override
    public void setId(Long id) {
        this.id = id;
    }

}
