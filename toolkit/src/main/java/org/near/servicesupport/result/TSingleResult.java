package org.near.servicesupport.result;

/**
 * @author sunflower
 */
public class TSingleResult<T> extends BaseResult {
    private static final long serialVersionUID = 4648290766510705991L;
    private T value;

    public TSingleResult() {
    }

    public T getValue() {
        return this.value;
    }

    public void setValue(T value) {
        this.value = value;
    }
}
