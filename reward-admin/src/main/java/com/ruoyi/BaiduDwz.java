package com.ruoyi;

import com.google.gson.Gson;
import com.google.gson.annotations.SerializedName;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;

/**
 * @author sunflower
 */
public class BaiduDwz {
    final static String CREATE_API = "https://dwz.cn/admin/v2/create";
    final static String TOKEN = "c9d8cf063aef5ef75f425ba05e06891d";

    static class UrlResponse {
        @SerializedName("Code")
        private int code;

        @SerializedName("ErrMsg")
        private String errMsg;

        @SerializedName("LongUrl")
        private String longUrl;

        @SerializedName("ShortUrl")
        private String shortUrl;

        public int getCode() {
            return code;
        }

        public void setCode(int code) {
            this.code = code;
        }

        public String getErrMsg() {
            return errMsg;
        }

        public void setErrMsg(String errMsg) {
            this.errMsg = errMsg;
        }

        public String getLongUrl() {
            return longUrl;
        }

        public void setLongUrl(String longUrl) {
            this.longUrl = longUrl;
        }

        public String getShortUrl() {
            return shortUrl;
        }

        public void setShortUrl(String shortUrl) {
            this.shortUrl = shortUrl;
        }
    }

    /**
     * 创建短网址
     *
     * @param longUrl 长网址：即原网址
     *                termOfValidity
     *                有效期：默认值为long-term
     * @return 成功：短网址
     * 失败：返回空字符串
     */
    public static String createShortUrl(String longUrl, String termOfValidity) {
        String params = "{\"Url\":\"" + longUrl + "\",\"TermOfValidity\":\"" + termOfValidity + "\"}";

        BufferedReader reader;
        try {
            // 创建连接
            URL url = new URL(CREATE_API);
            HttpURLConnection connection = (HttpURLConnection) url.openConnection();
            connection.setDoOutput(true);
            connection.setDoInput(true);
            connection.setUseCaches(false);
            connection.setInstanceFollowRedirects(true);
            // 设置请求方式
            connection.setRequestMethod("POST");
            // 设置发送数据的格式
            connection.setRequestProperty("Content-Type", "application/json");
            // 设置发送数据的格式");
            connection.setRequestProperty("Token", TOKEN);

            // 发起请求
            connection.connect();
            // utf-8编码
            OutputStreamWriter out = new OutputStreamWriter(connection.getOutputStream(), "UTF-8");
            out.append(params);
            out.flush();
            out.close();

            // 读取响应
            reader = new BufferedReader(new InputStreamReader(connection.getInputStream(), "UTF-8"));
            String line;
            String res = "";
            while ((line = reader.readLine()) != null) {
                res += line;
            }
            reader.close();

            // 抽取生成短网址
            UrlResponse urlResponse = new Gson().fromJson(res, UrlResponse.class);
            if (urlResponse.getCode() == 0) {
                return urlResponse.getShortUrl();
            } else {
                System.out.println(urlResponse.getErrMsg());
            }
// TODO：自定义错误信息
            return "";
        } catch (IOException e) {
            // TODO
            e.printStackTrace();
        }
        // TODO：自定义错误信息
        return "";
    }

    public static void main(String[] args) {
        String res = createShortUrl("http://ds.wx40q.com/login", "long-term");
        System.out.println(res);
    }

}
