package com.javaweb.service;

import com.javaweb.entity.BuildingEntity;
import com.javaweb.model.dto.AssignmentBuildingDTO;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.model.response.BuildingSearchResponse;
import com.javaweb.model.response.ResponseDTO;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.io.IOException;
import java.util.List;

public interface BuildingService {
    ResponseDTO listStaff(Long buildingId);
    List<BuildingSearchResponse> findAllHavePage(BuildingSearchRequest buildingSearchRequest, Pageable pageable);
    List<BuildingSearchResponse> findAll(BuildingSearchRequest buildingSearchRequest) throws IOException;
    void deleteBuildings(List<Long> ids);
    BuildingDTO addOrUpdateBuilding(BuildingDTO buildingDTO);
    ResponseDTO updateAssignmentBuilding(AssignmentBuildingDTO assignmentBuildingDTO);
    int countTotalItem(List<BuildingSearchResponse> list);

}
