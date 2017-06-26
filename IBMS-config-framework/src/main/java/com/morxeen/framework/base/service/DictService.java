package com.morxeen.framework.base.service;

import java.util.List;

import com.morxeen.framework.base.entity.Dict;
import com.morxeen.framework.base.pojo.TreeNode;

public interface DictService extends BaseService {

    List<TreeNode> getTreeData();

    List<Dict> getDictsByCode(String code);
}
