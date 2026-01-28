//package com.by.lesson02.test;
//
///**
// * @author bandd
// * @date2026年01月28日19:45
// */
//import org.apache.hc.client5.http.classic.HttpClient;
//import org.apache.hc.client5.http.config.RequestConfig;
//import org.apache.hc.client5.http.impl.classic.HttpClients;
//import org.apache.hc.client5.http.impl.io.PoolingHttpClientConnectionManager;
//import org.apache.hc.client5.http.impl.io.PoolingHttpClientConnectionManagerBuilder;
//import org.apache.hc.client5.http.ssl.NoopHostnameVerifier;
//import org.apache.hc.client5.http.ssl.SSLConnectionSocketFactory;
//import org.apache.hc.client5.http.ssl.SSLConnectionSocketFactoryBuilder;
//import org.apache.hc.core5.http.io.SocketConfig;
//import org.apache.hc.core5.http.ssl.TLS;
//import org.apache.hc.core5.pool.PoolConcurrencyPolicy;
//import org.apache.hc.core5.pool.PoolReusePolicy;
//import org.apache.hc.core5.ssl.SSLContexts;
//import org.apache.hc.core5.util.Timeout;
//import org.springframework.context.annotation.Bean;
//import org.springframework.context.annotation.Configuration;
//import org.springframework.http.client.ClientHttpRequestFactory;
//import org.springframework.http.client.HttpComponentsClientHttpRequestFactory;
//import org.springframework.web.client.RestTemplate;
//
//import javax.net.ssl.SSLContext;
//import java.util.concurrent.TimeUnit;
//
//@Configuration
//public class RestTemplateConfig {
//
//    @Bean
//    public RestTemplate restTemplate() {
//        ClientHttpRequestFactory requestFactory = new HttpComponentsClientHttpRequestFactory(httpClient());
//        RestTemplate restTemplate = new RestTemplate(requestFactory);
//
//        // 配置消息转换器
//        restTemplate.getMessageConverters().add(0, new CustomMappingJackson2HttpMessageConverter());
//
//        return restTemplate;
//    }
//
//    @Bean
//    public HttpClient httpClient() {
//        try {
//            SSLContext sslContext = SSLContexts.custom()
//                    .loadTrustMaterial((chain, authType) -> true)
//                    .build();
//
//            SSLConnectionSocketFactory sslSocketFactory = SSLConnectionSocketFactoryBuilder.create()
//                    .setSslContext(sslContext)
//                    .setHostnameVerifier(NoopHostnameVerifier.INSTANCE)
//                    .setTlsVersions(TLS.V_1_2, TLS.V_1_3)
//                    .build();
//
//            PoolingHttpClientConnectionManager connectionManager =
//                    PoolingHttpClientConnectionManagerBuilder.create()
//                            .setSSLSocketFactory(sslSocketFactory)
//                            .setDefaultSocketConfig(SocketConfig.custom()
//                                    .setSoTimeout(Timeout.ofMinutes(10))
//                                    .build())
//                            .setPoolConcurrencyPolicy(PoolConcurrencyPolicy.STRICT)
//                            .setConnPoolPolicy(PoolReusePolicy.LIFO)
//                            .setMaxConnTotal(200)
//                            .setMaxConnPerRoute(100)
//                            .build();
//
//            RequestConfig requestConfig = RequestConfig.custom()
//                    .setConnectTimeout(Timeout.of(30, TimeUnit.SECONDS))
//                    .setConnectionRequestTimeout(Timeout.of(1, TimeUnit.SECONDS))
//                    .setResponseTimeout(Timeout.of(10, TimeUnit.MINUTES))
//                    .build();
//
//            return HttpClients.custom()
//                    .setConnectionManager(connectionManager)
//                    .setDefaultRequestConfig(requestConfig)
//                    .evictExpiredConnections()
//                    .evictIdleConnections(Timeout.of(2, TimeUnit.SECONDS))
//                    .build();
//
//        } catch (Exception e) {
//            throw new RuntimeException("创建 HttpClient 失败", e);
//        }
//    }
//}