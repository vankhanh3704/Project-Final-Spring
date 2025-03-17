package com.javaweb.controller.web;

import com.javaweb.converter.BuildingSearchResponseConverter;
import com.javaweb.entity.BuildingEntity;
import com.javaweb.enums.District;
import com.javaweb.enums.TypeCode;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.model.response.BuildingSearchResponse;
import com.javaweb.repository.BuildingRepository;
import com.javaweb.service.BuildingService;

import com.javaweb.service.IUserService;
import com.javaweb.utils.strategy.SortingStrategy;
import com.javaweb.utils.strategy.SortingStrategyFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller(value = "homeControllerOfWeb")
public class HomeController {

    private static final Map<String, SortingStrategy> sortStrategyMap = new HashMap<>();

    @Autowired
    private BuildingRepository buildingRepository;
    @Autowired
    private BuildingService buildingService;
    @Autowired
    private IUserService userService;
    @Autowired
    private BuildingSearchResponseConverter buildingSearchResponseConverter;


    @RequestMapping(value = "/trang-chu", method = RequestMethod.GET)
    public ModelAndView homePage(
            @ModelAttribute BuildingSearchRequest buildingSearchRequest) {

        ModelAndView mav = new ModelAndView("/web/home");
        mav.addObject("modelSearch", buildingSearchRequest);
        mav.addObject("districts", District.type());
        mav.addObject("typeCodes", TypeCode.type());
        return mav;
    }

    @GetMapping(value = "/gioi-thieu")
    public ModelAndView introduceBuilding(@ModelAttribute BuildingSearchRequest buildingSearchRequest) {
        ModelAndView mav = new ModelAndView("web/introduce");
        mav.addObject("modelSearch", buildingSearchRequest);
        mav.addObject("districts", District.type());
        mav.addObject("typeCodes", TypeCode.type());


        return mav;
    }

    @GetMapping(value = "/san-pham")
    public ModelAndView buildingList(
            @ModelAttribute BuildingSearchRequest buildingSearchRequest,
            @RequestParam(defaultValue = "1") int page, // Trang hiện tại, mặc định là 1
            @RequestParam(defaultValue = "2") int size, // Số lượng sản phẩm trên mỗi trang, mặc định là 10
            @RequestParam(required = false) String sort,
            HttpServletRequest request) throws IOException {

        ModelAndView mav = new ModelAndView("/web/list");
        mav.addObject("modelSearch", buildingSearchRequest);

        SortingStrategy sortingStrategy = SortingStrategyFactory.getStrategy(sort);
        Sort sorting = sortingStrategy.getSort();

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

    @GetMapping(value = "/lien-he")
    public ModelAndView contact(@ModelAttribute BuildingSearchRequest buildingSearchRequest) {
        ModelAndView mav = new ModelAndView("web/contact");
        mav.addObject("modelSearch", buildingSearchRequest);
        mav.addObject("districts", District.type());
        mav.addObject("typeCodes", TypeCode.type());
        return mav;
    }

    @GetMapping(value = "/detail-{id}")
    public ModelAndView detailBuilding(@PathVariable("id") Long id, HttpServletRequest request) {
        ModelAndView mav = new ModelAndView("/web/detail");
        BuildingEntity buildingEntity = buildingRepository.findById(id).get();
        BuildingSearchResponse buildingSearchResponse = buildingSearchResponseConverter.toBuildingSearchResponse(buildingEntity);
        BuildingSearchRequest modelSearch = new BuildingSearchRequest();
        mav.addObject("modelSearch", modelSearch);
        mav.addObject("districts", District.type());
        mav.addObject("typeCodes", TypeCode.type());
        mav.addObject("building", buildingSearchResponse);
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
