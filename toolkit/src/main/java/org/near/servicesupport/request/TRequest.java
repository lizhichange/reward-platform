package org.near.servicesupport.request;

/**
 * @author sunflower
 */
public class TRequest<T> extends BaseRequest {
    private static final long serialVersionUID = 8256420723435390590L;
    private T condition;

    public TRequest() {
    }

    public T getCondition() {
        return this.condition;
    }

    public void setCondition(T condition) {
        this.condition = condition;
    }
}
