package com.javaweb.converter;

import com.javaweb.entity.BuildingEntity;
import com.javaweb.entity.RentAreaEntity;
import com.javaweb.model.dto.BuildingDTO;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.ArrayList;

@Component
public class BuildingDTOtoEntityConverter {
    @Autowired
    private ModelMapper modelMapper;

    public BuildingEntity toBuildingEntity(BuildingDTO dto) {
        BuildingEntity buildingEntity = modelMapper.map(dto, BuildingEntity.class);
        String rentAreaStr = dto.getRentArea();
        String[] a=rentAreaStr.trim().split(",");
        ArrayList<RentAreaEntity> rentAreaEntities = new ArrayList<>();
        for(String x:a){
            if(x.trim()!="") {
                RentAreaEntity renttmp = new RentAreaEntity();
                renttmp.setValue(x.trim());
                renttmp.setBuilding(buildingEntity);
                rentAreaEntities.add(renttmp);
            }
        }
        buildingEntity.setRentAreas(rentAreaEntities);

        String s= String.join( ",", dto.getTypeCode());
        buildingEntity.setTypeCode(s);
        return buildingEntity;
    }
}