package com.javaweb.controller.web;

import com.javaweb.converter.BuildingDTOConverter;
import com.javaweb.converter.BuildingSearchResponseConverter;
import com.javaweb.enums.District;
import com.javaweb.enums.TypeCode;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.model.response.BuildingSearchResponse;
import com.javaweb.repository.BuildingRepository;
import com.javaweb.service.BuildingService;

import com.javaweb.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
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
	public ModelAndView homePage(BuildingSearchRequest buildingSearchRequest, HttpServletRequest request) throws IOException {
		ModelAndView mav = new ModelAndView("web/home");
        mav.addObject("modelSearch", buildingSearchRequest);
        //Xuong DB Lay Data ok roi
        List<BuildingSearchResponse> responseList = buildingService.findAll(buildingSearchRequest);

        mav.addObject("buildingList", responseList);
        mav.addObject("listStaffs", userService.getStaffs());
        mav.addObject("districts", District.type());
        mav.addObject("typeCodes", TypeCode.type());
		return mav;
	}

	@GetMapping(value="/gioi-thieu")
	public ModelAndView introduceBuilding(){
		ModelAndView mav = new ModelAndView("web/introduce");
		return mav;
	}

	@GetMapping(value="/san-pham")
	public ModelAndView buildingList(BuildingSearchRequest buildingSearchRequest, HttpServletRequest request) throws IOException {
		ModelAndView mav = new ModelAndView("/web/list");
		mav.addObject("modelSearch", buildingSearchRequest);
		//Xuong DB Lay Data ok roi
		List<BuildingSearchResponse> responseList = buildingService.findAll(buildingSearchRequest);
		mav.addObject("buildingList", responseList);
		mav.addObject("listStaffs", userService.getStaffs());
		mav.addObject("districts", District.type());
		mav.addObject("typeCodes", TypeCode.type());
		return mav;
	}

	@GetMapping(value="/tin-tuc")
	public ModelAndView news(){
		ModelAndView mav = new ModelAndView("/web/news");
		return mav;
	}

	@GetMapping(value="/lien-he")
	public ModelAndView contact()
	{
		ModelAndView mav = new ModelAndView("/web/contact");
		return mav;
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public ModelAndView login() {
		ModelAndView mav = new ModelAndView("login");
		return mav;
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
