package com.javaweb.service.impl;

import com.javaweb.converter.BuildingDTOtoEntityConverter;
import com.javaweb.converter.BuildingSearchResponseConverter;
import com.javaweb.entity.BuildingEntity;
import com.javaweb.entity.UserEntity;
import com.javaweb.exception.NotFoundException;
import com.javaweb.model.dto.AssignmentBuildingDTO;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.model.response.BuildingSearchResponse;
import com.javaweb.model.response.ResponseDTO;
import com.javaweb.model.response.StaffResponseDTO;
import com.javaweb.repository.BuildingRepository;
import com.javaweb.repository.UserRepository;
import com.javaweb.service.BuildingService;
import com.javaweb.utils.NumberUtils;
import com.javaweb.utils.StringUtils;
import com.javaweb.utils.UploadFileUtils;
import org.apache.tomcat.util.codec.binary.Base64;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.*;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.Optional;

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


    @Autowired
    private UploadFileUtils uploadFileUtils;

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
            if (staffAssignment.contains(it)) {
                staffResponseDTO.setChecked("checked");
            } else {
                staffResponseDTO.setChecked("");
            }
            staffResponseDTOS.add(staffResponseDTO);
        }
        responseDTO.setData(staffResponseDTOS);
        responseDTO.setMessage("success");
        return responseDTO;
    }

    @Override
    public List<BuildingSearchResponse> findAllHavePage(BuildingSearchRequest buildingSearchRequest, Pageable pageable) {
        List<BuildingEntity> buildingEntities = buildingRepository.findAll(buildingSearchRequest);
        List<BuildingSearchResponse> result = new ArrayList<>();
        for (BuildingEntity item : buildingEntities) {
            BuildingSearchResponse building = buildingSearchResponseConverter.toBuildingSearchResponse(item);
            result.add(building);
        }
        return result;
    }

    @Override
    public Page<BuildingSearchResponse> findAll(BuildingSearchRequest buildingSearchRequest, Pageable pageable) throws IOException {
        List<BuildingEntity> buildingEntities = buildingRepository.findAll(buildingSearchRequest);

        // Chuyển đổi danh sách BuildingEntity thành BuildingSearchResponse
        List<BuildingSearchResponse> result = new ArrayList<>();
        for (BuildingEntity item : buildingEntities) {
            BuildingSearchResponse building = buildingSearchResponseConverter.toBuildingSearchResponse(item);
            if (item.getImage() != null) {
                String base64Image = Base64.encodeBase64String(Files.readAllBytes(Paths.get("/Users/hoangkhanhvan/Desktop/" + item.getImage())));
                building.setImageBase64(base64Image);
            }
            result.add(building);
        }
        Sort.Order order = Optional.ofNullable(pageable.getSort())
                .flatMap(sort -> sort.stream().findFirst()) // Lấy phần tử đầu tiên nếu có
                .orElse(null); // Không có sắp xếp mặc định

        if (order != null) {
            Comparator<BuildingSearchResponse> comparator;
            switch (order.getProperty()) {
                case "floorArea":
                    comparator = Comparator.comparing(BuildingSearchResponse::getFloorArea);
                    break;
                case "rentPrice":
                default:
                    comparator = Comparator.comparing(BuildingSearchResponse::getRentPrice);
                    break;
            }
            // Nếu sort theo DESC thì đảo ngược comparator
            if (order.getDirection() == Sort.Direction.DESC) {
                comparator = comparator.reversed();
            }

            try {
                result.sort(comparator);
            } catch (NullPointerException e) {
                System.err.println("Lỗi NullPointerException khi sắp xếp danh sách: " + e.getMessage());
            }
        }
        // Tính toán phân trang
        int total = result.size(); // Tổng số bản ghi
        int start = (int) pageable.getOffset(); // Vị trí bắt đầu
        int end = Math.min((start + pageable.getPageSize()), total); // Vị trí kết thúc

        // Tạo danh sách con cho trang hiện tại
        List<BuildingSearchResponse> pageContent = result.subList(start, end);

        // Trả về đối tượng Page
        return new PageImpl<>(pageContent, pageable, total);
    }


    @Transactional
    @Override
    public void deleteBuildings(List<Long> ids) {
        buildingRepository.deleteByIdIn(ids);
    }


    @Override
    public BuildingDTO addOrUpdateBuilding(BuildingDTO buildingDTO) {

//        if(!checkAddBuilding(buildingDTO)) return null;
        BuildingEntity buildingEntity = buildingDTOtoEntityConverter.toBuildingEntity(buildingDTO);

        // update
        Long buildingId = buildingDTO.getId();
        if (buildingId != null) {
            BuildingEntity foundBuilding = buildingRepository.findById(buildingId)
                    .orElseThrow(() -> new NotFoundException("Building not found!"));
            buildingEntity.setUserEntities(foundBuilding.getUserEntities());
            buildingEntity.setImage(foundBuilding.getImage());
        }
        saveThumbnail(buildingDTO, buildingEntity);
        buildingRepository.save(buildingEntity);
        return buildingDTO;
    }

    private void saveThumbnail(BuildingDTO buildingDTO, BuildingEntity buildingEntity) {
        String path = "/building/" + buildingDTO.getImageName();
        if (null != buildingDTO.getImageBase64()) {
            if (null != buildingEntity.getImage()) {
                if (!path.equals(buildingEntity.getImage())) {
                    File file = new File("/Users/hoangkhanhvan/Desktop/" + buildingEntity.getImage());
                    file.delete();
                }
            }
            byte[] bytes = Base64.decodeBase64(buildingDTO.getImageBase64().getBytes());
            uploadFileUtils.writeOrUpdate(path, bytes);
            buildingEntity.setImage(path);
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
            message = "success";
        } catch (Exception e) {
            message = e.getMessage();
        }
        responseDTO.setMessage(message);
        return responseDTO;
    }

    @Override
    public int countTotalItem(List<BuildingSearchResponse> list) {
        int res = 0;
        for (BuildingSearchResponse it : list) res += buildingRepository.countTotalItem(it);
        return res;
    }

//    public static boolean checkAddBuilding(BuildingDTO buildingDTO)
//    {
//        if(!StringUtils.check(buildingDTO.getName())) return false;
//        if(!StringUtils.check(buildingDTO.getDistrict())) return false;
//        if(!StringUtils.check(buildingDTO.getWard())) return false;
//        if(!StringUtils.check(buildingDTO.getStreet())) return false;
//        if(!StringUtils.check(buildingDTO.getRentArea())) return false;
//        if(!StringUtils.check(buildingDTO.getRentPriceDescription())) return false;
//        if(!NumberUtils.checkNumber(buildingDTO.getNumberOfBasement())) return false;
//        if(!NumberUtils.checkNumber(buildingDTO.getFloorArea())) return false;
//        if(!NumberUtils.checkNumber(buildingDTO.getRentPrice())) return false;
//        return true;
//    }
}
