package com.javaweb.converter;

import com.javaweb.entity.BuildingEntity;
import com.javaweb.entity.RentAreaEntity;
import com.javaweb.enums.District;
import com.javaweb.enums.TypeCode;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.response.BuildingSearchResponse;
import org.apache.tomcat.util.codec.binary.Base64;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@Component
public class BuildingSearchResponseConverter {
    @Autowired
    private ModelMapper modelMapper;

    public BuildingSearchResponse toBuildingSearchResponse(BuildingEntity k) {
        BuildingSearchResponse buildingSearchResponse = modelMapper.map(k, BuildingSearchResponse.class);

        List<RentAreaEntity> rentAreaEntities = k.getRentAreas();
        String rentarea = rentAreaEntities.stream().map(it -> it.getValue().toString()).collect(Collectors.joining(","));

        buildingSearchResponse.setAddress(k.getStreet() + ", " + k.getWard() + ", "+ District.valueOf(k.getDistrict()).getDistrictName());
        buildingSearchResponse.setRentArea(rentarea);
        String[] typeTmps=k.getTypeCode().trim().split(",");
        ArrayList<String> types= new ArrayList<>();
        for(String type:typeTmps){
            String name= TypeCode.valueOf(type).getTypeCodeName();
            types.add(name);
        }
        String typeCode=types.stream().map(it -> it).collect(Collectors.joining(", "));
        buildingSearchResponse.setTypeCode(typeCode);
        if (buildingSearchResponse.getImage() != null && !buildingSearchResponse.getImage().isEmpty()) {
            String base64Image = null;
            try {
                base64Image = Base64.encodeBase64String(Files.readAllBytes(Paths.get("/Users/hoangkhanhvan/Desktop/" + buildingSearchResponse.getImage())));
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
            buildingSearchResponse.setImageBase64(base64Image);
        }
        return buildingSearchResponse;
    }
}