package org.near.servicesupport.result;

import java.util.List;

public class TPageResult<T> extends PageResult {
    private static final long serialVersionUID = -8398284666092886110L;
    private List<T> values;

    public TPageResult() {
    }

    public List<T> getValues() {
        return this.values;
    }

    public void setValues(List<T> values) {
        this.values = values;
    }
}
