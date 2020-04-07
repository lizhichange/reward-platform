package org.near.servicesupport.result;

import org.near.toolkit.model.ToString;

/**
 * @author sunflower
 */
public class BaseResult extends ToString {
    private static final long serialVersionUID = -8086646618727821661L;
    public static final int SUCCESS = 0;
    public static final String SUCC_MSG = "ok";
    private int errcode = -1;
    private String errmsg = "";

    public BaseResult() {
    }

    public int getErrcode() {
        return this.errcode;
    }

    public void setErrcode(int errcode) {
        this.errcode = errcode;
    }

    public String getErrmsg() {
        return this.errmsg;
    }

    public void setErrmsg(String errmsg) {
        this.errmsg = errmsg;
    }
}
