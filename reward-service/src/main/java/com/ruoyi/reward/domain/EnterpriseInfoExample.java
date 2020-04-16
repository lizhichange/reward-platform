package com.ruoyi.reward.domain;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class EnterpriseInfoExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    private Integer limit;

    private Integer offset;

    public EnterpriseInfoExample() {
        oredCriteria = new ArrayList<Criteria>();
    }

    public void setOrderByClause(String orderByClause) {
        this.orderByClause = orderByClause;
    }

    public String getOrderByClause() {
        return orderByClause;
    }

    public void setDistinct(boolean distinct) {
        this.distinct = distinct;
    }

    public boolean isDistinct() {
        return distinct;
    }

    public List<Criteria> getOredCriteria() {
        return oredCriteria;
    }

    public void or(Criteria criteria) {
        oredCriteria.add(criteria);
    }

    public Criteria or() {
        Criteria criteria = createCriteriaInternal();
        oredCriteria.add(criteria);
        return criteria;
    }

    public Criteria createCriteria() {
        Criteria criteria = createCriteriaInternal();
        if (oredCriteria.size() == 0) {
            oredCriteria.add(criteria);
        }
        return criteria;
    }

    protected Criteria createCriteriaInternal() {
        Criteria criteria = new Criteria();
        return criteria;
    }

    public void clear() {
        oredCriteria.clear();
        orderByClause = null;
        distinct = false;
    }

    public void setLimit(Integer limit) {
        this.limit = limit;
    }

    public Integer getLimit() {
        return limit;
    }

    public void setOffset(Integer offset) {
        this.offset = offset;
    }

    public Integer getOffset() {
        return offset;
    }

    protected abstract static class GeneratedCriteria {
        protected List<Criterion> criteria;

        protected GeneratedCriteria() {
            super();
            criteria = new ArrayList<Criterion>();
        }

        public boolean isValid() {
            return criteria.size() > 0;
        }

        public List<Criterion> getAllCriteria() {
            return criteria;
        }

        public List<Criterion> getCriteria() {
            return criteria;
        }

        protected void addCriterion(String condition) {
            if (condition == null) {
                throw new RuntimeException("Value for condition cannot be null");
            }
            criteria.add(new Criterion(condition));
        }

        protected void addCriterion(String condition, Object value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value));
        }

        protected void addCriterion(String condition, Object value1, Object value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value1, value2));
        }

        public Criteria andIdIsNull() {
            addCriterion("id is null");
            return (Criteria) this;
        }

        public Criteria andIdIsNotNull() {
            addCriterion("id is not null");
            return (Criteria) this;
        }

        public Criteria andIdEqualTo(Integer value) {
            addCriterion("id =", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotEqualTo(Integer value) {
            addCriterion("id <>", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdGreaterThan(Integer value) {
            addCriterion("id >", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("id >=", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdLessThan(Integer value) {
            addCriterion("id <", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdLessThanOrEqualTo(Integer value) {
            addCriterion("id <=", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdIn(List<Integer> values) {
            addCriterion("id in", values, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotIn(List<Integer> values) {
            addCriterion("id not in", values, "id");
            return (Criteria) this;
        }

        public Criteria andIdBetween(Integer value1, Integer value2) {
            addCriterion("id between", value1, value2, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotBetween(Integer value1, Integer value2) {
            addCriterion("id not between", value1, value2, "id");
            return (Criteria) this;
        }

        public Criteria andEnterpriseNameIsNull() {
            addCriterion("enterprise_name is null");
            return (Criteria) this;
        }

        public Criteria andEnterpriseNameIsNotNull() {
            addCriterion("enterprise_name is not null");
            return (Criteria) this;
        }

        public Criteria andEnterpriseNameEqualTo(String value) {
            addCriterion("enterprise_name =", value, "enterpriseName");
            return (Criteria) this;
        }

        public Criteria andEnterpriseNameNotEqualTo(String value) {
            addCriterion("enterprise_name <>", value, "enterpriseName");
            return (Criteria) this;
        }

        public Criteria andEnterpriseNameGreaterThan(String value) {
            addCriterion("enterprise_name >", value, "enterpriseName");
            return (Criteria) this;
        }

        public Criteria andEnterpriseNameGreaterThanOrEqualTo(String value) {
            addCriterion("enterprise_name >=", value, "enterpriseName");
            return (Criteria) this;
        }

        public Criteria andEnterpriseNameLessThan(String value) {
            addCriterion("enterprise_name <", value, "enterpriseName");
            return (Criteria) this;
        }

        public Criteria andEnterpriseNameLessThanOrEqualTo(String value) {
            addCriterion("enterprise_name <=", value, "enterpriseName");
            return (Criteria) this;
        }

        public Criteria andEnterpriseNameLike(String value) {
            addCriterion("enterprise_name like", value, "enterpriseName");
            return (Criteria) this;
        }

        public Criteria andEnterpriseNameNotLike(String value) {
            addCriterion("enterprise_name not like", value, "enterpriseName");
            return (Criteria) this;
        }

        public Criteria andEnterpriseNameIn(List<String> values) {
            addCriterion("enterprise_name in", values, "enterpriseName");
            return (Criteria) this;
        }

        public Criteria andEnterpriseNameNotIn(List<String> values) {
            addCriterion("enterprise_name not in", values, "enterpriseName");
            return (Criteria) this;
        }

        public Criteria andEnterpriseNameBetween(String value1, String value2) {
            addCriterion("enterprise_name between", value1, value2, "enterpriseName");
            return (Criteria) this;
        }

        public Criteria andEnterpriseNameNotBetween(String value1, String value2) {
            addCriterion("enterprise_name not between", value1, value2, "enterpriseName");
            return (Criteria) this;
        }

        public Criteria andAccountOpeningDateIsNull() {
            addCriterion("account_opening_date is null");
            return (Criteria) this;
        }

        public Criteria andAccountOpeningDateIsNotNull() {
            addCriterion("account_opening_date is not null");
            return (Criteria) this;
        }

        public Criteria andAccountOpeningDateEqualTo(Date value) {
            addCriterion("account_opening_date =", value, "accountOpeningDate");
            return (Criteria) this;
        }

        public Criteria andAccountOpeningDateNotEqualTo(Date value) {
            addCriterion("account_opening_date <>", value, "accountOpeningDate");
            return (Criteria) this;
        }

        public Criteria andAccountOpeningDateGreaterThan(Date value) {
            addCriterion("account_opening_date >", value, "accountOpeningDate");
            return (Criteria) this;
        }

        public Criteria andAccountOpeningDateGreaterThanOrEqualTo(Date value) {
            addCriterion("account_opening_date >=", value, "accountOpeningDate");
            return (Criteria) this;
        }

        public Criteria andAccountOpeningDateLessThan(Date value) {
            addCriterion("account_opening_date <", value, "accountOpeningDate");
            return (Criteria) this;
        }

        public Criteria andAccountOpeningDateLessThanOrEqualTo(Date value) {
            addCriterion("account_opening_date <=", value, "accountOpeningDate");
            return (Criteria) this;
        }

        public Criteria andAccountOpeningDateIn(List<Date> values) {
            addCriterion("account_opening_date in", values, "accountOpeningDate");
            return (Criteria) this;
        }

        public Criteria andAccountOpeningDateNotIn(List<Date> values) {
            addCriterion("account_opening_date not in", values, "accountOpeningDate");
            return (Criteria) this;
        }

        public Criteria andAccountOpeningDateBetween(Date value1, Date value2) {
            addCriterion("account_opening_date between", value1, value2, "accountOpeningDate");
            return (Criteria) this;
        }

        public Criteria andAccountOpeningDateNotBetween(Date value1, Date value2) {
            addCriterion("account_opening_date not between", value1, value2, "accountOpeningDate");
            return (Criteria) this;
        }

        public Criteria andSalesManagerIsNull() {
            addCriterion("sales_manager is null");
            return (Criteria) this;
        }

        public Criteria andSalesManagerIsNotNull() {
            addCriterion("sales_manager is not null");
            return (Criteria) this;
        }

        public Criteria andSalesManagerEqualTo(String value) {
            addCriterion("sales_manager =", value, "salesManager");
            return (Criteria) this;
        }

        public Criteria andSalesManagerNotEqualTo(String value) {
            addCriterion("sales_manager <>", value, "salesManager");
            return (Criteria) this;
        }

        public Criteria andSalesManagerGreaterThan(String value) {
            addCriterion("sales_manager >", value, "salesManager");
            return (Criteria) this;
        }

        public Criteria andSalesManagerGreaterThanOrEqualTo(String value) {
            addCriterion("sales_manager >=", value, "salesManager");
            return (Criteria) this;
        }

        public Criteria andSalesManagerLessThan(String value) {
            addCriterion("sales_manager <", value, "salesManager");
            return (Criteria) this;
        }

        public Criteria andSalesManagerLessThanOrEqualTo(String value) {
            addCriterion("sales_manager <=", value, "salesManager");
            return (Criteria) this;
        }

        public Criteria andSalesManagerLike(String value) {
            addCriterion("sales_manager like", value, "salesManager");
            return (Criteria) this;
        }

        public Criteria andSalesManagerNotLike(String value) {
            addCriterion("sales_manager not like", value, "salesManager");
            return (Criteria) this;
        }

        public Criteria andSalesManagerIn(List<String> values) {
            addCriterion("sales_manager in", values, "salesManager");
            return (Criteria) this;
        }

        public Criteria andSalesManagerNotIn(List<String> values) {
            addCriterion("sales_manager not in", values, "salesManager");
            return (Criteria) this;
        }

        public Criteria andSalesManagerBetween(String value1, String value2) {
            addCriterion("sales_manager between", value1, value2, "salesManager");
            return (Criteria) this;
        }

        public Criteria andSalesManagerNotBetween(String value1, String value2) {
            addCriterion("sales_manager not between", value1, value2, "salesManager");
            return (Criteria) this;
        }

        public Criteria andPaymentTypeIsNull() {
            addCriterion("payment_type is null");
            return (Criteria) this;
        }

        public Criteria andPaymentTypeIsNotNull() {
            addCriterion("payment_type is not null");
            return (Criteria) this;
        }

        public Criteria andPaymentTypeEqualTo(String value) {
            addCriterion("payment_type =", value, "paymentType");
            return (Criteria) this;
        }

        public Criteria andPaymentTypeNotEqualTo(String value) {
            addCriterion("payment_type <>", value, "paymentType");
            return (Criteria) this;
        }

        public Criteria andPaymentTypeGreaterThan(String value) {
            addCriterion("payment_type >", value, "paymentType");
            return (Criteria) this;
        }

        public Criteria andPaymentTypeGreaterThanOrEqualTo(String value) {
            addCriterion("payment_type >=", value, "paymentType");
            return (Criteria) this;
        }

        public Criteria andPaymentTypeLessThan(String value) {
            addCriterion("payment_type <", value, "paymentType");
            return (Criteria) this;
        }

        public Criteria andPaymentTypeLessThanOrEqualTo(String value) {
            addCriterion("payment_type <=", value, "paymentType");
            return (Criteria) this;
        }

        public Criteria andPaymentTypeLike(String value) {
            addCriterion("payment_type like", value, "paymentType");
            return (Criteria) this;
        }

        public Criteria andPaymentTypeNotLike(String value) {
            addCriterion("payment_type not like", value, "paymentType");
            return (Criteria) this;
        }

        public Criteria andPaymentTypeIn(List<String> values) {
            addCriterion("payment_type in", values, "paymentType");
            return (Criteria) this;
        }

        public Criteria andPaymentTypeNotIn(List<String> values) {
            addCriterion("payment_type not in", values, "paymentType");
            return (Criteria) this;
        }

        public Criteria andPaymentTypeBetween(String value1, String value2) {
            addCriterion("payment_type between", value1, value2, "paymentType");
            return (Criteria) this;
        }

        public Criteria andPaymentTypeNotBetween(String value1, String value2) {
            addCriterion("payment_type not between", value1, value2, "paymentType");
            return (Criteria) this;
        }

        public Criteria andStatusIsNull() {
            addCriterion("status is null");
            return (Criteria) this;
        }

        public Criteria andStatusIsNotNull() {
            addCriterion("status is not null");
            return (Criteria) this;
        }

        public Criteria andStatusEqualTo(String value) {
            addCriterion("status =", value, "status");
            return (Criteria) this;
        }

        public Criteria andStatusNotEqualTo(String value) {
            addCriterion("status <>", value, "status");
            return (Criteria) this;
        }

        public Criteria andStatusGreaterThan(String value) {
            addCriterion("status >", value, "status");
            return (Criteria) this;
        }

        public Criteria andStatusGreaterThanOrEqualTo(String value) {
            addCriterion("status >=", value, "status");
            return (Criteria) this;
        }

        public Criteria andStatusLessThan(String value) {
            addCriterion("status <", value, "status");
            return (Criteria) this;
        }

        public Criteria andStatusLessThanOrEqualTo(String value) {
            addCriterion("status <=", value, "status");
            return (Criteria) this;
        }

        public Criteria andStatusLike(String value) {
            addCriterion("status like", value, "status");
            return (Criteria) this;
        }

        public Criteria andStatusNotLike(String value) {
            addCriterion("status not like", value, "status");
            return (Criteria) this;
        }

        public Criteria andStatusIn(List<String> values) {
            addCriterion("status in", values, "status");
            return (Criteria) this;
        }

        public Criteria andStatusNotIn(List<String> values) {
            addCriterion("status not in", values, "status");
            return (Criteria) this;
        }

        public Criteria andStatusBetween(String value1, String value2) {
            addCriterion("status between", value1, value2, "status");
            return (Criteria) this;
        }

        public Criteria andStatusNotBetween(String value1, String value2) {
            addCriterion("status not between", value1, value2, "status");
            return (Criteria) this;
        }

        public Criteria andRemarksIsNull() {
            addCriterion("remarks is null");
            return (Criteria) this;
        }

        public Criteria andRemarksIsNotNull() {
            addCriterion("remarks is not null");
            return (Criteria) this;
        }

        public Criteria andRemarksEqualTo(String value) {
            addCriterion("remarks =", value, "remarks");
            return (Criteria) this;
        }

        public Criteria andRemarksNotEqualTo(String value) {
            addCriterion("remarks <>", value, "remarks");
            return (Criteria) this;
        }

        public Criteria andRemarksGreaterThan(String value) {
            addCriterion("remarks >", value, "remarks");
            return (Criteria) this;
        }

        public Criteria andRemarksGreaterThanOrEqualTo(String value) {
            addCriterion("remarks >=", value, "remarks");
            return (Criteria) this;
        }

        public Criteria andRemarksLessThan(String value) {
            addCriterion("remarks <", value, "remarks");
            return (Criteria) this;
        }

        public Criteria andRemarksLessThanOrEqualTo(String value) {
            addCriterion("remarks <=", value, "remarks");
            return (Criteria) this;
        }

        public Criteria andRemarksLike(String value) {
            addCriterion("remarks like", value, "remarks");
            return (Criteria) this;
        }

        public Criteria andRemarksNotLike(String value) {
            addCriterion("remarks not like", value, "remarks");
            return (Criteria) this;
        }

        public Criteria andRemarksIn(List<String> values) {
            addCriterion("remarks in", values, "remarks");
            return (Criteria) this;
        }

        public Criteria andRemarksNotIn(List<String> values) {
            addCriterion("remarks not in", values, "remarks");
            return (Criteria) this;
        }

        public Criteria andRemarksBetween(String value1, String value2) {
            addCriterion("remarks between", value1, value2, "remarks");
            return (Criteria) this;
        }

        public Criteria andRemarksNotBetween(String value1, String value2) {
            addCriterion("remarks not between", value1, value2, "remarks");
            return (Criteria) this;
        }

        public Criteria andEnterpriseAccountIsNull() {
            addCriterion("enterprise_account is null");
            return (Criteria) this;
        }

        public Criteria andEnterpriseAccountIsNotNull() {
            addCriterion("enterprise_account is not null");
            return (Criteria) this;
        }

        public Criteria andEnterpriseAccountEqualTo(String value) {
            addCriterion("enterprise_account =", value, "enterpriseAccount");
            return (Criteria) this;
        }

        public Criteria andEnterpriseAccountNotEqualTo(String value) {
            addCriterion("enterprise_account <>", value, "enterpriseAccount");
            return (Criteria) this;
        }

        public Criteria andEnterpriseAccountGreaterThan(String value) {
            addCriterion("enterprise_account >", value, "enterpriseAccount");
            return (Criteria) this;
        }

        public Criteria andEnterpriseAccountGreaterThanOrEqualTo(String value) {
            addCriterion("enterprise_account >=", value, "enterpriseAccount");
            return (Criteria) this;
        }

        public Criteria andEnterpriseAccountLessThan(String value) {
            addCriterion("enterprise_account <", value, "enterpriseAccount");
            return (Criteria) this;
        }

        public Criteria andEnterpriseAccountLessThanOrEqualTo(String value) {
            addCriterion("enterprise_account <=", value, "enterpriseAccount");
            return (Criteria) this;
        }

        public Criteria andEnterpriseAccountLike(String value) {
            addCriterion("enterprise_account like", value, "enterpriseAccount");
            return (Criteria) this;
        }

        public Criteria andEnterpriseAccountNotLike(String value) {
            addCriterion("enterprise_account not like", value, "enterpriseAccount");
            return (Criteria) this;
        }

        public Criteria andEnterpriseAccountIn(List<String> values) {
            addCriterion("enterprise_account in", values, "enterpriseAccount");
            return (Criteria) this;
        }

        public Criteria andEnterpriseAccountNotIn(List<String> values) {
            addCriterion("enterprise_account not in", values, "enterpriseAccount");
            return (Criteria) this;
        }

        public Criteria andEnterpriseAccountBetween(String value1, String value2) {
            addCriterion("enterprise_account between", value1, value2, "enterpriseAccount");
            return (Criteria) this;
        }

        public Criteria andEnterpriseAccountNotBetween(String value1, String value2) {
            addCriterion("enterprise_account not between", value1, value2, "enterpriseAccount");
            return (Criteria) this;
        }

        public Criteria andEnterprisePasswordIsNull() {
            addCriterion("enterprise_password is null");
            return (Criteria) this;
        }

        public Criteria andEnterprisePasswordIsNotNull() {
            addCriterion("enterprise_password is not null");
            return (Criteria) this;
        }

        public Criteria andEnterprisePasswordEqualTo(String value) {
            addCriterion("enterprise_password =", value, "enterprisePassword");
            return (Criteria) this;
        }

        public Criteria andEnterprisePasswordNotEqualTo(String value) {
            addCriterion("enterprise_password <>", value, "enterprisePassword");
            return (Criteria) this;
        }

        public Criteria andEnterprisePasswordGreaterThan(String value) {
            addCriterion("enterprise_password >", value, "enterprisePassword");
            return (Criteria) this;
        }

        public Criteria andEnterprisePasswordGreaterThanOrEqualTo(String value) {
            addCriterion("enterprise_password >=", value, "enterprisePassword");
            return (Criteria) this;
        }

        public Criteria andEnterprisePasswordLessThan(String value) {
            addCriterion("enterprise_password <", value, "enterprisePassword");
            return (Criteria) this;
        }

        public Criteria andEnterprisePasswordLessThanOrEqualTo(String value) {
            addCriterion("enterprise_password <=", value, "enterprisePassword");
            return (Criteria) this;
        }

        public Criteria andEnterprisePasswordLike(String value) {
            addCriterion("enterprise_password like", value, "enterprisePassword");
            return (Criteria) this;
        }

        public Criteria andEnterprisePasswordNotLike(String value) {
            addCriterion("enterprise_password not like", value, "enterprisePassword");
            return (Criteria) this;
        }

        public Criteria andEnterprisePasswordIn(List<String> values) {
            addCriterion("enterprise_password in", values, "enterprisePassword");
            return (Criteria) this;
        }

        public Criteria andEnterprisePasswordNotIn(List<String> values) {
            addCriterion("enterprise_password not in", values, "enterprisePassword");
            return (Criteria) this;
        }

        public Criteria andEnterprisePasswordBetween(String value1, String value2) {
            addCriterion("enterprise_password between", value1, value2, "enterprisePassword");
            return (Criteria) this;
        }

        public Criteria andEnterprisePasswordNotBetween(String value1, String value2) {
            addCriterion("enterprise_password not between", value1, value2, "enterprisePassword");
            return (Criteria) this;
        }

        public Criteria andSendTheTemplateIsNull() {
            addCriterion("send_the_template is null");
            return (Criteria) this;
        }

        public Criteria andSendTheTemplateIsNotNull() {
            addCriterion("send_the_template is not null");
            return (Criteria) this;
        }

        public Criteria andSendTheTemplateEqualTo(String value) {
            addCriterion("send_the_template =", value, "sendTheTemplate");
            return (Criteria) this;
        }

        public Criteria andSendTheTemplateNotEqualTo(String value) {
            addCriterion("send_the_template <>", value, "sendTheTemplate");
            return (Criteria) this;
        }

        public Criteria andSendTheTemplateGreaterThan(String value) {
            addCriterion("send_the_template >", value, "sendTheTemplate");
            return (Criteria) this;
        }

        public Criteria andSendTheTemplateGreaterThanOrEqualTo(String value) {
            addCriterion("send_the_template >=", value, "sendTheTemplate");
            return (Criteria) this;
        }

        public Criteria andSendTheTemplateLessThan(String value) {
            addCriterion("send_the_template <", value, "sendTheTemplate");
            return (Criteria) this;
        }

        public Criteria andSendTheTemplateLessThanOrEqualTo(String value) {
            addCriterion("send_the_template <=", value, "sendTheTemplate");
            return (Criteria) this;
        }

        public Criteria andSendTheTemplateLike(String value) {
            addCriterion("send_the_template like", value, "sendTheTemplate");
            return (Criteria) this;
        }

        public Criteria andSendTheTemplateNotLike(String value) {
            addCriterion("send_the_template not like", value, "sendTheTemplate");
            return (Criteria) this;
        }

        public Criteria andSendTheTemplateIn(List<String> values) {
            addCriterion("send_the_template in", values, "sendTheTemplate");
            return (Criteria) this;
        }

        public Criteria andSendTheTemplateNotIn(List<String> values) {
            addCriterion("send_the_template not in", values, "sendTheTemplate");
            return (Criteria) this;
        }

        public Criteria andSendTheTemplateBetween(String value1, String value2) {
            addCriterion("send_the_template between", value1, value2, "sendTheTemplate");
            return (Criteria) this;
        }

        public Criteria andSendTheTemplateNotBetween(String value1, String value2) {
            addCriterion("send_the_template not between", value1, value2, "sendTheTemplate");
            return (Criteria) this;
        }

        public Criteria andSensitiveWordReviewIsNull() {
            addCriterion("sensitive_word_review is null");
            return (Criteria) this;
        }

        public Criteria andSensitiveWordReviewIsNotNull() {
            addCriterion("sensitive_word_review is not null");
            return (Criteria) this;
        }

        public Criteria andSensitiveWordReviewEqualTo(String value) {
            addCriterion("sensitive_word_review =", value, "sensitiveWordReview");
            return (Criteria) this;
        }

        public Criteria andSensitiveWordReviewNotEqualTo(String value) {
            addCriterion("sensitive_word_review <>", value, "sensitiveWordReview");
            return (Criteria) this;
        }

        public Criteria andSensitiveWordReviewGreaterThan(String value) {
            addCriterion("sensitive_word_review >", value, "sensitiveWordReview");
            return (Criteria) this;
        }

        public Criteria andSensitiveWordReviewGreaterThanOrEqualTo(String value) {
            addCriterion("sensitive_word_review >=", value, "sensitiveWordReview");
            return (Criteria) this;
        }

        public Criteria andSensitiveWordReviewLessThan(String value) {
            addCriterion("sensitive_word_review <", value, "sensitiveWordReview");
            return (Criteria) this;
        }

        public Criteria andSensitiveWordReviewLessThanOrEqualTo(String value) {
            addCriterion("sensitive_word_review <=", value, "sensitiveWordReview");
            return (Criteria) this;
        }

        public Criteria andSensitiveWordReviewLike(String value) {
            addCriterion("sensitive_word_review like", value, "sensitiveWordReview");
            return (Criteria) this;
        }

        public Criteria andSensitiveWordReviewNotLike(String value) {
            addCriterion("sensitive_word_review not like", value, "sensitiveWordReview");
            return (Criteria) this;
        }

        public Criteria andSensitiveWordReviewIn(List<String> values) {
            addCriterion("sensitive_word_review in", values, "sensitiveWordReview");
            return (Criteria) this;
        }

        public Criteria andSensitiveWordReviewNotIn(List<String> values) {
            addCriterion("sensitive_word_review not in", values, "sensitiveWordReview");
            return (Criteria) this;
        }

        public Criteria andSensitiveWordReviewBetween(String value1, String value2) {
            addCriterion("sensitive_word_review between", value1, value2, "sensitiveWordReview");
            return (Criteria) this;
        }

        public Criteria andSensitiveWordReviewNotBetween(String value1, String value2) {
            addCriterion("sensitive_word_review not between", value1, value2, "sensitiveWordReview");
            return (Criteria) this;
        }

        public Criteria andGmtCreateIsNull() {
            addCriterion("gmt_create is null");
            return (Criteria) this;
        }

        public Criteria andGmtCreateIsNotNull() {
            addCriterion("gmt_create is not null");
            return (Criteria) this;
        }

        public Criteria andGmtCreateEqualTo(Date value) {
            addCriterion("gmt_create =", value, "gmtCreate");
            return (Criteria) this;
        }

        public Criteria andGmtCreateNotEqualTo(Date value) {
            addCriterion("gmt_create <>", value, "gmtCreate");
            return (Criteria) this;
        }

        public Criteria andGmtCreateGreaterThan(Date value) {
            addCriterion("gmt_create >", value, "gmtCreate");
            return (Criteria) this;
        }

        public Criteria andGmtCreateGreaterThanOrEqualTo(Date value) {
            addCriterion("gmt_create >=", value, "gmtCreate");
            return (Criteria) this;
        }

        public Criteria andGmtCreateLessThan(Date value) {
            addCriterion("gmt_create <", value, "gmtCreate");
            return (Criteria) this;
        }

        public Criteria andGmtCreateLessThanOrEqualTo(Date value) {
            addCriterion("gmt_create <=", value, "gmtCreate");
            return (Criteria) this;
        }

        public Criteria andGmtCreateIn(List<Date> values) {
            addCriterion("gmt_create in", values, "gmtCreate");
            return (Criteria) this;
        }

        public Criteria andGmtCreateNotIn(List<Date> values) {
            addCriterion("gmt_create not in", values, "gmtCreate");
            return (Criteria) this;
        }

        public Criteria andGmtCreateBetween(Date value1, Date value2) {
            addCriterion("gmt_create between", value1, value2, "gmtCreate");
            return (Criteria) this;
        }

        public Criteria andGmtCreateNotBetween(Date value1, Date value2) {
            addCriterion("gmt_create not between", value1, value2, "gmtCreate");
            return (Criteria) this;
        }

        public Criteria andGmtModifiedIsNull() {
            addCriterion("gmt_modified is null");
            return (Criteria) this;
        }

        public Criteria andGmtModifiedIsNotNull() {
            addCriterion("gmt_modified is not null");
            return (Criteria) this;
        }

        public Criteria andGmtModifiedEqualTo(Date value) {
            addCriterion("gmt_modified =", value, "gmtModified");
            return (Criteria) this;
        }

        public Criteria andGmtModifiedNotEqualTo(Date value) {
            addCriterion("gmt_modified <>", value, "gmtModified");
            return (Criteria) this;
        }

        public Criteria andGmtModifiedGreaterThan(Date value) {
            addCriterion("gmt_modified >", value, "gmtModified");
            return (Criteria) this;
        }

        public Criteria andGmtModifiedGreaterThanOrEqualTo(Date value) {
            addCriterion("gmt_modified >=", value, "gmtModified");
            return (Criteria) this;
        }

        public Criteria andGmtModifiedLessThan(Date value) {
            addCriterion("gmt_modified <", value, "gmtModified");
            return (Criteria) this;
        }

        public Criteria andGmtModifiedLessThanOrEqualTo(Date value) {
            addCriterion("gmt_modified <=", value, "gmtModified");
            return (Criteria) this;
        }

        public Criteria andGmtModifiedIn(List<Date> values) {
            addCriterion("gmt_modified in", values, "gmtModified");
            return (Criteria) this;
        }

        public Criteria andGmtModifiedNotIn(List<Date> values) {
            addCriterion("gmt_modified not in", values, "gmtModified");
            return (Criteria) this;
        }

        public Criteria andGmtModifiedBetween(Date value1, Date value2) {
            addCriterion("gmt_modified between", value1, value2, "gmtModified");
            return (Criteria) this;
        }

        public Criteria andGmtModifiedNotBetween(Date value1, Date value2) {
            addCriterion("gmt_modified not between", value1, value2, "gmtModified");
            return (Criteria) this;
        }

        public Criteria andContactIsNull() {
            addCriterion("contact is null");
            return (Criteria) this;
        }

        public Criteria andContactIsNotNull() {
            addCriterion("contact is not null");
            return (Criteria) this;
        }

        public Criteria andContactEqualTo(String value) {
            addCriterion("contact =", value, "contact");
            return (Criteria) this;
        }

        public Criteria andContactNotEqualTo(String value) {
            addCriterion("contact <>", value, "contact");
            return (Criteria) this;
        }

        public Criteria andContactGreaterThan(String value) {
            addCriterion("contact >", value, "contact");
            return (Criteria) this;
        }

        public Criteria andContactGreaterThanOrEqualTo(String value) {
            addCriterion("contact >=", value, "contact");
            return (Criteria) this;
        }

        public Criteria andContactLessThan(String value) {
            addCriterion("contact <", value, "contact");
            return (Criteria) this;
        }

        public Criteria andContactLessThanOrEqualTo(String value) {
            addCriterion("contact <=", value, "contact");
            return (Criteria) this;
        }

        public Criteria andContactLike(String value) {
            addCriterion("contact like", value, "contact");
            return (Criteria) this;
        }

        public Criteria andContactNotLike(String value) {
            addCriterion("contact not like", value, "contact");
            return (Criteria) this;
        }

        public Criteria andContactIn(List<String> values) {
            addCriterion("contact in", values, "contact");
            return (Criteria) this;
        }

        public Criteria andContactNotIn(List<String> values) {
            addCriterion("contact not in", values, "contact");
            return (Criteria) this;
        }

        public Criteria andContactBetween(String value1, String value2) {
            addCriterion("contact between", value1, value2, "contact");
            return (Criteria) this;
        }

        public Criteria andContactNotBetween(String value1, String value2) {
            addCriterion("contact not between", value1, value2, "contact");
            return (Criteria) this;
        }

        public Criteria andContactPhoneIsNull() {
            addCriterion("contact_phone is null");
            return (Criteria) this;
        }

        public Criteria andContactPhoneIsNotNull() {
            addCriterion("contact_phone is not null");
            return (Criteria) this;
        }

        public Criteria andContactPhoneEqualTo(String value) {
            addCriterion("contact_phone =", value, "contactPhone");
            return (Criteria) this;
        }

        public Criteria andContactPhoneNotEqualTo(String value) {
            addCriterion("contact_phone <>", value, "contactPhone");
            return (Criteria) this;
        }

        public Criteria andContactPhoneGreaterThan(String value) {
            addCriterion("contact_phone >", value, "contactPhone");
            return (Criteria) this;
        }

        public Criteria andContactPhoneGreaterThanOrEqualTo(String value) {
            addCriterion("contact_phone >=", value, "contactPhone");
            return (Criteria) this;
        }

        public Criteria andContactPhoneLessThan(String value) {
            addCriterion("contact_phone <", value, "contactPhone");
            return (Criteria) this;
        }

        public Criteria andContactPhoneLessThanOrEqualTo(String value) {
            addCriterion("contact_phone <=", value, "contactPhone");
            return (Criteria) this;
        }

        public Criteria andContactPhoneLike(String value) {
            addCriterion("contact_phone like", value, "contactPhone");
            return (Criteria) this;
        }

        public Criteria andContactPhoneNotLike(String value) {
            addCriterion("contact_phone not like", value, "contactPhone");
            return (Criteria) this;
        }

        public Criteria andContactPhoneIn(List<String> values) {
            addCriterion("contact_phone in", values, "contactPhone");
            return (Criteria) this;
        }

        public Criteria andContactPhoneNotIn(List<String> values) {
            addCriterion("contact_phone not in", values, "contactPhone");
            return (Criteria) this;
        }

        public Criteria andContactPhoneBetween(String value1, String value2) {
            addCriterion("contact_phone between", value1, value2, "contactPhone");
            return (Criteria) this;
        }

        public Criteria andContactPhoneNotBetween(String value1, String value2) {
            addCriterion("contact_phone not between", value1, value2, "contactPhone");
            return (Criteria) this;
        }
    }

    public static class Criteria extends GeneratedCriteria {

        protected Criteria() {
            super();
        }
    }

    public static class Criterion {
        private String condition;

        private Object value;

        private Object secondValue;

        private boolean noValue;

        private boolean singleValue;

        private boolean betweenValue;

        private boolean listValue;

        private String typeHandler;

        public String getCondition() {
            return condition;
        }

        public Object getValue() {
            return value;
        }

        public Object getSecondValue() {
            return secondValue;
        }

        public boolean isNoValue() {
            return noValue;
        }

        public boolean isSingleValue() {
            return singleValue;
        }

        public boolean isBetweenValue() {
            return betweenValue;
        }

        public boolean isListValue() {
            return listValue;
        }

        public String getTypeHandler() {
            return typeHandler;
        }

        protected Criterion(String condition) {
            super();
            this.condition = condition;
            this.typeHandler = null;
            this.noValue = true;
        }

        protected Criterion(String condition, Object value, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.typeHandler = typeHandler;
            if (value instanceof List<?>) {
                this.listValue = true;
            } else {
                this.singleValue = true;
            }
        }

        protected Criterion(String condition, Object value) {
            this(condition, value, null);
        }

        protected Criterion(String condition, Object value, Object secondValue, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.secondValue = secondValue;
            this.typeHandler = typeHandler;
            this.betweenValue = true;
        }

        protected Criterion(String condition, Object value, Object secondValue) {
            this(condition, value, secondValue, null);
        }
    }
}