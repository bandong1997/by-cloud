package com.by.upms.feign;


import com.by.common.result.Result;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Map;

/**
 * @author: 班东东
 * @Time: 2025/8/24 22:15
 * @description:
 */
@FeignClient(value = "bdd-cloud-service-file")
public interface FileClent {

    @GetMapping("/fileMinio/findFileBase64")
    Result findFileBase64(@RequestParam("filePath") String filePath) ;


    @GetMapping("/fileMinio/testFeign")
    Map<String, String> testFeign() ;


}
