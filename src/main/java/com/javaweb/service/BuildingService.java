package com.javaweb.service;

import com.javaweb.model.dto.AssignmentBuildingDTO;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.model.response.BuildingSearchResponse;
import com.javaweb.model.response.ResponseDTO;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface BuildingService {
    ResponseDTO listStaff(Long buildingId);
    List<BuildingSearchResponse> findAll (BuildingSearchRequest buildingSearchRequest, Pageable pageable);
    void deleteBuildings(List<Long> ids);
    void addOrUpdateBulding(BuildingDTO buildingDTO);
    ResponseDTO updateAssignmentBuilding(AssignmentBuildingDTO assignmentBuildingDTO);
    int countTotalItem(List<BuildingSearchResponse> list);
}
