package com.blazemaple.blazemapleapiadmin.controller;

import com.blazemaple.blazemapleapiadmin.annotation.AuthCheck;
import com.blazemaple.blazemapleapiadmin.exception.BusinessException;
import com.blazemaple.blazemapleapiadmin.service.InterfaceInfoService;
import com.blazemaple.blazemapleapiadmin.service.UserInterfaceInfoService;
import com.blazemaple.blazemapleapicommon.common.BaseResponse;
import com.blazemaple.blazemapleapicommon.common.ErrorCode;
import com.blazemaple.blazemapleapicommon.common.ResultUtils;
import com.blazemaple.blazemapleapicommon.constant.UserConstant;
import com.blazemaple.blazemapleapicommon.model.entity.InterfaceInfo;
import com.blazemaple.blazemapleapicommon.model.entity.UserInterfaceInfo;
import com.blazemaple.blazemapleapicommon.model.vo.InterfaceInfoVO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * 统计分析接口
 */
@RestController
@RequestMapping("/analysis")
@Slf4j
public class AnalysisController {

    @Resource
    private UserInterfaceInfoService userInterfaceInfoService;

    @Resource
    private InterfaceInfoService interfaceInfoService;

    @GetMapping("/top/interface/invoke")
    @AuthCheck(mustRole = UserConstant.ADMIN_ROLE)
    public BaseResponse<List<InterfaceInfoVO>> listTopInvokeInterfaceInfo() {
        // 查询调用次数前3名的接口
        List<UserInterfaceInfo> userInterfaceInfoList = userInterfaceInfoService.listTopInvokeInterfaceInfo(3);
        if (userInterfaceInfoList.isEmpty()) {
            throw new BusinessException(ErrorCode.SYSTEM_ERROR, "接口信息不存在");
        }
        // 根据接口id分组
        Map<Long, List<UserInterfaceInfo>> interfaceInfoIdObjMap = userInterfaceInfoList.stream()
                .collect(Collectors.groupingBy(UserInterfaceInfo::getInterfaceInfoId));
        // 查询所有接口id的接口信息
        List<InterfaceInfo> list = interfaceInfoService.lambdaQuery()
                .in(InterfaceInfo::getId, interfaceInfoIdObjMap.keySet())
                .list();
        if (list.isEmpty()) {
            throw new BusinessException(ErrorCode.PARAMS_ERROR, "接口信息不存在");
        }
        // 组装返回结果
        List<InterfaceInfoVO> result = list.stream().map(interfaceInfo -> {
            InterfaceInfoVO interfaceInfoVO = InterfaceInfoVO.objToVo(interfaceInfo);
            interfaceInfoVO.setTotalNum(interfaceInfoIdObjMap.get(interfaceInfo.getId()).get(0).getTotalNum());
            return interfaceInfoVO;
        }).collect(Collectors.toList());
        return ResultUtils.success(result);
    }

}
