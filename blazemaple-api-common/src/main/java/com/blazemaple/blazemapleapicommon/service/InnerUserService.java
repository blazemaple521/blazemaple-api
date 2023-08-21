package com.blazemaple.blazemapleapicommon.service;

import com.blazemaple.blazemapleapicommon.model.entity.User;


/**
 * 用户服务
 *
 * @author BlazeMaple
 */
public interface InnerUserService {

    /**
     * 数据库中查是否已分配给用户秘钥（accessKey）
     * @param accessKey accessKey
     * @return User 用户信息
     */
    User getInvokeUser(String accessKey);
}
