package org.near.servicesupport.result;

/**
 * @author sunflower
 */
public class PageResult extends BaseResult {
    private static final long serialVersionUID = 2636297680115392969L;
    protected int page;
    protected int totalPage;
    protected int rows;
    protected int totalRows;

    public PageResult() {
    }

    public int getPage() {
        return this.page;
    }

    public void setPage(int page) {
        this.page = page;
    }

    public int getTotalPage() {
        return this.totalPage;
    }

    public void setTotalPage(int totalPage) {
        this.totalPage = totalPage;
    }

    public int getRows() {
        return this.rows;
    }

    public void setRows(int rows) {
        this.rows = rows;
    }

    public int getTotalRows() {
        return this.totalRows;
    }

    public void setTotalRows(int totalRows) {
        this.totalRows = totalRows;
    }
}
