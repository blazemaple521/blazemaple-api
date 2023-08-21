package com.blazemaple.blazemapleapiadmin.service.impl.inner;

import com.blazemaple.blazemapleapiadmin.service.InterfaceInfoService;
import com.blazemaple.blazemapleapicommon.model.entity.InterfaceInfo;
import com.blazemaple.blazemapleapicommon.service.InnerInterfaceInfoService;
import org.apache.dubbo.config.annotation.DubboService;

import javax.annotation.Resource;

/**
* @author BlazeMaple
*/
@DubboService
public class InnerInterfaceInfoServiceImpl implements InnerInterfaceInfoService {

    @Resource
    private InterfaceInfoService interfaceInfoService;

    @Override
    public InterfaceInfo getInterfaceInfo(String path, String method) {
        return interfaceInfoService.query()
                .eq("url", path)
                .eq("method", method)
                .one();
    }
}




