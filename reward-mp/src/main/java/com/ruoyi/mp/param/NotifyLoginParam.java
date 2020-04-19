package com.ruoyi.mp.param;

import lombok.Data;
import org.near.toolkit.model.ToString;

@Data
public class NotifyLoginParam extends ToString {
    private String _type;
    private String _appid;
    private String _token;
    private String device_id;
}
