package com.morxeen.framework.base.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MainController {

    Logger logger = Logger.getLogger(MainController.class);

    @RequestMapping(method = RequestMethod.GET, value = "/")
    public String index(HttpServletRequest request) {

        return "main";
    }

    @RequestMapping(method = RequestMethod.GET, value = "/main")
    public String main(HttpServletRequest request) {

        return "main";
    }

    @RequestMapping(method = RequestMethod.GET, value = "/homePage")
    public String homePage(HttpServletRequest request) {

        return "homePage";
    }


}
