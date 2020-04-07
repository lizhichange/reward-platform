package org.near.servicesupport.request;

/**
 * @author sunflower
 */
public class BaseRequest extends AbstractServiceRequest {
    private static final long serialVersionUID = -6289936912859265354L;
    protected String clientName;
    protected String clientIp;
    protected long timestamp = System.currentTimeMillis();

    public BaseRequest() {
    }

    public String getClientName() {
        return this.clientName;
    }

    public void setClientName(String clientName) {
        this.clientName = clientName;
    }

    public String getClientIp() {
        return this.clientIp;
    }

    public void setClientIp(String clientIp) {
        this.clientIp = clientIp;
    }

    public long getTimestamp() {
        return this.timestamp;
    }

    public void setTimestamp(long timestamp) {
        this.timestamp = timestamp;
    }
}
