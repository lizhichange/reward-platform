package com.ruoyi.common.utils;

import com.github.rholder.retry.*;
import com.google.common.base.Predicates;
import com.ruoyi.common.config.Global;
import com.ruoyi.common.json.JSON;
import com.ruoyi.common.json.JSONObject;
import com.ruoyi.common.utils.http.HttpUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.IOException;
import java.rmi.RemoteException;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.TimeUnit;

/**
 * 获取地址类
 *
 * @author ruoyi
 */
public class AddressUtils {
    private static final Logger log = LoggerFactory.getLogger(AddressUtils.class);


    private static final Retryer<String> ret = RetryerBuilder.<String>newBuilder()
            .retryIfResult(Predicates.isNull())
            .retryIfExceptionOfType(IOException.class)
            .retryIfRuntimeException()
            .withWaitStrategy(WaitStrategies.fixedWait(3, TimeUnit.SECONDS))
            .withStopStrategy(StopStrategies.stopAfterAttempt(3))
            .build();


    public static final String IP_URL = "http://ip.taobao.com/service/getIpInfo.php";

    public static String getRealAddressByIP(String ip) {
        String address = "XX XX";
        // 内网不查询
        if (IpUtils.internalIp(ip)) {
            return "内网IP";
        }
        if (Global.isAddressEnabled()) {
            String call = null;
            try {
                call = ret.call(() -> {
                    String rspStr = HttpUtils.sendPost(IP_URL, "ip=" + ip);
                    if (StringUtils.isEmpty(rspStr)) {
                        throw new RemoteException("获取地理位置异常");
                    }
                    return rspStr;
                });
            } catch (ExecutionException | RetryException e) {
                e.printStackTrace();
            }
            String rspStr = call;
            if (StringUtils.isEmpty(rspStr)) {
                log.error("获取地理位置异常 {}", ip);
                return address;
            }
            JSONObject obj;
            try {
                obj = JSON.unmarshal(rspStr, JSONObject.class);
                JSONObject data = obj.getObj("data");
                String region = data.getStr("region");
                String city = data.getStr("city");
                address = region + " " + city;
            } catch (Exception e) {
                log.error("获取地理位置异常 {}", ip);
            }
        }
        return address;
    }
}
