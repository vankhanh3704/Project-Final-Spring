package com.javaweb.converter;

import com.javaweb.entity.CustomerEntity;
import com.javaweb.enums.Status;
import com.javaweb.model.dto.CustomerDTO;
import com.javaweb.model.response.CustomerSearchResponse;
import com.javaweb.repository.CustomerRepository;
import com.javaweb.utils.NumberUtils;
import com.javaweb.utils.StringUtils;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.Map;

@Component
public class CustomerConverter
{
    @Autowired
    ModelMapper modelMapper;

    @Autowired
    CustomerRepository customerRepository;

    public CustomerEntity toCustomerEntity(CustomerDTO customerDTO)
    {
        CustomerEntity customerEntity = modelMapper.map(customerDTO, CustomerEntity.class);
        customerEntity.setIsActive("1");
        Long customerId = customerDTO.getId();
        if(NumberUtils.checkNumber(customerId)) //update
        {
            CustomerEntity foundCustomer = customerRepository.findById(customerId).get();
            customerEntity.setTransactionTypes(foundCustomer.getTransactionTypes());
            customerEntity.setUserEntities(foundCustomer.getUserEntities());
            customerEntity.setCreatedDate(foundCustomer.getCreatedDate());
            customerEntity.setCreatedBy(foundCustomer.getCreatedBy());
        }

        //add
        else customerEntity.setStatus("CHUA_XU_LY");
        return customerEntity;
    }

    public CustomerSearchResponse toCustomerSearchResponse(CustomerEntity customerEntity)
    {
        Map<String, String> statuss = Status.type();
        CustomerSearchResponse res = modelMapper.map(customerEntity, CustomerSearchResponse.class);
        if(StringUtils.check(customerEntity.getStatus()))res.setStatus(statuss.get(customerEntity.getStatus()));
        return res;
    }

    public CustomerDTO toCustomerDTO(CustomerEntity customerEntity)
    {
        return modelMapper.map(customerEntity, CustomerDTO.class);
    }
}