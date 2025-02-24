package com.javaweb.api.admin;

import com.javaweb.model.dto.AssignmentCustomerDTO;
import com.javaweb.model.dto.CustomerDTO;
import com.javaweb.model.dto.TransactionTypeDTO;
import com.javaweb.model.request.CustomerSearchRequest;
import com.javaweb.model.response.CustomerSearchResponse;
import com.javaweb.model.response.ResponseDTO;
import com.javaweb.service.CustomerService;
import com.javaweb.service.TransactionTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.http.ResponseEntity;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RequestMapping("/api/customer")
@Transactional
@RestController
public class CustomerAPI
{
    @Autowired
    CustomerService customerService;

    @Autowired
    TransactionTypeService transactionTypeService;

    @PostMapping
    public ResponseEntity<CustomerDTO> addOrUpdateCustomer(@RequestBody CustomerDTO customerDTO)
    {
        return ResponseEntity.ok(customerService.addOrUpdateCustomer(customerDTO));
    }

    @GetMapping
    public List<CustomerSearchResponse> findAll(@ModelAttribute CustomerSearchRequest customerSearchRequest, Pageable pageable)
    {
        return customerService.findAll(customerSearchRequest, pageable);
    }

    @DeleteMapping("/{ids}")
    public void deleteCustomersByIds(@PathVariable Long[] ids)
    {
        customerService.deleteCustomersByIds(ids);
    }

    @PutMapping("/customer-assignment")
    public ResponseEntity<AssignmentCustomerDTO> updateAssigmentCustomer(@RequestBody AssignmentCustomerDTO assignmentCustomerDTO)
    {
        return ResponseEntity.ok(customerService.addAssignmentCustomerEntity(assignmentCustomerDTO));
    }

    @GetMapping("/{id}/staffs")
    public ResponseDTO loadStaffs(@PathVariable Long id)
    {
        ResponseDTO result = customerService.listStaffs(id);
        return result;
    }

    @PostMapping("/transaction-type")
    public ResponseEntity<TransactionTypeDTO> addOrUpdateTransactionType(@RequestBody TransactionTypeDTO transactionTypeDTO)
    {
        return ResponseEntity.ok(transactionTypeService.addOrUpdateTransactionType(transactionTypeDTO));
    }

    @GetMapping("/{id}/transaction-detail")
    public ResponseEntity<TransactionTypeDTO> getTransactionDetail(@PathVariable Long id)
    {
        return ResponseEntity.ok(transactionTypeService.findById(id));
    }
}
