package com.javaweb.model.dto;

import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Setter
@Getter
public class AssignmentCustomerDTO extends AbstractDTO<AssignmentBuildingDTO>
{
    private Long customerId;
    private List<Long> staffs;

}
