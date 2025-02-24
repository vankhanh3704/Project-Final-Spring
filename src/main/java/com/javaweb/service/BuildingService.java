package com.javaweb.service;

import com.javaweb.model.dto.AssignmentBuildingDTO;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.model.response.BuildingSearchResponse;
import com.javaweb.model.response.ResponseDTO;

import java.util.List;

public interface BuildingService {
    ResponseDTO listStaff(Long buildingId);
    List<BuildingSearchResponse> findAll(BuildingSearchRequest buildingSearchRequest);
    void deleteBuildings(List<Long> ids);
    void addOrUpdateBulding(BuildingDTO buildingDTO);
    ResponseDTO updateAssignmentBuilding(AssignmentBuildingDTO assignmentBuildingDTO);

}
