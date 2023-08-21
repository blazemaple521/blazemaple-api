package com.blazemaple.blazemapleapiadmin;

import org.apache.dubbo.config.spring.context.annotation.EnableDubbo;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.scheduling.annotation.EnableScheduling;

@SpringBootApplication
@MapperScan("com.blazemaple.blazemapleapiadmin.mapper")
@EnableScheduling
@EnableAspectJAutoProxy(proxyTargetClass = true, exposeProxy = true)
@EnableDubbo
public class BlazeMapleApiAdminApplication {

    public static void main(String[] args) {
        SpringApplication.run(BlazeMapleApiAdminApplication.class, args);
    }

}
