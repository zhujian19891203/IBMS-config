package com.morxeen.framework.base.controller;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.morxeen.framework.base.entity.Dict;
import com.morxeen.framework.base.pojo.Result;
import com.morxeen.framework.base.pojo.TreeNode;
import com.morxeen.framework.base.service.DictService;
import com.morxeen.framework.utils.StrUtil;

@Controller
@RequestMapping(value = "/dict")
public class DictController {

    @Resource
    private DictService dictService;

    /**
     * 用户列表
     */
    @RequestMapping(method = RequestMethod.GET, value = "/tree")
    private String list() {

        return "base/dict/dict_tree";
    }

    @RequestMapping(value = "/all", method = RequestMethod.POST)
    @ResponseBody
    public List<Dict> getAll() {

        String hql = "from Dict order by levelCode asc";
        return dictService.find(hql.toString());
    }

    /**
     * getTreeData 构造bootstrap-treeview格式数据
     *
     * @return
     */
    @RequestMapping(value = "/treeData", method = RequestMethod.POST)
    @ResponseBody
    public List<TreeNode> getTreeData() {

        return dictService.getTreeData();
    }

    @RequestMapping(value = "/get/{id}", method = RequestMethod.POST)
    @ResponseBody
    public Dict get(@PathVariable("id") String id) {

        Dict dict = dictService.get(Dict.class, id);
        if (!StrUtil.isEmpty(dict.getParentId())) {
            dict.setParentName(dictService.get(Dict.class, dict.getParentId()).getName());
        } else {
            dict.setParentName("系统字典");
        }
        return dict;
    }

    @RequestMapping(value="/getDictsByCode",method = RequestMethod.POST)
    @ResponseBody
    public List<Dict> getDictsByCode(String code){
        return dictService.getDictsByCode(code);
    }

    @RequestMapping(value = "/save", method = RequestMethod.POST)
    @ResponseBody
    public Result save(Dict dict) {

        dict.setUpdateDateTime(new Date());
        dictService.saveOrUpdate(dict);
        return new Result(true);
    }

    @RequestMapping(value = "/delete/{id}", method = RequestMethod.POST)
    @ResponseBody
    public Result delete(@PathVariable("id") String id) {

        try {
            Dict dict = dictService.get(Dict.class, id);
            dictService.delete(dict);
            return new Result(true);
        } catch (Exception e) {
            return new Result(false, "该字典已经被其他数据引用，不可删除");
        }
    }

}