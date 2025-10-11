package com.by.devtool.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.annotation.Resource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.Map;

/**
 * @author bandd
 * @date2025年09月29日16:43
 */
@RestController
@RequestMapping("/test")
@Tag(name = "测试模块", description = "测试模块")
public class TestController {

    @Resource
    private ObjectMapper objectMapper;


    @GetMapping("/hello")
    @Operation(summary = "hello", description = "hello")
    public String hello() {
        try {
            Map<String, Object> map = new HashMap<>();
            map.put("name", "by");
            map.put("age", 18);
            String str =  objectMapper.writeValueAsString(map);
            System.out.println(str);
            System.out.println("-----------------------");
            Map<String, Object> map2 = objectMapper.readValue(str, Map.class);
            System.out.println(map2);
        } catch (Exception e) {
            e.printStackTrace();
        }
        // dev1
        return "Hello, Spring Boot!";
    }

    @GetMapping("/")
    public String home() {
        return "Welcome to Spring Boot Application!";
    }

}
