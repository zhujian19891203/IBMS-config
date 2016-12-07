package com.billJiang.framework.base.service;

import java.util.List;

import com.billJiang.framework.base.entity.Function;
import com.billJiang.framework.base.pojo.TreeNode;

public interface FunctionService extends BaseService {

    List<TreeNode> getTreeData();

    List<Function> getAll();

}
