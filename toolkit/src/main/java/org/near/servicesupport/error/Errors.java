package org.near.servicesupport.error;

public class Errors {
    public Errors() {
    }

    public static enum Commons implements ServiceError {
        SYSTEM_ERROR(100, "系统异常"),
        REQUEST_PARAMETER_ERROR(101, "请求参数错误");

        int errcode;
        String errmsg;

        private Commons(int errcode, String errmsg) {
            this.errcode = errcode;
            this.errmsg = errmsg;
        }

        @Override
        public int getErrcode() {
            return this.errcode;
        }

        @Override
        public String getErrmsg() {
            return this.errmsg;
        }
    }
}
