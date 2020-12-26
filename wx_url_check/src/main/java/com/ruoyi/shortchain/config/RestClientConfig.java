package com.ruoyi.shortchain.config;

import lombok.extern.slf4j.Slf4j;
import org.apache.http.client.HttpClient;
import org.apache.http.client.config.RequestConfig;
import org.apache.http.config.Registry;
import org.apache.http.config.RegistryBuilder;
import org.apache.http.conn.socket.ConnectionSocketFactory;
import org.apache.http.conn.socket.PlainConnectionSocketFactory;
import org.apache.http.conn.ssl.SSLConnectionSocketFactory;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.impl.conn.PoolingHttpClientConnectionManager;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.client.HttpComponentsClientHttpRequestFactory;
import org.springframework.http.converter.HttpMessageConverter;
import org.springframework.http.converter.StringHttpMessageConverter;
import org.springframework.web.client.RestTemplate;

import javax.net.ssl.SSLContext;
import javax.net.ssl.TrustManager;
import javax.net.ssl.X509TrustManager;
import java.nio.charset.Charset;
import java.security.SecureRandom;
import java.security.cert.X509Certificate;

/**
 * <b>TODO . </b>
 *
 * @author yangyl8 / 2020-04-22
 * @version 1.0.0
 * @since JDK 1.8
 */
@Configuration
@Slf4j
public class RestClientConfig {

	@Value("${httpclient.read-timeout:30000}")
	private int readTimeout;

	@Value("${httpclient.connect-timeout:30000}")
	private int connectTimeout;

	@Value("${httpclient.default-charset:UTF-8}")
	private String defaultCharset;

	@Bean
	public RestTemplate httpClientTemplate() {

		RestTemplate restTemplate = new RestTemplate(new HttpComponentsClientHttpRequestFactory(httpClient()));
		for (HttpMessageConverter<?> messageConverter : restTemplate.getMessageConverters()) {
			if (messageConverter instanceof StringHttpMessageConverter) {
				((StringHttpMessageConverter) messageConverter).setDefaultCharset(Charset.forName(defaultCharset));
				break;
			}
		}
		return restTemplate;
	}

	@Bean
	public HttpClient httpClient() {

		Registry<ConnectionSocketFactory> registry = RegistryBuilder.<ConnectionSocketFactory> create()
				.register("http", PlainConnectionSocketFactory.getSocketFactory())
				.register("https", new SSLConnectionSocketFactory(sslContext(), (s, sslSession) -> true))
				.build();
		PoolingHttpClientConnectionManager connectionManager = new PoolingHttpClientConnectionManager(registry);
		connectionManager.setMaxTotal(200);
		connectionManager.setDefaultMaxPerRoute(100);
		RequestConfig requestConfig = RequestConfig.custom()
				//服务器返回数据的时间，超过抛出read timeout
				.setSocketTimeout(readTimeout)
				//连接上服务器的时间，超出抛出connect timeout
				.setConnectTimeout(connectTimeout)
				.build();
		return HttpClientBuilder.create()
				.setDefaultRequestConfig(requestConfig)
				.setConnectionManager(connectionManager)
				.build();
	}

	private SSLContext sslContext() {

		SSLContext sslContext = null;
		try {

			sslContext = SSLContext.getInstance("TLS");
			sslContext.init(null, new TrustManager[]{x509TrustManager()}, new SecureRandom());

		} catch (Exception e) {
			log.debug(e.getMessage());
		}
		return sslContext;
	}

	private X509TrustManager x509TrustManager() {

		return new X509TrustManager() {

			@Override
			public void checkClientTrusted(X509Certificate[] x509Certificates, String s) {

			}

			@Override
			public void checkServerTrusted(X509Certificate[] x509Certificates, String s) {

			}

			@Override
			public X509Certificate[] getAcceptedIssuers() {

				return new X509Certificate[0];
			}
		};
	}
}
