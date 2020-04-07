package org.near.servicesupport.request;

/**
 * @author sunflower
 */
public class PageRequest extends BaseRequest {
    private static final long serialVersionUID = 8811775689400542534L;
    protected int page = 1;
    protected int rows = 20;

    public PageRequest() {
    }

    public int start4Mysql() {
        return this.page > 1 ? (this.page - 1) * this.rows : 0;
    }

    public int getPage() {
        return this.page;
    }

    public void setPage(int page) {
        this.page = page;
    }

    public int getRows() {
        return this.rows;
    }

    public void setRows(int rows) {
        this.rows = rows;
    }
}
