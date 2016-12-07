package com.billJiang.demos.service;

import com.billJiang.framework.base.entity.User;
import com.billJiang.framework.base.service.BaseService;

/**
 * Created by HANZO on 2016/6/17.
 */
public interface UserDemoService extends BaseService {

    User saveUser(User user);

}
