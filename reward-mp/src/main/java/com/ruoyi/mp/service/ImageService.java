/*
 * Copyright 2017 the original author or authors.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package com.ruoyi.mp.service;

import com.google.common.collect.Maps;
import com.google.zxing.BarcodeFormat;
import com.google.zxing.MultiFormatWriter;
import com.google.zxing.WriterException;
import com.google.zxing.client.j2se.MatrixToImageConfig;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;
import lombok.extern.slf4j.Slf4j;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;
import org.springframework.web.client.RestTemplate;
import reactor.core.publisher.Mono;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.List;
import java.util.Map;

/**
 * @author sunflower
 */
@Slf4j
@Service
@Cacheable(cacheNames = "qr-code-cache", sync = true)
public class ImageService {

    private static final Logger LOGGER = LoggerFactory.getLogger(ImageService.class);

    public Mono<byte[]> generateQRCode(String text, int width, int height) {

        Assert.hasText(text, "text must not be empty");
        Assert.isTrue(width > 0, "width must be greater than zero");
        Assert.isTrue(height > 0, "height must be greater than zero");

        Mono<byte[]> mono = Mono.create(sink -> {
            LOGGER.info("Will generate image  text=[{}], width=[{}], height=[{}]", text, width, height);
            try {
                ByteArrayOutputStream baos = new ByteArrayOutputStream();
                BitMatrix matrix = new MultiFormatWriter().encode(text, BarcodeFormat.QR_CODE, width, height);
                MatrixToImageWriter.writeToStream(matrix, MediaType.IMAGE_PNG.getSubtype(), baos, new MatrixToImageConfig());
                sink.success(baos.toByteArray());
            } catch (IOException | WriterException ex) {
                sink.error(ex);
            }
        });
        return mono;
    }

    @Autowired
    RestTemplate restTemplate;

    /**
     * 单位元
     *
     * @param amount
     * @return
     */
    public Result queryWeChatQrCode(String amount, String qrType) {
        Map<String, String> map = Maps.newHashMap();
        map.put("page", "1");
        map.put("qr_price", amount);
        map.put("qr_type", qrType);
        ResponseEntity<Result> forEntity = restTemplate.getForEntity("http://admin.grkfcs.cn/end/addons/pay/api/qrcode?page={page}&qr_price={qr_price}&qr_type={qr_type}", Result.class, map);
        log.info("forEntity:{}", forEntity);
        if (forEntity.getStatusCode() == HttpStatus.OK) {
            return forEntity.getBody();
        }
        return null;
    }

    public static class Result {

        /**
         * code : 0
         * data : {"count":1,"rows":[{"created_at":"2020-04-23 13:49:30","updated_at":"2020-04-23 13:49:30","id":1,"qr_type":"wechat","qr_url":"wxp://f2f1QxKArubbEj1LQuxnJELIEl6jPJ0dgxv8","qr_price":"1.00","deleted_at":null}]}
         * msg :
         */

        private int code;
        private DataBean data;
        private String msg;

        public int getCode() {
            return code;
        }

        public void setCode(int code) {
            this.code = code;
        }

        public DataBean getData() {
            return data;
        }

        public void setData(DataBean data) {
            this.data = data;
        }

        public String getMsg() {
            return msg;
        }

        public void setMsg(String msg) {
            this.msg = msg;
        }

        public static class DataBean {
            /**
             * count : 1
             * rows : [{"created_at":"2020-04-23 13:49:30","updated_at":"2020-04-23 13:49:30","id":1,"qr_type":"wechat","qr_url":"wxp://f2f1QxKArubbEj1LQuxnJELIEl6jPJ0dgxv8","qr_price":"1.00","deleted_at":null}]
             */

            private int count;
            private List<RowsBean> rows;

            public int getCount() {
                return count;
            }

            public void setCount(int count) {
                this.count = count;
            }

            public List<RowsBean> getRows() {
                return rows;
            }

            public void setRows(List<RowsBean> rows) {
                this.rows = rows;
            }

            public static class RowsBean {
                /**
                 * created_at : 2020-04-23 13:49:30
                 * updated_at : 2020-04-23 13:49:30
                 * id : 1
                 * qr_type : wechat
                 * qr_url : wxp://f2f1QxKArubbEj1LQuxnJELIEl6jPJ0dgxv8
                 * qr_price : 1.00
                 * deleted_at : null
                 */

                private String created_at;
                private String updated_at;
                private int id;
                private String qr_type;
                private String qr_url;
                private String qr_price;
                private Object deleted_at;

                public String getCreated_at() {
                    return created_at;
                }

                public void setCreated_at(String created_at) {
                    this.created_at = created_at;
                }

                public String getUpdated_at() {
                    return updated_at;
                }

                public void setUpdated_at(String updated_at) {
                    this.updated_at = updated_at;
                }

                public int getId() {
                    return id;
                }

                public void setId(int id) {
                    this.id = id;
                }

                public String getQr_type() {
                    return qr_type;
                }

                public void setQr_type(String qr_type) {
                    this.qr_type = qr_type;
                }

                public String getQr_url() {
                    return qr_url;
                }

                public void setQr_url(String qr_url) {
                    this.qr_url = qr_url;
                }

                public String getQr_price() {
                    return qr_price;
                }

                public void setQr_price(String qr_price) {
                    this.qr_price = qr_price;
                }

                public Object getDeleted_at() {
                    return deleted_at;
                }

                public void setDeleted_at(Object deleted_at) {
                    this.deleted_at = deleted_at;
                }
            }
        }
    }

    @CacheEvict(cacheNames = "qr-code-cache", allEntries = true)
    public void purgeCache() {
        LOGGER.info("Purging cache");
    }

}

