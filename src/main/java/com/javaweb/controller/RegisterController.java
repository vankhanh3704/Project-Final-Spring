package com.javaweb.controller;

import com.javaweb.model.dto.UserDTO;
import com.javaweb.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.validation.Valid;

@Controller
public class RegisterController {

    @Autowired
    private IUserService userService;
    @RequestMapping(value = "/register", method = RequestMethod.GET)
    public ModelAndView showRegisterForm(@ModelAttribute("register") UserDTO userDTO) {
        return new ModelAndView("register");
    }

    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public ModelAndView handleRegister(@Valid @ModelAttribute("register") UserDTO userDTO, BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            ModelAndView mav = new ModelAndView("register");
            mav.addObject("errors", bindingResult.getAllErrors());
            return mav;
        }

        try {
            boolean isRegistered = userService.register(userDTO);
            if (isRegistered) {
                return new ModelAndView("redirect:/login?registrationSuccess=true");
            } else {
                ModelAndView mav = new ModelAndView("register");
                mav.addObject("error", "Tài khoản đã tồn tại. Vui lòng sử dụng tên đăng nhập khác.");
                return mav;
            }
        } catch (Exception e) {
            ModelAndView mav = new ModelAndView("register");
            mav.addObject("error", "Đã xảy ra lỗi. Vui lòng thử lại.");
            return mav;
        }
    }
}
