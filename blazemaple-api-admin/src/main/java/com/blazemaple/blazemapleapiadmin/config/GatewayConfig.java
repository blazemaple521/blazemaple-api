package com.blazemaple.blazemapleapiadmin.config;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Configuration;

@Configuration
@ConfigurationProperties(prefix = "blazemaple.gateway")
@Data
public class GatewayConfig {

    private String host;

}
