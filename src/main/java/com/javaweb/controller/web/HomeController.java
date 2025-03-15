package com.javaweb.controller.web;

import com.javaweb.converter.BuildingDTOConverter;
import com.javaweb.converter.BuildingSearchResponseConverter;
import com.javaweb.enums.District;
import com.javaweb.enums.TypeCode;
import com.javaweb.model.dto.UserDTO;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.model.response.BuildingSearchResponse;
import com.javaweb.repository.BuildingRepository;
import com.javaweb.service.BuildingService;

import com.javaweb.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.io.IOException;
import java.util.List;

@Controller(value = "homeControllerOfWeb")
public class HomeController {

	@Autowired
	private BuildingRepository buildingRepository;
	@Autowired
	private BuildingService buildingService;
	@Autowired
	private IUserService userService;
	@Autowired
	private BuildingDTOConverter buildingDTOConverter;
	@Autowired
	private BuildingSearchResponseConverter buildingSearchResponseConverter;




	@RequestMapping(value = "/trang-chu", method = RequestMethod.GET)
	public ModelAndView homePage(
			BuildingSearchRequest buildingSearchRequest,
			@RequestParam(defaultValue = "1") int page, // Trang hiện tại, mặc định là 1
			@RequestParam(defaultValue = "1") int size, // Số lượng sản phẩm trên mỗi trang, mặc định là 10
			HttpServletRequest request) throws IOException {

		ModelAndView mav = new ModelAndView("/web/home");
		mav.addObject("modelSearch", buildingSearchRequest);

		// Phân trang dữ liệu
		Pageable pageable = PageRequest.of(page - 1, size); // Pageable bắt đầu từ 0
		Page<BuildingSearchResponse> responsePage = buildingService.findAll(buildingSearchRequest, pageable);

		// Lấy danh sách sản phẩm và tổng số trang
		List<BuildingSearchResponse> responseList = responsePage.getContent();
		int totalPages = responsePage.getTotalPages();

		// Thêm dữ liệu vào ModelAndView
		mav.addObject("buildingList", responseList);
		mav.addObject("totalPages", totalPages);
		mav.addObject("currentPage", page);
		mav.addObject("pageSize", size);

		mav.addObject("listStaffs", userService.getStaffs());
		mav.addObject("districts", District.type());
		mav.addObject("typeCodes", TypeCode.type());

		return mav;
	}

	@GetMapping(value="/gioi-thieu")
	public ModelAndView introduceBuilding(BuildingSearchRequest buildingSearchRequest,
										  @RequestParam(defaultValue = "1") int page, // Trang hiện tại, mặc định là 1
										  @RequestParam(defaultValue = "1") int size,
										  HttpServletRequest request) throws IOException{
		ModelAndView mav = new ModelAndView("web/introduce");
		mav.addObject("modelSearch", buildingSearchRequest);

		// Phân trang dữ liệu
		Pageable pageable = PageRequest.of(page - 1, size); // Pageable bắt đầu từ 0
		Page<BuildingSearchResponse> responsePage = buildingService.findAll(buildingSearchRequest, pageable);

		// Lấy danh sách sản phẩm và tổng số trang
		List<BuildingSearchResponse> responseList = responsePage.getContent();
		int totalPages = responsePage.getTotalPages();

		// Thêm dữ liệu vào ModelAndView
		mav.addObject("buildingList", responseList);
		mav.addObject("totalPages", totalPages);
		mav.addObject("currentPage", page);
		mav.addObject("pageSize", size);

		mav.addObject("listStaffs", userService.getStaffs());
		mav.addObject("districts", District.type());
		mav.addObject("typeCodes", TypeCode.type());

		return mav;
	}

