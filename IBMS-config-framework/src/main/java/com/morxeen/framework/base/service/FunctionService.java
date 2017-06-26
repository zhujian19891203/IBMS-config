package com.morxeen.framework.base.service;

import java.util.List;
import java.util.Set;

import com.morxeen.framework.base.entity.Function;
import com.morxeen.framework.base.pojo.TreeNode;

public interface FunctionService extends BaseService {

    List<TreeNode> getTreeData();

    List<Function> getAll();

    Set<String> getFunctionCodeSet(Set<String> roleCodes);
}
