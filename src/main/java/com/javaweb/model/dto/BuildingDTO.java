package com.javaweb.model.dto;

import jdk.nashorn.internal.objects.annotations.Getter;
import jdk.nashorn.internal.objects.annotations.Setter;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@EqualsAndHashCode(callSuper = true)
@Data
public class BuildingDTO extends AbstractDTO<BuildingDTO>{
    private Long id;
    private String name;
    private Long floorArea;
    private String district;
    private String ward;
    private String street;
    private Long numberOfBasement;
    private String direction;
    private Long level;
    private String rentArea;
    private Long rentPrice;
    private String managerName;
    private String managerPhone;
    private List<String> typeCode;
    private String structure;
    private String rentPriceDescription;
    private String serviceFee;
    private String carFee;
    private String motoFee;
    private String numberOfBathrooms;
    private String electricityFee;
    private String deposit;
    private String payment;
    private String rentTime;
    private String numberOfBedrooms;
    private Integer brokerageFee;
    private String note;
    private String image;
    private String imageBase64;
    private String imageName;
    
    @Override
    public Long getId() {
        return id;
    }

    @Override
    public void setId(Long id) {
        this.id = id;
    }



    public String getImageBase64() {
        if (imageBase64 != null) {
            return imageBase64.split(",")[1];
        }
        return null;
    }
}