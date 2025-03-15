package com.javaweb.controller;

import com.javaweb.model.dto.UserDTO;
import com.javaweb.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.validation.Valid;

@Controller
public class RegisterController {

    @Autowired
    private IUserService userService;

    @GetMapping(value = "/register")
    public ModelAndView showRegisterForm(@ModelAttribute("register") UserDTO userDTO) {
        return new ModelAndView("register");
    }


    @PostMapping(value = "/register")
    public ModelAndView handleRegister(@Valid @ModelAttribute("register") UserDTO userDTO, BindingResult bindingResult) {
        try {
            UserDTO registeredUser = userService.register(userDTO);
            return new ModelAndView("redirect:/login?registrationSuccess=true");
        } catch (IllegalArgumentException e) {
            ModelAndView mav = new ModelAndView("register");
            mav.addObject("error", e.getMessage());
            return mav;
        }
    }
}
