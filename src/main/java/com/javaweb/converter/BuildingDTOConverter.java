package com.javaweb.converter;

import com.javaweb.entity.BuildingEntity;
import com.javaweb.entity.RentAreaEntity;
import com.javaweb.enums.District;
import com.javaweb.model.dto.BuildingDTO;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.stream.Collectors;

@Component
public class BuildingDTOConverter {
    @Autowired
    private ModelMapper modelMapper;

    public BuildingDTO toBuildingDTO(BuildingEntity k) {
        BuildingDTO buildingDTO = modelMapper.map(k, BuildingDTO.class);

        List<RentAreaEntity> rentAreaEntities = k.getRentAreas();
        String rentarea = rentAreaEntities.stream().map(it -> it.getValue().toString()).collect(Collectors.joining(","));
        buildingDTO.setRentArea(rentarea);
        buildingDTO.setDistrict(District.valueOf(k.getDistrict()).getDistrictName());
        Map<String, String > districts = District.type();
        String districtName = "";
        if(k.getDistrict() != null && !Objects.equals(k.getDistrict(), "")){
            districtName = districts.get(k.getDistrict());
        }
        buildingDTO.setDistrict(districtName);
        return buildingDTO;
    }
}
