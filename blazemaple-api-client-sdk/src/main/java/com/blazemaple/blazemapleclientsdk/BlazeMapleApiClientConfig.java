package com.blazemaple.blazemapleclientsdk;

import com.blazemaple.blazemapleclientsdk.client.BlazeMapleApiClient;
import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;

/**
 * Nero API 客户端配置类
 * @author BlazeMaple
 */
@Data
@Configuration
@ConfigurationProperties("blazemaple.client")
@ComponentScan
public class BlazeMapleApiClientConfig {

    private String accessKey;

    private String secretKey;

    /**
     * 此处方法取名无所谓的，不影响任何地方
     *
     * @return
     */
    @Bean
    public BlazeMapleApiClient getApiClient() {
        return new BlazeMapleApiClient(accessKey, secretKey);
    }
}
