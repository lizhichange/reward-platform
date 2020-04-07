package org.near.servicesupport.error;

import org.near.toolkit.model.ToString;

public class ErrorModel extends ToString {
    private static final long serialVersionUID = -2631199550967941533L;
    private int errcode;
    private String errmsg;

    public ErrorModel() {
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
