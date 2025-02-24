package com.javaweb.api.web;

import com.javaweb.entity.CustomerEntity;
import com.javaweb.repository.CustomerRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController(value = "homeAPIAdmin")
@RequestMapping("/api/home")
public class HomeAPI {
    @Autowired
    private CustomerRepository customerRepository;

	@PostMapping("/lien-he")
    public void addCustomer(@RequestBody CustomerEntity customerEntity){
        customerEntity.setIsActive("1");
        customerRepository.save(customerEntity);
    }
	
}
