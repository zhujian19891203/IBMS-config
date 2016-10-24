package com.cnpc.framework.base.service;

import com.cnpc.framework.base.entity.User;

public interface UserService extends BaseService {

    public User getUserByLoginName(String loginName);

}
