package org.near.servicesupport.request;


/**
 * @author sunflower
 */
public class TPageRequest<T> extends PageRequest {
    private static final long serialVersionUID = -8011206062731891048L;
    private T condition;

    public TPageRequest() {
    }

    public T getCondition() {
        return this.condition;
    }

    public void setCondition(T condition) {
        this.condition = condition;
    }
}
