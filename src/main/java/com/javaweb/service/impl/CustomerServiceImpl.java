package com.javaweb.service.impl;

import com.javaweb.converter.CustomerConverter;
import com.javaweb.entity.CustomerEntity;
import com.javaweb.entity.UserEntity;
import com.javaweb.model.dto.AssignmentCustomerDTO;
import com.javaweb.model.dto.CustomerDTO;
import com.javaweb.model.request.CustomerSearchRequest;
import com.javaweb.model.response.CustomerSearchResponse;
import com.javaweb.model.response.ResponseDTO;
import com.javaweb.model.response.StaffResponseDTO;
import com.javaweb.repository.CustomerRepository;
import com.javaweb.repository.UserRepository;
import com.javaweb.service.CustomerService;
import com.javaweb.utils.NumberUtils;
import com.javaweb.utils.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class CustomerServiceImpl implements CustomerService
{
    @Autowired
    CustomerConverter customerConverter;

    @Autowired
    CustomerRepository customerRepository;

    @Autowired
    UserRepository userRepository;

    @Override
    public CustomerDTO addOrUpdateCustomer(CustomerDTO customerDTO)
    {
        if(!validateCreateOrUpdateCustomer(customerDTO)) return null;
        CustomerEntity customerEntity = customerConverter.toCustomerEntity(customerDTO);
        customerRepository.save(customerEntity);
        return customerDTO;
    }

    public boolean validateCreateOrUpdateCustomer(CustomerDTO customerDTO)
    {
        if(!StringUtils.check(customerDTO.getCustomerPhone())) return false;
        if(!StringUtils.check(customerDTO.getFullName())) return false;
        return true;
    }

    @Override
    public void deleteCustomersByIds(Long[] ids)
    {
        for(Long it : ids)
        {
            CustomerEntity customerEntity = customerRepository.findById(it).get();
            customerEntity.setIsActive("0");
            customerRepository.save(customerEntity);
        }
    }

    @Override
    public List<CustomerSearchResponse> findAll(CustomerSearchRequest customerSearchRequest, Pageable pageable)
    {
        List<CustomerEntity> customerEntities = customerRepository.findAll(customerSearchRequest, pageable);
        List<CustomerSearchResponse> res = new ArrayList<>();

        for(CustomerEntity it : customerEntities) res.add(customerConverter.toCustomerSearchResponse(it));
        return res;
    }

    @Override
    public int countTotalItem(List<CustomerSearchResponse> list) {
        int res = 0;
        for(CustomerSearchResponse it : list) res += customerRepository.countTotalItem(it);
        return res;
    }

    @Override
    public AssignmentCustomerDTO addAssignmentCustomerEntity(AssignmentCustomerDTO assignmentCustomerDTO)
    {
        CustomerEntity customerEntity = customerRepository.findById(assignmentCustomerDTO.getCustomerId()).get();
        List<UserEntity> userEntities = userRepository.findByIdIn(assignmentCustomerDTO.getStaffs());
        customerEntity.setUserEntities(userEntities);
        customerRepository.save(customerEntity);
        return assignmentCustomerDTO;
    }

    @Override
    public ResponseDTO listStaffs(Long customerId)
    {
        CustomerEntity customerEntity = customerRepository.findById(customerId).get();
        List<UserEntity> staffs = userRepository.findByStatusAndRoles_Code(1, "STAFF");
        List<UserEntity> staffAssignment = customerEntity.getUserEntities();

        List<StaffResponseDTO> staffResponseDTOS = new ArrayList<>();
        ResponseDTO responseDTO = new ResponseDTO();

        for(UserEntity it : staffs)
        {
            StaffResponseDTO staffResponseDTO = new StaffResponseDTO();
            staffResponseDTO.setFullName(it.getFullName());
            staffResponseDTO.setStaffId(it.getId());

            if(staffAssignment.contains(it)) staffResponseDTO.setChecked("checked");
            else staffResponseDTO.setChecked("");

            staffResponseDTOS.add(staffResponseDTO);
        }
        responseDTO.setData(staffResponseDTOS);
        responseDTO.setMessage("success");
        return responseDTO;
    }

    @Override
    public CustomerDTO findById(Long id) {
        CustomerEntity customerEntity = customerRepository.findById(id).get();
        return customerConverter.toCustomerDTO(customerEntity);
    }
}
