package com.morxeen.tool.jsoneditor.controller;

import com.morxeen.framework.base.pojo.Result;
import com.morxeen.framework.base.service.BaseService;
import com.morxeen.framework.util.SecurityUtil;
import com.morxeen.tool.jsoneditor.entity.JsonEditorPatrolpath;
import com.morxeen.tool.jsoneditor.entity.JsonEditorTabinfo;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.Date;

/**
 * Created by zhujian on 2017/7/6.
 */

@Controller
@RequestMapping(value = "jsoneditor")
public class JsonEditorController {
    @RequestMapping(value = "/tabinfo", method = RequestMethod.GET)
    public String tabinfo() {
        return "tool/jsoneditor/tabinfo";
    }

    @RequestMapping(value = "/tabinfo/get", method = RequestMethod.POST)
    @ResponseBody
    public JsonEditorTabinfo tabinfoGet() {
        return baseService.get("from JsonEditorTabinfo");
    }

    @RequestMapping(value = "/tabinfo/save", method = RequestMethod.POST)
    @ResponseBody
    public Result tabinfoSave(JsonEditorTabinfo obj) {
        JsonEditorTabinfo obj_tabinfo = baseService.get(JsonEditorTabinfo.class, obj.getId());
        obj_tabinfo.setUpdateDateTime(new Date());
        obj_tabinfo.setUserId(SecurityUtil.getUserId());
        obj_tabinfo.setContent(obj.getContent());
        baseService.update(obj_tabinfo);

        return new Result();
    }

    @RequestMapping(value = "/patrolpath", method = RequestMethod.GET)
    public String patrolpath() {
        return "tool/jsoneditor/patrolpath";
    }

    @RequestMapping(value = "/patrolpath/get", method = RequestMethod.POST)
    @ResponseBody
    public JsonEditorPatrolpath patrolpathGet() {
        return baseService.get("from JsonEditorPatrolpath");
    }

    @RequestMapping(value = "/patrolpath/save", method = RequestMethod.POST)
    @ResponseBody
    public Result patrolpathSave(JsonEditorPatrolpath obj) {
        JsonEditorPatrolpath obj_patrolpath = baseService.get(JsonEditorPatrolpath.class, obj.getId());
        obj_patrolpath.setUpdateDateTime(new Date());
        obj_patrolpath.setUserId(SecurityUtil.getUserId());
        obj_patrolpath.setContent(obj.getContent());
        baseService.update(obj_patrolpath);

        return new Result();
    }

    @Resource
    private BaseService baseService;
}
