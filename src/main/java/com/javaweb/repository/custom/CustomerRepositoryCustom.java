package com.javaweb.repository.custom;

import com.javaweb.entity.CustomerEntity;
import com.javaweb.model.request.CustomerSearchRequest;
import com.javaweb.model.response.CustomerSearchResponse;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface CustomerRepositoryCustom
{
    int countTotalItem(CustomerSearchResponse customerSearchResponse);
    List<CustomerEntity> findAll (CustomerSearchRequest customerSearchRequest, Pageable pageable);
}
