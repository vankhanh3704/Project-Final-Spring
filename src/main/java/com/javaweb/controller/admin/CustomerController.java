package com.javaweb.controller.admin;

import com.javaweb.enums.Status;
import com.javaweb.enums.TransactionType;
import com.javaweb.model.dto.CustomerDTO;
import com.javaweb.model.dto.TransactionTypeDTO;
import com.javaweb.model.request.CustomerSearchRequest;
import com.javaweb.model.response.CustomerSearchResponse;
import com.javaweb.security.utils.SecurityUtils;
import com.javaweb.service.CustomerService;
import com.javaweb.service.TransactionTypeService;
import com.javaweb.service.impl.UserService;
import com.javaweb.utils.DisplayTagUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class CustomerController
{
    @Autowired
    CustomerService customerService;

    @Autowired
    UserService userService;

    @Autowired
    TransactionTypeService transactionTypeService;

    @RequestMapping(value = "/admin/customer-list", method = RequestMethod.GET)
    public ModelAndView customerList(@ModelAttribute CustomerSearchRequest customerSearchRequest, HttpServletRequest request)
    {
        ModelAndView mav = new ModelAndView("admin/customer/list");
        mav.addObject("modelSearch", customerSearchRequest);

        if(SecurityUtils.getAuthorities().contains("ROLE_STAFF"))
        {
            Long staffId = SecurityUtils.getPrincipal().getId();
            customerSearchRequest.setStaffId(staffId);
            mav.addObject("customerList", customerService.findAll(customerSearchRequest, PageRequest.of(customerSearchRequest.getPage() - 1, customerSearchRequest.getMaxPageItems())));
        }
        else mav.addObject("customerList", customerService.findAll(customerSearchRequest, PageRequest.of(customerSearchRequest.getPage() - 1, customerSearchRequest.getMaxPageItems())));

        List<CustomerSearchResponse> res = customerService.findAll(customerSearchRequest, PageRequest.of(customerSearchRequest.getPage() - 1, customerSearchRequest.getMaxPageItems()));
        CustomerSearchResponse customerSearchResponse = new CustomerSearchResponse();
        DisplayTagUtils.of(request, customerSearchResponse);
        customerSearchResponse.setListResult(res);
        customerSearchResponse.setTotalItems(customerService.countTotalItem(res));

        mav.addObject("customerList", customerSearchResponse);
        mav.addObject("listStaffs", userService.getStaffs());
        return mav;
    }

    @RequestMapping(value = "/admin/customer-edit", method = RequestMethod.GET)
    public ModelAndView customerEdit(@ModelAttribute("customerEdit") CustomerDTO customerDTO, HttpServletRequest request)
    {
        ModelAndView mav = new ModelAndView("admin/customer/edit");
        mav.addObject("statuss", Status.type());
        return mav;
    }

    @RequestMapping(value = "/admin/customer-edit-{id}", method = RequestMethod.GET)
    public ModelAndView customerEdit(@PathVariable("id") Long id, HttpServletRequest request)
    {
        ModelAndView mav = new ModelAndView("admin/customer/edit");
        CustomerDTO customerDTO = customerService.findById(id);
        List<TransactionTypeDTO> listCSKH = transactionTypeService.findByCodeAndCustomerId("CSKH", id);
        List<TransactionTypeDTO> listDDX = transactionTypeService.findByCodeAndCustomerId("DDX", id);
        mav.addObject("customerEdit", customerDTO);
        mav.addObject("transactionType", TransactionType.transactionType());
        mav.addObject("transactionListCSKH", listCSKH);
        mav.addObject("transactionListDDX", listDDX);
        mav.addObject("statuss", Status.type());
        return mav;
    }

    @RequestMapping(value = "/lien-he", method = RequestMethod.POST)
    public ResponseEntity<?> contact(@RequestBody CustomerDTO customer)
    {
        if(customer.getCustomerPhone() != null && customer.getFullName() != null){
            customerService.addOrUpdateCustomer(customer);
        }
        return ResponseEntity.ok("");
    }
}