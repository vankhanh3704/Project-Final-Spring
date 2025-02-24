package com.javaweb.service;

import com.javaweb.model.dto.AssignmentCustomerDTO;
import com.javaweb.model.dto.CustomerDTO;
import com.javaweb.model.request.CustomerSearchRequest;
import com.javaweb.model.response.CustomerSearchResponse;
import com.javaweb.model.response.ResponseDTO;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface CustomerService
{
    CustomerDTO addOrUpdateCustomer(CustomerDTO customerDTO);
    void deleteCustomersByIds(Long[] ids);
    List<CustomerSearchResponse> findAll(CustomerSearchRequest customerSearchRequest, Pageable pageable);
    int countTotalItem(List<CustomerSearchResponse> list);
    AssignmentCustomerDTO addAssignmentCustomerEntity(AssignmentCustomerDTO assignmentCustomerDTO);
    ResponseDTO listStaffs(Long customerId);
    CustomerDTO findById(Long id);
}
