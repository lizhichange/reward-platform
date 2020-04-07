package org.near.servicesupport.result;


import org.near.servicesupport.error.CommonServiceErrorEnum;
import org.near.servicesupport.error.ServiceError;

import java.util.List;

public class ResultBuilder {
    public ResultBuilder() {
    }

    public static BaseResult succ() {
        BaseResult rs = new BaseResult();
        rs.setErrcode(0);
        rs.setErrmsg("ok");
        return rs;
    }

    public static <T extends BaseResult> T succ(Class<T> clz) {
        try {
            BaseResult rs = (BaseResult) clz.newInstance();
            rs.setErrcode(0);
            rs.setErrmsg("ok");
            return (T) rs;
        } catch (IllegalAccessException | InstantiationException var2) {
            throw new RuntimeException(var2);
        }
    }

    public static <T extends PageResult> T succPageResult(Class<T> clz, int page, int rows, int totalCount) {
        try {
            PageResult rs = (PageResult) clz.newInstance();
            rs.setPage(page);
            rs.setRows(rows);
            int totalPage = totalCount % rows == 0 ? totalCount / rows : totalCount / rows + 1;
            rs.setTotalPage(totalPage > 0 ? totalPage : 1);
            rs.setTotalRows(totalCount);
            rs.setErrcode(0);
            rs.setErrmsg("ok");
            return (T) rs;
        } catch (IllegalAccessException | InstantiationException var6) {
            throw new RuntimeException(var6);
        }
    }

    public static <T> TSingleResult<T> succTSingle(T value) {
        TSingleResult<T> result = new TSingleResult();
        result.setValue(value);
        result.setErrcode(0);
        result.setErrmsg("ok");
        return result;
    }

    public static <T> TMultiResult<T> succTMulti(List<T> values) {
        TMultiResult<T> result = new TMultiResult();
        result.setValues(values);
        result.setErrcode(0);
        result.setErrmsg("ok");
        return result;
    }

    public static <T> TPageResult<T> succTPage(List<T> values, int page, int rows, int totalCount) {
        TPageResult<T> result = new TPageResult();
        result.setValues(values);
        result.setPage(page);
        result.setRows(rows);
        int totalPage = totalCount % rows == 0 ? totalCount / rows : totalCount / rows + 1;
        result.setTotalPage(totalPage > 0 ? totalPage : 1);
        result.setTotalRows(totalCount);
        result.setErrcode(0);
        result.setErrmsg("ok");
        return result;
    }

    public static BaseResult fail(int errcode, String errmsg) {
        BaseResult rs = new BaseResult();
        rs.setErrcode(errcode);
        rs.setErrmsg(errmsg);
        return rs;
    }

    public static BaseResult fail(ServiceError err) {
        if (err == null) {
            err = CommonServiceErrorEnum.SYSTEM_ERROR;
        }

        return fail(((ServiceError) err).getErrcode(), ((ServiceError) err).getErrmsg());
    }

    public static <T extends BaseResult> T fail(Class<T> clz, ServiceError error) {
        if (error == null) {
            error = CommonServiceErrorEnum.SYSTEM_ERROR;
        }

        return fail(clz, ((ServiceError) error).getErrcode(), ((ServiceError) error).getErrmsg());
    }

    public static <T extends BaseResult> T fail(Class<T> clz, int errcode, String errmsg) {
        try {
            BaseResult rs = (BaseResult) clz.newInstance();
            rs.setErrcode(errcode);
            rs.setErrmsg(errmsg);
            return (T) rs;
        } catch (IllegalAccessException | InstantiationException var4) {
            throw new RuntimeException(var4);
        }
    }

    public static <T> TSingleResult<T> failTSingle(ServiceError error) {
        if (error == null) {
            error = CommonServiceErrorEnum.SYSTEM_ERROR;
        }

        return failTSingle(((ServiceError) error).getErrcode(), ((ServiceError) error).getErrmsg());
    }

    public static <T> TSingleResult<T> failTSingle(int errcode, String errmsg) {
        TSingleResult<T> result = new TSingleResult();
        result.setErrcode(errcode);
        result.setErrmsg(errmsg);
        return result;
    }

    public static <T> TMultiResult<T> failTMulti(ServiceError error) {
        if (error == null) {
            error = CommonServiceErrorEnum.SYSTEM_ERROR;
        }

        return failTMulti(((ServiceError) error).getErrcode(), ((ServiceError) error).getErrmsg());
    }

    public static <T> TMultiResult<T> failTMulti(int errcode, String errmsg) {
        TMultiResult<T> result = new TMultiResult();
        result.setErrcode(errcode);
        result.setErrmsg(errmsg);
        return result;
    }

    public static <T> TPageResult<T> failTPage(ServiceError error) {
        if (error == null) {
            error = CommonServiceErrorEnum.SYSTEM_ERROR;
        }

        return failTPage(((ServiceError) error).getErrcode(), ((ServiceError) error).getErrmsg());
    }

    public static <T> TPageResult<T> failTPage(int errcode, String errmsg) {
        TPageResult<T> result = new TPageResult();
        result.setErrcode(errcode);
        result.setErrmsg(errmsg);
        return result;
    }
}
