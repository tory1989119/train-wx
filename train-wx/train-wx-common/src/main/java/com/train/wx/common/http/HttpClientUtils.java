package com.train.wx.common.http;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.security.KeyStore;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.net.ssl.SSLContext;

import org.apache.http.HttpEntity;
import org.apache.http.HttpStatus;
import org.apache.http.NameValuePair;
import org.apache.http.client.config.RequestConfig;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.conn.ssl.SSLConnectionSocketFactory;
import org.apache.http.conn.ssl.SSLContexts;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;

public class HttpClientUtils {

    /**
     * post方法
     * 
     * @param url
     * @param params
     *            以map形式封装的params
     * @return
     */
    public static String post(String url, Map<String, String> params,String charset) {
        HttpPost httpPost = new HttpPost(url);
        try {
            if (null != params && !params.isEmpty()) {
                List<NameValuePair> paramList = new ArrayList<NameValuePair>();
                for (Map.Entry<String, String> entry : params.entrySet()) {
                    paramList.add(new BasicNameValuePair(entry.getKey(), entry.getValue()));
                }
                httpPost.setEntity(new UrlEncodedFormEntity(paramList));
            }
        } catch (Exception e) {
            return null;
        }
        return executePost(httpPost,charset);
    }

    /**
     * post请求
     * 
     * @param url
     * @param paramStr
     * @return
     */
    public static String post(String url, String paramStr,String charset){
        HttpPost httpPost = new HttpPost(url);
        try {
            httpPost.setEntity(new StringEntity(paramStr, charset));
        } catch (Exception e) {
           return null;
        }
        
        return executePost(httpPost,charset);
    }
    
    
    public static String get(String url,String charset) {
        CloseableHttpClient httpclient = HttpClients.createDefault();
        try {
            // 创建httpget.10秒超时    
            HttpGet httpget = new HttpGet(url);
            RequestConfig requestConfig = RequestConfig.custom().setSocketTimeout(10*1000).setConnectTimeout(10*1000).build();
            httpget.setConfig(requestConfig);
            // 执行get请求.    
            CloseableHttpResponse response = httpclient.execute(httpget);
            try {
                int statusCode = response.getStatusLine().getStatusCode();
                if (statusCode != HttpStatus.SC_OK) {
                    return null;
                } else {
                    // 获取响应实体    
                    HttpEntity entity = response.getEntity();
                    if (entity != null) {
                        return EntityUtils.toString(entity,charset);
                    }
                }
            } finally {
                response.close();
            }
        } catch (Exception e) {
            return null;
        } finally {
            // 关闭连接,释放资源    
            try {
                httpclient.close();
            } catch (IOException e) {
            }
        }
        return null;
    }
    
    
    private static String executePost(HttpPost httpPost,String charset){
        CloseableHttpClient client = HttpClients.createDefault();
        try {
            //请求基本参数设置 10秒超时
            RequestConfig requestConfig = RequestConfig.custom().setSocketTimeout(10*1000)
                .setConnectTimeout(10*1000).build();
            httpPost.setConfig(requestConfig);
            
            //执行post
            CloseableHttpResponse httpResponse = client.execute(httpPost);
            try {
                int statusCode = httpResponse.getStatusLine().getStatusCode();
                if (statusCode != HttpStatus.SC_OK) {
                    return null;
                } else {
                    // 获取响应实体    
                    HttpEntity entity = httpResponse.getEntity();
                    return EntityUtils.toString(entity,charset);
                }
            } catch (Exception e) {
            } finally {
                httpResponse.close();
            }

        } catch (Exception e) {
            return null;
        } finally {
            try {
                //关闭连接，释放资源
                client.close();
            } catch (IOException e) {
            }
        }
        return null;
    }
    
    /**
     * 微信红包调用
     * @param url
     * @param paramStr
     * @param charset
     * @param certfile
     * @param pwd_cert
     * @return
     */
	public static String post(String url, String paramStr, String charset, String certfile, String pwd_cert){
		CloseableHttpClient httpclient = null;
		try {
			KeyStore keyStore = KeyStore.getInstance("PKCS12");
			FileInputStream instream = new FileInputStream(new File(certfile));
			try {
				keyStore.load(instream, pwd_cert.toCharArray());
			} finally {
				instream.close();
			}
			// Trust own CA and all self-signed certs
			SSLContext sslcontext = SSLContexts.custom().loadKeyMaterial(keyStore, pwd_cert.toCharArray()).build();
			// Allow TLSv1 protocol only
			SSLConnectionSocketFactory sslsf = new SSLConnectionSocketFactory(sslcontext, new String[] { "TLSv1" }, null, SSLConnectionSocketFactory.BROWSER_COMPATIBLE_HOSTNAME_VERIFIER);
			httpclient = HttpClients.custom().setSSLSocketFactory(sslsf).build();
			HttpPost httpPost = new HttpPost(url);
			httpPost.setConfig(RequestConfig.custom().setSocketTimeout(105000).setConnectTimeout(105000).setConnectionRequestTimeout(105000).setExpectContinueEnabled(false).build());
			StringEntity se = new StringEntity(paramStr, charset);
			httpPost.setEntity(se);
			StringResponseHandler responseHandler = new StringResponseHandler();
			responseHandler.setDefaultCharset(charset);
			String res_data = httpclient.execute(httpPost, responseHandler);
			return res_data;
		} catch (Exception e) {
			return null;
		} finally {
			try {
				httpclient.close();
			} catch (IOException e) {
				
			}
		}
	}
}

