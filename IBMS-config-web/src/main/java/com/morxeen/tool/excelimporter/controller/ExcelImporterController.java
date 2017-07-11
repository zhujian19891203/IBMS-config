package com.morxeen.tool.excelimporter.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import javax.servlet.http.HttpServletRequest;
import java.util.Iterator;

/**
 * Created by zhujian on 2017/7/7.
 */

@Controller
@RequestMapping(value = "excelimporter")
public class ExcelImporterController {
    @RequestMapping(value = "/camera", method = RequestMethod.GET)
    public String camera() {
        return "tool/excelimporter/camera";
    }

    @RequestMapping(value = "/camera/upload", method = RequestMethod.POST)
    @ResponseBody
    public String cameraUpload(HttpServletRequest request) {
        // 将当前上下文初始化给 CommonsMutipartResolver (多部分解析器）
        CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver(request.getSession().getServletContext());
        // 检查form中是否有enctype="multipart/form-data"
        if(multipartResolver.isMultipart(request)) {
            // 将request变成多部分request
            MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest)request;
            // 获取multiRequest 中所有的文件名
            Iterator iter = multiRequest.getFileNames();

            while (iter.hasNext()) {
                MultipartFile file=multiRequest.getFile(iter.next().toString());
                System.out.println("Test:" + file.getOriginalFilename());
            }

        }

        return "";
    }

    @RequestMapping(value = "/buildingdevice", method = RequestMethod.GET)
    public String buildingdevice() {
        return "tool/excelimporter/buildingdevice";
    }
}
