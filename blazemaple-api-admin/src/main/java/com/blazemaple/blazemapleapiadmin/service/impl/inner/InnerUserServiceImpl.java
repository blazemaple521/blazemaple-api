package com.blazemaple.blazemapleapiadmin.service.impl.inner;

import com.blazemaple.blazemapleapiadmin.service.UserService;
import com.blazemaple.blazemapleapicommon.model.entity.User;
import com.blazemaple.blazemapleapicommon.service.InnerUserService;
import lombok.extern.slf4j.Slf4j;
import org.apache.dubbo.config.annotation.DubboService;

import javax.annotation.Resource;

/**
 * 用户服务实现
 *
 */
@DubboService
@Slf4j
public class InnerUserServiceImpl implements InnerUserService {

    @Resource
    private UserService userService;

    @Override
    public User getInvokeUser(String accessKey) {
        return userService.query()
                .eq("accessKey", accessKey)
                .one();
    }
}
