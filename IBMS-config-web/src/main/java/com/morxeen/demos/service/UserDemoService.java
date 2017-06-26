package com.morxeen.demos.service;

import com.morxeen.framework.base.entity.User;
import com.morxeen.framework.base.service.BaseService;

/**
 * Created by HANZO on 2016/6/17.
 */
public interface UserDemoService extends BaseService {

    User saveUser(User user);

}
