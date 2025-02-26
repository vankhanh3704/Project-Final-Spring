package com.javaweb.service.impl;

import com.javaweb.converter.BuildingDTOtoEntityConverter;
import com.javaweb.converter.BuildingSearchResponseConverter;
import com.javaweb.entity.BuildingEntity;
import com.javaweb.entity.UserEntity;
import com.javaweb.model.dto.AssignmentBuildingDTO;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.model.response.BuildingSearchResponse;
import com.javaweb.model.response.ResponseDTO;
import com.javaweb.model.response.StaffResponseDTO;
import com.javaweb.repository.BuildingRepository;
import com.javaweb.repository.UserRepository;
import com.javaweb.service.BuildingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Service
public class BuildingServiceImpl implements BuildingService {
    @Autowired
    private BuildingSearchResponseConverter buildingSearchResponseConverter;

    @Autowired
    private BuildingRepository buildingRepository;
    @Autowired
    private UserRepository userRepository;

    @Autowired
    private BuildingDTOtoEntityConverter buildingDTOtoEntityConverter;

    @Autowired
    private BuildingService buildingService;

    public ResponseDTO listStaff(Long buildingId) {
        BuildingEntity building = buildingRepository.findById(buildingId).get();
        List<UserEntity> staffs = userRepository.findByStatusAndRoles_Code(1, "STAFF");
        List<UserEntity> staffAssignment = building.getUserEntities();
        List<StaffResponseDTO> staffResponseDTOS = new ArrayList<>();
        ResponseDTO responseDTO = new ResponseDTO();
        for (UserEntity it : staffs) {
            StaffResponseDTO staffResponseDTO = new StaffResponseDTO();
            staffResponseDTO.setFullName(it.getFullName());
            staffResponseDTO.setStaffId(it.getId());
            if(staffAssignment.contains(it)){
                staffResponseDTO.setChecked("checked");
            }
            else{
                staffResponseDTO.setChecked("");
            }
            staffResponseDTOS.add(staffResponseDTO);
        }
        responseDTO.setData(staffResponseDTOS);
        responseDTO.setMessage("success");
        return responseDTO;
    }

    @Override
    public List<BuildingSearchResponse> findAll(BuildingSearchRequest buildingSearchRequest, Pageable pageable) {
        List<BuildingEntity> buildingEntities = buildingRepository.findAll(buildingSearchRequest);
        List<BuildingSearchResponse> result = new ArrayList<>();
        for(BuildingEntity item: buildingEntities) {
            BuildingSearchResponse building = buildingSearchResponseConverter.toBuildingSearchResponse(item) ;
            result.add(building);
        }
        return result;
    }


    @Transactional
    @Override
    public void deleteBuildings(List<Long> ids) {
        buildingRepository.deleteByIdIn(ids);
    }

    @Override
    public void addOrUpdateBulding(BuildingDTO buildingDTO) {
        if(buildingDTO.getId()==null){
            BuildingEntity buildingEntity=buildingDTOtoEntityConverter.toBuildingEntity(buildingDTO);
            buildingRepository.save(buildingEntity);
        } else {
            BuildingEntity buildingEntity = buildingRepository.findById(buildingDTO.getId()).get();
            buildingEntity = buildingDTOtoEntityConverter.toBuildingEntity(buildingDTO);
            buildingRepository.save(buildingEntity);
        }
    }

    @Override
    public ResponseDTO updateAssignmentBuilding(AssignmentBuildingDTO assignmentBuildingDTO) {
        ResponseDTO responseDTO = new ResponseDTO();
        String message = "";
        try {
            BuildingEntity buildingEntity = buildingRepository.findById(assignmentBuildingDTO.getBuildingId()).get();
            List<UserEntity> userEntities = buildingEntity.getUserEntities();
            userEntities.clear();
            for (Long id : assignmentBuildingDTO.getStaffs()) {
                userEntities.add(userRepository.findById(id).get());
            }
            buildingEntity.setUserEntities(userEntities);
            buildingRepository.save(buildingEntity);
            message="success";
        }
        catch (Exception e){
            message = e.getMessage();
        }
        responseDTO.setMessage(message);
        return responseDTO;
    }

    @Override
    public int countTotalItem(List<BuildingSearchResponse> list) {
        int res = 0;
        for(BuildingSearchResponse it : list) res += buildingRepository.countTotalItem(it);
        return res;
    }


}
