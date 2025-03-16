package com.javaweb.model.dto;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class TransactionTypeDTO extends AbstractDTO<TransactionTypeDTO>
{
    private Long id;
    private String code;
    private String note;
    private Long customerId;

    @Override
    public Long getId() {
        return id;
    }


}
