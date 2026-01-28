package com.by.lesson02.test;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.by.lesson02.result.Result;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.io.UnsupportedEncodingException;

/**
 * @author bandd
 * @date2026年01月28日18:32
 */
@Tag(name = "测试")
@RestController
@RequestMapping(value = "/test1")
public class TestContract {

    @Operation(summary = "测试")
    @GetMapping(value = "/hello")
    public Result hello() throws UnsupportedEncodingException {
        JSONArray jsonArray = generateGPTkq();
        JSONObject jsonObject = RestUtils.post("http://59.215.191.173:8085/generateGP/api/geojson/tools/jzdList2Geojson", jsonArray);

        JSONObject jsonObject1 = RestUtils.post("http://59.215.191.173:8085/generateGP/api/geojson/process/rzkj_kc/sde/TKQ_CRHS/deleteAinsert", jsonObject);

        return Result.success(jsonObject1);
    }

    public static JSONArray generateGPTkq() {
        JSONArray jsonArray = new JSONArray();
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("jzdid", "879e687e987e897");
        jsonObject.put("qh", 1);
        jsonObject.put("xh",1);
        jsonObject.put("yzb", 27.79151281);
        jsonObject.put("xzb", 106.7446943);
        jsonObject.put("reg_id", "987e897e8978e97897");
        jsonObject.put("crxmbh", "ggg2222");
        jsonObject.put("crbz", "测试");
        jsonArray.add(jsonObject);
        JSONObject jsonObject1 = new JSONObject();
        jsonObject1.put("jzdid", "879e687e987e897");
        jsonObject1.put("qh", 1);
        jsonObject1.put("xh",2);
        jsonObject1.put("yzb", 27.80728798);
        jsonObject1.put("xzb", 106.7532677);
        jsonObject1.put("reg_id", "987e897e8978e97897");
        jsonObject1.put("crxmbh", "ggg2222");
        jsonObject1.put("crbz", "测试");
        jsonArray.add(jsonObject1);
        JSONObject jsonObject2 = new JSONObject();
        jsonObject2.put("jzdid", "879e687e987e897");
        jsonObject2.put("qh", 1);
        jsonObject2.put("xh",3);
        jsonObject2.put("yzb", 27.79254163);
        jsonObject2.put("xzb", 106.7704147);
        jsonObject2.put("reg_id", "987e897e8978e97897");
        jsonObject2.put("crxmbh", "ggg2222");
        jsonObject2.put("crbz", "测试");
        jsonArray.add(jsonObject2);
        JSONObject jsonObject3 = new JSONObject();
        jsonObject3.put("jzdid", "879e687e987e897");
        jsonObject3.put("qh", 1);
        jsonObject3.put("xh",4);
        jsonObject3.put("yzb", 27.77625205);
        jsonObject3.put("xzb", 106.7596121);
        jsonObject3.put("reg_id", "987e897e8978e97897");
        jsonObject3.put("crxmbh", "ggg2222");
        jsonObject3.put("crbz", "测试");
        jsonArray.add(jsonObject3);
        JSONObject jsonObject4 = new JSONObject();
        jsonObject4.put("jzdid", "879e687e987e897");
        jsonObject4.put("qh", 1);
        jsonObject4.put("xh",5);
        jsonObject4.put("yzb", 27.77899556);
        jsonObject4.put("xzb", 106.7419508);
        jsonObject4.put("reg_id", "987e897e8978e97897");
        jsonObject4.put("crxmbh", "ggg2222");
        jsonObject4.put("crbz", "测试");
        jsonArray.add(jsonObject4);
        JSONObject jsonObject5 = new JSONObject();
        jsonObject5.put("jzdid", "879e687e987e897");
        jsonObject5.put("qh", 1);
        jsonObject5.put("xh",6);
        jsonObject5.put("yzb", 27.79151281);
        jsonObject5.put("xzb", 106.7446943);
        jsonObject5.put("reg_id", "987e897e8978e97897");
        jsonObject5.put("crxmbh", "ggg2222");
        jsonObject5.put("crbz", "测试");
        jsonArray.add(jsonObject5);
        return jsonArray;
    }
}
