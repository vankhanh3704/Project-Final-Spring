package com.javaweb.model.response;


import com.javaweb.model.dto.AbstractDTO;
import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class BuildingSearchResponse extends AbstractDTO {
	private Long id;
    private String name;
	private String address;
	private Long numberOfBasement;
	private String managerName;
	private String managerPhone;
	private Long floorArea;
	private String rentArea;
    private String emptyArea;
	private String structure;
    private Long rentPrice;
    private String serviceFee;
    private Double brokerageFee;
	private String typeCode;
	private String rentPriceDescription;
	private String carFee;
	private String motorbikeFee;
	private String extraFee;
	private String electricFee;
	private String deposit;
	private String payment;
	private String rentTime;
	private String decorationTime;
	private String note;
	private String image;
	private String imageBase64;

    public void setCreatedDate(String createdDate) {
    }

    public String getManagerPhoneNumber() {
		return managerPhone;
	}
	public void setManagerPhoneNumber(String managerPhoneNumber) {
		this.managerPhone = managerPhoneNumber;
	}


}
