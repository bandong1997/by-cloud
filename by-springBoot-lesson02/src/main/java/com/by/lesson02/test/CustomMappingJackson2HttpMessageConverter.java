package com.by.lesson02.test;

import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.http.MediaType;
import org.springframework.http.converter.json.MappingJackson2HttpMessageConverter;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/**
 * @Description TODO
 * @Author pxz
 * @Date 2021/7/8 16:44
 * @Version 1.0
 */
public class CustomMappingJackson2HttpMessageConverter extends MappingJackson2HttpMessageConverter {

    public CustomMappingJackson2HttpMessageConverter() {
        super(new ObjectMapper());

        // 添加支持的媒体类型
        List<MediaType> supportedMediaTypes = new ArrayList<>();
        supportedMediaTypes.add(MediaType.APPLICATION_JSON);
        supportedMediaTypes.add(MediaType.parseMediaType("application/json;charset=UTF-8"));
        supportedMediaTypes.add(MediaType.parseMediaType("text/json;charset=UTF-8"));
        supportedMediaTypes.add(MediaType.parseMediaType("application/*+json;charset=UTF-8"));

        setSupportedMediaTypes(supportedMediaTypes);
    }
}
