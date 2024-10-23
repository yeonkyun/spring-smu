package edu.sunmoon.config;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Slf4j
@Configuration
public class WebMvcConfig implements WebMvcConfigurer {
    @Value("${app.dir.images}")
    private String imagesDir;
    @Value("${app.dir.logs}")
    private String logsDir;

    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        log.info("================" + logsDir);

        registry.addResourceHandler("/images/**").addResourceLocations(imagesDir);
        registry.addResourceHandler("/logs/**").addResourceLocations(logsDir);
    }

}
