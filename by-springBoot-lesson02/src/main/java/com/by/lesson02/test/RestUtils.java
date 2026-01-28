package com.by.lesson02.test;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import org.apache.commons.lang3.StringUtils;
import org.apache.hc.client5.http.config.RequestConfig;
import org.apache.hc.client5.http.impl.classic.CloseableHttpClient;
import org.apache.hc.client5.http.impl.classic.HttpClients;
import org.apache.hc.client5.http.impl.io.PoolingHttpClientConnectionManager;
import org.apache.hc.client5.http.impl.io.PoolingHttpClientConnectionManagerBuilder;
import org.apache.hc.client5.http.ssl.NoopHostnameVerifier;
import org.apache.hc.client5.http.ssl.SSLConnectionSocketFactory;
import org.apache.hc.client5.http.ssl.SSLConnectionSocketFactoryBuilder;
import org.apache.hc.core5.http.io.SocketConfig;
import org.apache.hc.core5.http.ssl.TLS;
import org.apache.hc.core5.pool.PoolConcurrencyPolicy;
import org.apache.hc.core5.pool.PoolReusePolicy;
import org.apache.hc.core5.ssl.SSLContexts;
import org.apache.hc.core5.util.Timeout;
import org.springframework.http.*;
import org.springframework.http.client.ClientHttpRequestFactory;
import org.springframework.http.client.HttpComponentsClientHttpRequestFactory;
import org.springframework.http.converter.StringHttpMessageConverter;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import javax.net.ssl.SSLContext;
import java.nio.charset.StandardCharsets;
import java.security.KeyManagementException;
import java.security.KeyStoreException;
import java.security.NoSuchAlgorithmException;
import java.util.Map;
import java.util.concurrent.CompletableFuture;
import java.util.concurrent.TimeUnit;

/**
 * @Description RestFull接口工具类（Spring Boot 3.x 适配版）
 * @Author pxz
 * @Date 2025/8/14
 * @Version 2.0
 */
public class RestUtils {

    /**
     * RestAPI 调用器
     */
    private final static RestTemplate RT;

    static {
        ClientHttpRequestFactory requestFactory = new HttpComponentsClientHttpRequestFactory(httpClient());
        RT = new RestTemplate(requestFactory);

        // 解决乱码问题
        RT.getMessageConverters().set(1, new StringHttpMessageConverter(StandardCharsets.UTF_8));

        // 配置自定义Content-type转换器
        RT.getMessageConverters().add(new CustomMappingJackson2HttpMessageConverter());
    }

    /**
     * Apache HttpClient 5 配置
     */
    private static CloseableHttpClient httpClient() {
        try {
            // 创建 SSLContext
            SSLContext sslContext = SSLContexts.custom()
                    .loadTrustMaterial((chain, authType) -> true)
                    .build();

            // 创建 SSLConnectionSocketFactory
            SSLConnectionSocketFactory sslSocketFactory = SSLConnectionSocketFactoryBuilder.create()
                    .setSslContext(sslContext)
                    .setHostnameVerifier(NoopHostnameVerifier.INSTANCE)
                    .setTlsVersions(TLS.V_1_2, TLS.V_1_3)
                    .build();

            // 创建连接管理器
            PoolingHttpClientConnectionManager connectionManager =
                    PoolingHttpClientConnectionManagerBuilder.create()
                            .setSSLSocketFactory(sslSocketFactory)
                            .setDefaultSocketConfig(SocketConfig.custom()
                                    .setSoTimeout(Timeout.ofMinutes(10))
                                    .build())
                            .setPoolConcurrencyPolicy(PoolConcurrencyPolicy.STRICT)
                            .setConnPoolPolicy(PoolReusePolicy.LIFO)
                            .setMaxConnTotal(200)
                            .setMaxConnPerRoute(100)
                            .build();

            // 创建请求配置
            RequestConfig requestConfig = RequestConfig.custom()
                    // 连接超时时间
                    .setConnectTimeout(Timeout.of(30, TimeUnit.SECONDS))
                    // 从连接池获取连接的超时时间
                    .setConnectionRequestTimeout(Timeout.of(1, TimeUnit.SECONDS))
                    // 响应超时时间
                    .setResponseTimeout(Timeout.of(10, TimeUnit.MINUTES))
                    .build();

            // 创建 HttpClient
            return HttpClients.custom()
                    .setConnectionManager(connectionManager)
                    .setDefaultRequestConfig(requestConfig)
                    .evictExpiredConnections()
                    .evictIdleConnections(Timeout.of(2, TimeUnit.SECONDS))
                    .build();

        } catch (NoSuchAlgorithmException | KeyManagementException | KeyStoreException e) {
            throw new RuntimeException("创建 HttpClient 失败", e);
        }
    }

    public static RestTemplate getRestTemplate() {
        return RT;
    }


    /**
     * 发送 Post 请求
     */
    public static JSONObject post(String url, JSONObject params) {
        return postNative(url, null, params).getBody();
    }

    /**
     * 发送 Post 请求（JSONArray 参数）
     */
    public static JSONObject post(String url, JSONArray jsonArray) {
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);
        headers.add("Accept", MediaType.APPLICATION_JSON_VALUE);

        HttpEntity<JSONArray> entity = new HttpEntity<>(jsonArray, headers);
        ResponseEntity<JSONObject> response = RT.postForEntity(url, entity, JSONObject.class);

