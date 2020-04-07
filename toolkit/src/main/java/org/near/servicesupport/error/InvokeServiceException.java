package org.near.servicesupport.error;

public class InvokeServiceException extends RuntimeException {
    private static final long serialVersionUID = 7850226968817431024L;
    private int errcode;
    private String errmsg;

    public InvokeServiceException(int errcode, String errmsg) {
        super(errmsg);
        this.errcode = errcode;
        this.errmsg = errmsg;
    }

    public InvokeServiceException(int errcode, String errmsg, Throwable cause) {
        super(errmsg, cause);
        this.errcode = errcode;
        this.errmsg = errmsg;
    }

    public InvokeServiceException(ServiceError error) {
        super(error.getErrmsg());
        this.errcode = error.getErrcode();
        this.errmsg = error.getErrmsg();
    }

    public InvokeServiceException(ServiceError error, Throwable cause) {
        super(error.getErrmsg(), cause);
        this.errcode = error.getErrcode();
        this.errmsg = error.getErrmsg();
    }

    public int getErrcode() {
        return this.errcode;
    }

    public String getErrmsg() {
        return this.errmsg;
    }
}
