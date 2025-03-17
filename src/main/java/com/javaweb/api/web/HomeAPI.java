package com.javaweb.api.web;

import com.javaweb.entity.BuildingEntity;
import com.javaweb.entity.CustomerEntity;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.model.request.CustomerSearchRequest;
import com.javaweb.model.response.BuildingSearchResponse;
import com.javaweb.repository.BuildingRepository;
import com.javaweb.repository.CustomerRepository;
import com.javaweb.service.BuildingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@RestController(value = "homeAPIAdmin")
@RequestMapping("/api/home")
public class HomeAPI {
    @Autowired
    private CustomerRepository customerRepository;
    @Autowired
    private BuildingRepository buildingRepository;
    @Autowired
    private BuildingService buildingService;

    @PostMapping("/lien-he")
    public void addCustomer(@RequestBody CustomerEntity customerEntity){
        customerEntity.setIsActive("1");
        customerRepository.save(customerEntity);
    }
    @GetMapping
    public List<BuildingSearchResponse> loadAllBuilding(@ModelAttribute BuildingSearchRequest buildingSearchRequest) throws IOException {
        return buildingService.findAll(buildingSearchRequest);
    }
}
