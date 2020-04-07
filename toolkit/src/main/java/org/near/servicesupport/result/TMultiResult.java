package org.near.servicesupport.result;

import java.util.List;

public class TMultiResult<T> extends BaseResult {
    private static final long serialVersionUID = 190397444860823473L;
    private List<T> values;

    public TMultiResult() {
    }

    public List<T> getValues() {
        return this.values;
    }

    public void setValues(List<T> values) {
        this.values = values;
    }
}