        return response.getBody();
    }


    /**
     * 发送 POST 请求，返回原生 ResponseEntity 对象
     */
    public static ResponseEntity<JSONObject> postNative(String url, JSONObject variables, JSONObject params) {
        return request(url, HttpMethod.POST, variables, params);
    }

    /**

    /**
     * 发送 delete 请求，返回原生 ResponseEntity 对象
     */
    public static ResponseEntity<JSONObject> deleteNative(String url, JSONObject variables, JSONObject params) {
        return request(url, HttpMethod.DELETE, null, variables, params, JSONObject.class);
    }

    /**
     * 发送请求
     */
    public static ResponseEntity<JSONObject> request(String url, HttpMethod method, JSONObject variables, JSONObject params) {
        return request(url, method, getHeaderApplicationJson(), variables, params, JSONObject.class);
    }

    /**
     * 上传文件
     */
    public static JSONObject upload(String url, MultiValueMap<String, Object> params) {
        return request(url, HttpMethod.POST, null, params, JSONObject.class).getBody();
    }

    /**
     * 支持文件上传request
     */
    public static <T> ResponseEntity<T> request(String url, HttpMethod method, JSONObject vars, MultiValueMap<String, Object> param, Class<T> response) {
        HttpHeaders header = getHeader(MediaType.MULTIPART_FORM_DATA_VALUE);
        header.add("Accept", "*/*");
        HttpEntity<MultiValueMap<String, Object>> entity = new HttpEntity<>(param, header);
        return RT.exchange(url, method, entity, response);
    }

    /**
     * 发送请求
     */
    public static <T> ResponseEntity<T> request(String url, HttpMethod method, HttpHeaders headers, JSONObject variables, Object params, Class<T> responseType) {
        if (StringUtils.isEmpty(url)) {
            throw new RuntimeException("url 不能为空");
        }
        if (method == null) {
            throw new RuntimeException("method 不能为空");
        }
        if (headers == null) {
            headers = new HttpHeaders();
        }

        // 请求体
        String body = "";
        if (params != null) {
            if (params instanceof JSONObject) {
                body = ((JSONObject) params).toString();
            } else {
                body = params.toString();
            }
        }

        // 拼接 url 参数
        if (variables != null) {
            String queryString = asUrlVariables(variables);
            if (!StringUtils.isEmpty(queryString)) {
                if (url.contains("?")) {
                    url += ("&" + queryString);
                } else {
                    url += ("?" + queryString);
                }
            }
        }

        // 发送请求
        HttpEntity<String> request = new HttpEntity<>(body, headers);
        return RT.exchange(url, method, request, responseType);
    }

    /**
     * 获取JSON请求头
     */
    public static HttpHeaders getHeaderApplicationJson() {
        return getHeader(MediaType.APPLICATION_JSON_VALUE);
    }

    /**
     * 获取请求头
     */
    public static HttpHeaders getHeader(String mediaType) {
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.parseMediaType(mediaType));
        headers.add("Accept", mediaType);
        return headers;
    }

    /**
     * 将 JSONObject 转为 a=1&b=2&c=3...&n=n 的形式
     */
    public static String asUrlVariables(JSONObject variables) {
        try {
            StringBuilder urlVariables = new StringBuilder();
            boolean first = true;

            for (Map.Entry<String, Object> entry : variables.entrySet()) {
                if (!first) {
                    urlVariables.append("&");
                }
                String key = entry.getKey();
                Object value = entry.getValue();
                String valueStr = (value != null) ? value.toString() : "";

                // URL编码
                urlVariables.append(key)
                        .append("=")
                        .append(java.net.URLEncoder.encode(valueStr, "UTF-8"));
                first = false;
            }

            return urlVariables.toString();
        } catch (Exception e) {
            throw new RuntimeException("URL参数编码失败", e);
        }
    }

    /**
     * 支持不同响应类型的通用请求方法
     */
    public static <T> ResponseEntity<T> requestForEntity(String url, HttpMethod method,
                                                         HttpHeaders headers, Object body,
                                                         Class<T> responseType) {
        HttpEntity<Object> requestEntity = new HttpEntity<>(body, headers);
        return RT.exchange(url, method, requestEntity, responseType);
    }

    /**
     * 带重试机制的请求
     */
    public static <T> ResponseEntity<T> requestWithRetry(String url, HttpMethod method,
                                                         HttpHeaders headers, Object body,
                                                         Class<T> responseType, int maxRetries) {
        int retryCount = 0;
        while (retryCount <= maxRetries) {
            try {
                return requestForEntity(url, method, headers, body, responseType);
            } catch (Exception e) {
                retryCount++;
                if (retryCount > maxRetries) {
                    throw new RuntimeException("请求失败，已达到最大重试次数: " + maxRetries, e);
                }
                try {
                    Thread.sleep(1000 * retryCount); // 指数退避
                } catch (InterruptedException ie) {
                    Thread.currentThread().interrupt();
                    throw new RuntimeException("请求被中断", ie);
                }
            }
        }
        throw new RuntimeException("请求失败");
    }

    /**
     * 异步请求方法
     */
    public static <T> CompletableFuture<ResponseEntity<T>> requestAsync(String url, HttpMethod method,
                                                                        HttpHeaders headers, Object body,
                                                                        Class<T> responseType) {
        return CompletableFuture.supplyAsync(() ->
                requestForEntity(url, method, headers, body, responseType)
        );
    }
}