	@GetMapping(value = "/san-pham")
	public ModelAndView buildingList(
			BuildingSearchRequest buildingSearchRequest,
			@RequestParam(defaultValue = "1") int page, // Trang hiện tại, mặc định là 1
			@RequestParam(defaultValue = "2") int size, // Số lượng sản phẩm trên mỗi trang, mặc định là 10
			@RequestParam(required = false) String sort,
			HttpServletRequest request) throws IOException {

		ModelAndView mav = new ModelAndView("/web/list");
		mav.addObject("modelSearch", buildingSearchRequest);
		Sort sorting = Sort.unsorted(); // Mặc định không sắp xếp
		if (sort != null) {
			switch (sort) {
				case "thap-cao":
					sorting = Sort.by(Sort.Direction.ASC, "rentPrice"); // Giá từ thấp đến cao
					break;
				case "cao-thap":
					sorting = Sort.by(Sort.Direction.DESC, "rentPrice"); // Giá từ cao đến thấp
					break;
				case "dien-tich-tang":
					sorting = Sort.by(Sort.Direction.ASC, "floorArea"); // Diện tích tăng dần
					break;
				case "dien-tich-giam":
					sorting = Sort.by(Sort.Direction.DESC, "floorArea"); // Diện tích giảm dần
					break;
			}
		}

		// Phân trang dữ liệu
		Pageable pageable = PageRequest.of(page - 1, size, sorting); // Pageable bắt đầu từ 0
		Page<BuildingSearchResponse> responsePage = buildingService.findAll(buildingSearchRequest, pageable);

		// Lấy danh sách sản phẩm và tổng số trang
		List<BuildingSearchResponse> responseList = responsePage.getContent();
		int totalPages = responsePage.getTotalPages();

		// Thêm dữ liệu vào ModelAndView
		mav.addObject("buildingList", responseList);
		mav.addObject("totalPages", totalPages);
		mav.addObject("currentPage", page);
		mav.addObject("pageSize", size);
		mav.addObject("sort", sort);
		mav.addObject("listStaffs", userService.getStaffs());
		mav.addObject("districts", District.type());
		mav.addObject("typeCodes", TypeCode.type());

		return mav;
	}

//	@GetMapping(value="/tin-tuc")
//	public ModelAndView news(BuildingSearchRequest buildingSearchRequest, HttpServletRequest request) throws IOException {
//		ModelAndView mav = new ModelAndView("/web/news");
//		mav.addObject("modelSearch", buildingSearchRequest);
//		//Xuong DB Lay Data ok roi
//		List<BuildingSearchResponse> responseList = buildingService.findAll(buildingSearchRequest);
//		mav.addObject("buildingList", responseList);
//		mav.addObject("listStaffs", userService.getStaffs());
//		mav.addObject("districts", District.type());
//		mav.addObject("typeCodes", TypeCode.type());
//		return mav;
//	}

	@GetMapping(value="/lien-he")
	public ModelAndView contact(BuildingSearchRequest buildingSearchRequest,
										  @RequestParam(defaultValue = "1") int page, // Trang hiện tại, mặc định là 1
										  @RequestParam(defaultValue = "1") int size,
										  HttpServletRequest request) throws IOException{
		ModelAndView mav = new ModelAndView("web/contact");
		mav.addObject("modelSearch", buildingSearchRequest);

		// Phân trang dữ liệu
		Pageable pageable = PageRequest.of(page - 1, size); // Pageable bắt đầu từ 0
		Page<BuildingSearchResponse> responsePage = buildingService.findAll(buildingSearchRequest, pageable);

		// Lấy danh sách sản phẩm và tổng số trang
		List<BuildingSearchResponse> responseList = responsePage.getContent();
		int totalPages = responsePage.getTotalPages();

		mav.addObject("buildingList", responseList);
		mav.addObject("totalPages", totalPages);
		mav.addObject("currentPage", page);
		mav.addObject("pageSize", size);
		mav.addObject("listStaffs", userService.getStaffs());
		mav.addObject("districts", District.type());
		mav.addObject("typeCodes", TypeCode.type());
		return mav;
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public ModelAndView login() {
        return new ModelAndView("login");
	}



	@RequestMapping(value = "/access-denied", method = RequestMethod.GET)
	public ModelAndView accessDenied() {
		return new ModelAndView("redirect:/login?accessDenied");
	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (auth != null) {
			new SecurityContextLogoutHandler().logout(request, response, auth);
		}
		return new ModelAndView("redirect:/trang-chu");
	}
}
