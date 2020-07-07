package com.ruoyi.reward.domain;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class VideoExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    private Integer limit;

    private Integer offset;

    public VideoExample() {
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

        public Criteria andMoneyIsNull() {
            addCriterion("money is null");
            return (Criteria) this;
        }

        public Criteria andMoneyIsNotNull() {
            addCriterion("money is not null");
            return (Criteria) this;
        }

        public Criteria andMoneyEqualTo(String value) {
            addCriterion("money =", value, "money");
            return (Criteria) this;
        }

        public Criteria andMoneyNotEqualTo(String value) {
            addCriterion("money <>", value, "money");
            return (Criteria) this;
        }

        public Criteria andMoneyGreaterThan(String value) {
            addCriterion("money >", value, "money");
            return (Criteria) this;
        }

        public Criteria andMoneyGreaterThanOrEqualTo(String value) {
            addCriterion("money >=", value, "money");
            return (Criteria) this;
        }

        public Criteria andMoneyLessThan(String value) {
            addCriterion("money <", value, "money");
            return (Criteria) this;
        }

        public Criteria andMoneyLessThanOrEqualTo(String value) {
            addCriterion("money <=", value, "money");
            return (Criteria) this;
        }

        public Criteria andMoneyLike(String value) {
            addCriterion("money like", value, "money");
            return (Criteria) this;
        }

        public Criteria andMoneyNotLike(String value) {
            addCriterion("money not like", value, "money");
            return (Criteria) this;
        }

        public Criteria andMoneyIn(List<String> values) {
            addCriterion("money in", values, "money");
            return (Criteria) this;
        }

        public Criteria andMoneyNotIn(List<String> values) {
            addCriterion("money not in", values, "money");
            return (Criteria) this;
        }

        public Criteria andMoneyBetween(String value1, String value2) {
            addCriterion("money between", value1, value2, "money");
            return (Criteria) this;
        }

        public Criteria andMoneyNotBetween(String value1, String value2) {
            addCriterion("money not between", value1, value2, "money");
            return (Criteria) this;
        }

        public Criteria andSjIsNull() {
            addCriterion("sj is null");
            return (Criteria) this;
        }

        public Criteria andSjIsNotNull() {
            addCriterion("sj is not null");
            return (Criteria) this;
        }

        public Criteria andSjEqualTo(String value) {
            addCriterion("sj =", value, "sj");
            return (Criteria) this;
        }

        public Criteria andSjNotEqualTo(String value) {
            addCriterion("sj <>", value, "sj");
            return (Criteria) this;
        }

        public Criteria andSjGreaterThan(String value) {
            addCriterion("sj >", value, "sj");
            return (Criteria) this;
        }

        public Criteria andSjGreaterThanOrEqualTo(String value) {
            addCriterion("sj >=", value, "sj");
            return (Criteria) this;
        }

        public Criteria andSjLessThan(String value) {
            addCriterion("sj <", value, "sj");
            return (Criteria) this;
        }

        public Criteria andSjLessThanOrEqualTo(String value) {
            addCriterion("sj <=", value, "sj");
            return (Criteria) this;
        }

        public Criteria andSjLike(String value) {
            addCriterion("sj like", value, "sj");
            return (Criteria) this;
        }

        public Criteria andSjNotLike(String value) {
            addCriterion("sj not like", value, "sj");
            return (Criteria) this;
        }

        public Criteria andSjIn(List<String> values) {
            addCriterion("sj in", values, "sj");
            return (Criteria) this;
        }

        public Criteria andSjNotIn(List<String> values) {
            addCriterion("sj not in", values, "sj");
            return (Criteria) this;
        }

        public Criteria andSjBetween(String value1, String value2) {
            addCriterion("sj between", value1, value2, "sj");
            return (Criteria) this;
        }

        public Criteria andSjNotBetween(String value1, String value2) {
            addCriterion("sj not between", value1, value2, "sj");
            return (Criteria) this;
        }

        public Criteria andCsIsNull() {
            addCriterion("cs is null");
            return (Criteria) this;
        }

        public Criteria andCsIsNotNull() {
            addCriterion("cs is not null");
            return (Criteria) this;
        }

        public Criteria andCsEqualTo(String value) {
            addCriterion("cs =", value, "cs");
            return (Criteria) this;
        }

        public Criteria andCsNotEqualTo(String value) {
            addCriterion("cs <>", value, "cs");
            return (Criteria) this;
        }

        public Criteria andCsGreaterThan(String value) {
            addCriterion("cs >", value, "cs");
            return (Criteria) this;
        }

        public Criteria andCsGreaterThanOrEqualTo(String value) {
            addCriterion("cs >=", value, "cs");
            return (Criteria) this;
        }

        public Criteria andCsLessThan(String value) {
            addCriterion("cs <", value, "cs");
            return (Criteria) this;
        }

        public Criteria andCsLessThanOrEqualTo(String value) {
            addCriterion("cs <=", value, "cs");
            return (Criteria) this;
        }

        public Criteria andCsLike(String value) {
            addCriterion("cs like", value, "cs");
            return (Criteria) this;
        }

        public Criteria andCsNotLike(String value) {
            addCriterion("cs not like", value, "cs");
            return (Criteria) this;
        }

        public Criteria andCsIn(List<String> values) {
            addCriterion("cs in", values, "cs");
            return (Criteria) this;
        }

        public Criteria andCsNotIn(List<String> values) {
            addCriterion("cs not in", values, "cs");
            return (Criteria) this;
        }

        public Criteria andCsBetween(String value1, String value2) {
            addCriterion("cs between", value1, value2, "cs");
            return (Criteria) this;
        }

        public Criteria andCsNotBetween(String value1, String value2) {
            addCriterion("cs not between", value1, value2, "cs");
            return (Criteria) this;
        }

        public Criteria andUrlIsNull() {
            addCriterion("url is null");
            return (Criteria) this;
        }

        public Criteria andUrlIsNotNull() {
            addCriterion("url is not null");
            return (Criteria) this;
        }

        public Criteria andUrlEqualTo(String value) {
            addCriterion("url =", value, "url");
            return (Criteria) this;
        }

        public Criteria andUrlNotEqualTo(String value) {
            addCriterion("url <>", value, "url");
            return (Criteria) this;
        }

        public Criteria andUrlGreaterThan(String value) {
            addCriterion("url >", value, "url");
            return (Criteria) this;
        }

        public Criteria andUrlGreaterThanOrEqualTo(String value) {
            addCriterion("url >=", value, "url");
            return (Criteria) this;
        }

        public Criteria andUrlLessThan(String value) {
            addCriterion("url <", value, "url");
            return (Criteria) this;
        }

        public Criteria andUrlLessThanOrEqualTo(String value) {
            addCriterion("url <=", value, "url");
            return (Criteria) this;
        }

        public Criteria andUrlLike(String value) {
            addCriterion("url like", value, "url");
            return (Criteria) this;
        }

        public Criteria andUrlNotLike(String value) {
            addCriterion("url not like", value, "url");
            return (Criteria) this;
        }

        public Criteria andUrlIn(List<String> values) {
            addCriterion("url in", values, "url");
            return (Criteria) this;
        }

        public Criteria andUrlNotIn(List<String> values) {
            addCriterion("url not in", values, "url");
            return (Criteria) this;
        }

        public Criteria andUrlBetween(String value1, String value2) {
            addCriterion("url between", value1, value2, "url");
            return (Criteria) this;
        }

        public Criteria andUrlNotBetween(String value1, String value2) {
            addCriterion("url not between", value1, value2, "url");
            return (Criteria) this;
        }

        public Criteria andUserIdIsNull() {
            addCriterion("user_id is null");
            return (Criteria) this;
        }

        public Criteria andUserIdIsNotNull() {
            addCriterion("user_id is not null");
            return (Criteria) this;
        }

        public Criteria andUserIdEqualTo(String value) {
            addCriterion("user_id =", value, "userId");
            return (Criteria) this;
        }

        public Criteria andUserIdNotEqualTo(String value) {
            addCriterion("user_id <>", value, "userId");
            return (Criteria) this;
        }

        public Criteria andUserIdGreaterThan(String value) {
            addCriterion("user_id >", value, "userId");
            return (Criteria) this;
        }

        public Criteria andUserIdGreaterThanOrEqualTo(String value) {
            addCriterion("user_id >=", value, "userId");
            return (Criteria) this;
        }

        public Criteria andUserIdLessThan(String value) {
            addCriterion("user_id <", value, "userId");
            return (Criteria) this;
        }

        public Criteria andUserIdLessThanOrEqualTo(String value) {
            addCriterion("user_id <=", value, "userId");
            return (Criteria) this;
        }

        public Criteria andUserIdLike(String value) {
            addCriterion("user_id like", value, "userId");
            return (Criteria) this;
        }

        public Criteria andUserIdNotLike(String value) {
            addCriterion("user_id not like", value, "userId");
            return (Criteria) this;
        }

        public Criteria andUserIdIn(List<String> values) {
            addCriterion("user_id in", values, "userId");
            return (Criteria) this;
        }

        public Criteria andUserIdNotIn(List<String> values) {
            addCriterion("user_id not in", values, "userId");
            return (Criteria) this;
        }

        public Criteria andUserIdBetween(String value1, String value2) {
            addCriterion("user_id between", value1, value2, "userId");
            return (Criteria) this;
        }

        public Criteria andUserIdNotBetween(String value1, String value2) {
            addCriterion("user_id not between", value1, value2, "userId");
            return (Criteria) this;
        }

        public Criteria andNameIsNull() {
            addCriterion("name is null");
            return (Criteria) this;
        }

        public Criteria andNameIsNotNull() {
            addCriterion("name is not null");
            return (Criteria) this;
        }

        public Criteria andNameEqualTo(String value) {
            addCriterion("name =", value, "name");
            return (Criteria) this;
        }

        public Criteria andNameNotEqualTo(String value) {
            addCriterion("name <>", value, "name");
            return (Criteria) this;
        }

        public Criteria andNameGreaterThan(String value) {
            addCriterion("name >", value, "name");
            return (Criteria) this;
        }

        public Criteria andNameGreaterThanOrEqualTo(String value) {
            addCriterion("name >=", value, "name");
            return (Criteria) this;
        }

        public Criteria andNameLessThan(String value) {
            addCriterion("name <", value, "name");
            return (Criteria) this;
        }

        public Criteria andNameLessThanOrEqualTo(String value) {
            addCriterion("name <=", value, "name");
            return (Criteria) this;
        }

        public Criteria andNameLike(String value) {
            addCriterion("name like", value, "name");
            return (Criteria) this;
        }

        public Criteria andNameNotLike(String value) {
            addCriterion("name not like", value, "name");
            return (Criteria) this;
        }

        public Criteria andNameIn(List<String> values) {
            addCriterion("name in", values, "name");
            return (Criteria) this;
        }

        public Criteria andNameNotIn(List<String> values) {
            addCriterion("name not in", values, "name");
            return (Criteria) this;
        }

        public Criteria andNameBetween(String value1, String value2) {
            addCriterion("name between", value1, value2, "name");
            return (Criteria) this;
        }

        public Criteria andNameNotBetween(String value1, String value2) {
            addCriterion("name not between", value1, value2, "name");
            return (Criteria) this;
        }

        public Criteria andZykeyIsNull() {
            addCriterion("zykey is null");
            return (Criteria) this;
        }

        public Criteria andZykeyIsNotNull() {
            addCriterion("zykey is not null");
            return (Criteria) this;
        }

        public Criteria andZykeyEqualTo(String value) {
            addCriterion("zykey =", value, "zykey");
            return (Criteria) this;
        }

        public Criteria andZykeyNotEqualTo(String value) {
            addCriterion("zykey <>", value, "zykey");
            return (Criteria) this;
        }

        public Criteria andZykeyGreaterThan(String value) {
            addCriterion("zykey >", value, "zykey");
            return (Criteria) this;
        }

        public Criteria andZykeyGreaterThanOrEqualTo(String value) {
            addCriterion("zykey >=", value, "zykey");
            return (Criteria) this;
        }

        public Criteria andZykeyLessThan(String value) {
            addCriterion("zykey <", value, "zykey");
            return (Criteria) this;
        }

        public Criteria andZykeyLessThanOrEqualTo(String value) {
            addCriterion("zykey <=", value, "zykey");
            return (Criteria) this;
        }

        public Criteria andZykeyLike(String value) {
            addCriterion("zykey like", value, "zykey");
            return (Criteria) this;
        }

        public Criteria andZykeyNotLike(String value) {
            addCriterion("zykey not like", value, "zykey");
            return (Criteria) this;
        }

        public Criteria andZykeyIn(List<String> values) {
            addCriterion("zykey in", values, "zykey");
            return (Criteria) this;
        }

        public Criteria andZykeyNotIn(List<String> values) {
            addCriterion("zykey not in", values, "zykey");
            return (Criteria) this;
        }

        public Criteria andZykeyBetween(String value1, String value2) {
            addCriterion("zykey between", value1, value2, "zykey");
            return (Criteria) this;
        }

        public Criteria andZykeyNotBetween(String value1, String value2) {
            addCriterion("zykey not between", value1, value2, "zykey");
            return (Criteria) this;
        }

        public Criteria andShijianIsNull() {
            addCriterion("shijian is null");
            return (Criteria) this;
        }

        public Criteria andShijianIsNotNull() {
            addCriterion("shijian is not null");
            return (Criteria) this;
        }

        public Criteria andShijianEqualTo(String value) {
            addCriterion("shijian =", value, "shijian");
            return (Criteria) this;
        }

        public Criteria andShijianNotEqualTo(String value) {
            addCriterion("shijian <>", value, "shijian");
            return (Criteria) this;
        }

        public Criteria andShijianGreaterThan(String value) {
            addCriterion("shijian >", value, "shijian");
            return (Criteria) this;
        }

        public Criteria andShijianGreaterThanOrEqualTo(String value) {
            addCriterion("shijian >=", value, "shijian");
            return (Criteria) this;
        }

        public Criteria andShijianLessThan(String value) {
            addCriterion("shijian <", value, "shijian");
            return (Criteria) this;
        }

        public Criteria andShijianLessThanOrEqualTo(String value) {
            addCriterion("shijian <=", value, "shijian");
            return (Criteria) this;
        }

        public Criteria andShijianLike(String value) {
            addCriterion("shijian like", value, "shijian");
            return (Criteria) this;
        }

        public Criteria andShijianNotLike(String value) {
            addCriterion("shijian not like", value, "shijian");
            return (Criteria) this;
        }

        public Criteria andShijianIn(List<String> values) {
            addCriterion("shijian in", values, "shijian");
            return (Criteria) this;
        }

        public Criteria andShijianNotIn(List<String> values) {
            addCriterion("shijian not in", values, "shijian");
            return (Criteria) this;
        }

        public Criteria andShijianBetween(String value1, String value2) {
            addCriterion("shijian between", value1, value2, "shijian");
            return (Criteria) this;
        }

        public Criteria andShijianNotBetween(String value1, String value2) {
            addCriterion("shijian not between", value1, value2, "shijian");
            return (Criteria) this;
        }

        public Criteria andLxIsNull() {
            addCriterion("lx is null");
            return (Criteria) this;
        }

        public Criteria andLxIsNotNull() {
            addCriterion("lx is not null");
            return (Criteria) this;
        }

        public Criteria andLxEqualTo(String value) {
            addCriterion("lx =", value, "lx");
            return (Criteria) this;
        }

        public Criteria andLxNotEqualTo(String value) {
            addCriterion("lx <>", value, "lx");
            return (Criteria) this;
        }

        public Criteria andLxGreaterThan(String value) {
            addCriterion("lx >", value, "lx");
            return (Criteria) this;
        }

        public Criteria andLxGreaterThanOrEqualTo(String value) {
            addCriterion("lx >=", value, "lx");
            return (Criteria) this;
        }

        public Criteria andLxLessThan(String value) {
            addCriterion("lx <", value, "lx");
            return (Criteria) this;
        }

        public Criteria andLxLessThanOrEqualTo(String value) {
            addCriterion("lx <=", value, "lx");
            return (Criteria) this;
        }

        public Criteria andLxLike(String value) {
            addCriterion("lx like", value, "lx");
            return (Criteria) this;
        }

        public Criteria andLxNotLike(String value) {
            addCriterion("lx not like", value, "lx");
            return (Criteria) this;
        }

        public Criteria andLxIn(List<String> values) {
            addCriterion("lx in", values, "lx");
            return (Criteria) this;
        }

        public Criteria andLxNotIn(List<String> values) {
            addCriterion("lx not in", values, "lx");
            return (Criteria) this;
        }

        public Criteria andLxBetween(String value1, String value2) {
            addCriterion("lx between", value1, value2, "lx");
            return (Criteria) this;
        }

        public Criteria andLxNotBetween(String value1, String value2) {
            addCriterion("lx not between", value1, value2, "lx");
            return (Criteria) this;
        }

        public Criteria andZtIsNull() {
            addCriterion("zt is null");
            return (Criteria) this;
        }

        public Criteria andZtIsNotNull() {
            addCriterion("zt is not null");
            return (Criteria) this;
        }

        public Criteria andZtEqualTo(String value) {
            addCriterion("zt =", value, "zt");
            return (Criteria) this;
        }

        public Criteria andZtNotEqualTo(String value) {
            addCriterion("zt <>", value, "zt");
            return (Criteria) this;
        }

        public Criteria andZtGreaterThan(String value) {
            addCriterion("zt >", value, "zt");
            return (Criteria) this;
        }

        public Criteria andZtGreaterThanOrEqualTo(String value) {
            addCriterion("zt >=", value, "zt");
            return (Criteria) this;
        }

        public Criteria andZtLessThan(String value) {
            addCriterion("zt <", value, "zt");
            return (Criteria) this;
        }

        public Criteria andZtLessThanOrEqualTo(String value) {
            addCriterion("zt <=", value, "zt");
            return (Criteria) this;
        }

        public Criteria andZtLike(String value) {
            addCriterion("zt like", value, "zt");
            return (Criteria) this;
        }

        public Criteria andZtNotLike(String value) {
            addCriterion("zt not like", value, "zt");
            return (Criteria) this;
        }

        public Criteria andZtIn(List<String> values) {
            addCriterion("zt in", values, "zt");
            return (Criteria) this;
        }

        public Criteria andZtNotIn(List<String> values) {
            addCriterion("zt not in", values, "zt");
            return (Criteria) this;
        }

        public Criteria andZtBetween(String value1, String value2) {
            addCriterion("zt between", value1, value2, "zt");
            return (Criteria) this;
        }

        public Criteria andZtNotBetween(String value1, String value2) {
            addCriterion("zt not between", value1, value2, "zt");
            return (Criteria) this;
        }

        public Criteria andLogoIsNull() {
            addCriterion("logo is null");
            return (Criteria) this;
        }

        public Criteria andLogoIsNotNull() {
            addCriterion("logo is not null");
            return (Criteria) this;
        }

        public Criteria andLogoEqualTo(String value) {
            addCriterion("logo =", value, "logo");
            return (Criteria) this;
        }

        public Criteria andLogoNotEqualTo(String value) {
            addCriterion("logo <>", value, "logo");
            return (Criteria) this;
        }

        public Criteria andLogoGreaterThan(String value) {
            addCriterion("logo >", value, "logo");
            return (Criteria) this;
        }

        public Criteria andLogoGreaterThanOrEqualTo(String value) {
            addCriterion("logo >=", value, "logo");
            return (Criteria) this;
        }

        public Criteria andLogoLessThan(String value) {
            addCriterion("logo <", value, "logo");
            return (Criteria) this;
        }

        public Criteria andLogoLessThanOrEqualTo(String value) {
            addCriterion("logo <=", value, "logo");
            return (Criteria) this;
        }

        public Criteria andLogoLike(String value) {
            addCriterion("logo like", value, "logo");
            return (Criteria) this;
        }

        public Criteria andLogoNotLike(String value) {
            addCriterion("logo not like", value, "logo");
            return (Criteria) this;
        }

        public Criteria andLogoIn(List<String> values) {
            addCriterion("logo in", values, "logo");
            return (Criteria) this;
        }

        public Criteria andLogoNotIn(List<String> values) {
            addCriterion("logo not in", values, "logo");
            return (Criteria) this;
        }

        public Criteria andLogoBetween(String value1, String value2) {
            addCriterion("logo between", value1, value2, "logo");
            return (Criteria) this;
        }

        public Criteria andLogoNotBetween(String value1, String value2) {
            addCriterion("logo not between", value1, value2, "logo");
            return (Criteria) this;
        }

        public Criteria andIsLeiIsNull() {
            addCriterion("is_lei is null");
            return (Criteria) this;
        }

        public Criteria andIsLeiIsNotNull() {
            addCriterion("is_lei is not null");
            return (Criteria) this;
        }

        public Criteria andIsLeiEqualTo(Boolean value) {
            addCriterion("is_lei =", value, "isLei");
            return (Criteria) this;
        }

        public Criteria andIsLeiNotEqualTo(Boolean value) {
            addCriterion("is_lei <>", value, "isLei");
            return (Criteria) this;
        }

        public Criteria andIsLeiGreaterThan(Boolean value) {
            addCriterion("is_lei >", value, "isLei");
            return (Criteria) this;
        }

        public Criteria andIsLeiGreaterThanOrEqualTo(Boolean value) {
            addCriterion("is_lei >=", value, "isLei");
            return (Criteria) this;
        }

        public Criteria andIsLeiLessThan(Boolean value) {
            addCriterion("is_lei <", value, "isLei");
            return (Criteria) this;
        }

        public Criteria andIsLeiLessThanOrEqualTo(Boolean value) {
            addCriterion("is_lei <=", value, "isLei");
            return (Criteria) this;
        }

        public Criteria andIsLeiIn(List<Boolean> values) {
            addCriterion("is_lei in", values, "isLei");
            return (Criteria) this;
        }

        public Criteria andIsLeiNotIn(List<Boolean> values) {
            addCriterion("is_lei not in", values, "isLei");
            return (Criteria) this;
        }

        public Criteria andIsLeiBetween(Boolean value1, Boolean value2) {
            addCriterion("is_lei between", value1, value2, "isLei");
            return (Criteria) this;
        }

        public Criteria andIsLeiNotBetween(Boolean value1, Boolean value2) {
            addCriterion("is_lei not between", value1, value2, "isLei");
            return (Criteria) this;
        }

        public Criteria andIsAllowIsNull() {
            addCriterion("is_allow is null");
            return (Criteria) this;
        }

        public Criteria andIsAllowIsNotNull() {
            addCriterion("is_allow is not null");
            return (Criteria) this;
        }

        public Criteria andIsAllowEqualTo(Boolean value) {
            addCriterion("is_allow =", value, "isAllow");
            return (Criteria) this;
        }

        public Criteria andIsAllowNotEqualTo(Boolean value) {
            addCriterion("is_allow <>", value, "isAllow");
            return (Criteria) this;
        }

        public Criteria andIsAllowGreaterThan(Boolean value) {
            addCriterion("is_allow >", value, "isAllow");
            return (Criteria) this;
        }

        public Criteria andIsAllowGreaterThanOrEqualTo(Boolean value) {
            addCriterion("is_allow >=", value, "isAllow");
            return (Criteria) this;
        }

        public Criteria andIsAllowLessThan(Boolean value) {
            addCriterion("is_allow <", value, "isAllow");
            return (Criteria) this;
        }

        public Criteria andIsAllowLessThanOrEqualTo(Boolean value) {
            addCriterion("is_allow <=", value, "isAllow");
            return (Criteria) this;
        }

        public Criteria andIsAllowIn(List<Boolean> values) {
            addCriterion("is_allow in", values, "isAllow");
            return (Criteria) this;
        }

        public Criteria andIsAllowNotIn(List<Boolean> values) {
            addCriterion("is_allow not in", values, "isAllow");
            return (Criteria) this;
        }

        public Criteria andIsAllowBetween(Boolean value1, Boolean value2) {
            addCriterion("is_allow between", value1, value2, "isAllow");
            return (Criteria) this;
        }

        public Criteria andIsAllowNotBetween(Boolean value1, Boolean value2) {
            addCriterion("is_allow not between", value1, value2, "isAllow");
            return (Criteria) this;
        }

        public Criteria andClickIsNull() {
            addCriterion("click is null");
            return (Criteria) this;
        }

        public Criteria andClickIsNotNull() {
            addCriterion("click is not null");
            return (Criteria) this;
        }

        public Criteria andClickEqualTo(Integer value) {
            addCriterion("click =", value, "click");
            return (Criteria) this;
        }

        public Criteria andClickNotEqualTo(Integer value) {
            addCriterion("click <>", value, "click");
            return (Criteria) this;
        }

        public Criteria andClickGreaterThan(Integer value) {
            addCriterion("click >", value, "click");
            return (Criteria) this;
        }

        public Criteria andClickGreaterThanOrEqualTo(Integer value) {
            addCriterion("click >=", value, "click");
            return (Criteria) this;
        }

        public Criteria andClickLessThan(Integer value) {
            addCriterion("click <", value, "click");
            return (Criteria) this;
        }

        public Criteria andClickLessThanOrEqualTo(Integer value) {
            addCriterion("click <=", value, "click");
            return (Criteria) this;
        }

        public Criteria andClickIn(List<Integer> values) {
            addCriterion("click in", values, "click");
            return (Criteria) this;
        }

        public Criteria andClickNotIn(List<Integer> values) {
            addCriterion("click not in", values, "click");
            return (Criteria) this;
        }

        public Criteria andClickBetween(Integer value1, Integer value2) {
            addCriterion("click between", value1, value2, "click");
            return (Criteria) this;
        }

        public Criteria andClickNotBetween(Integer value1, Integer value2) {
            addCriterion("click not between", value1, value2, "click");
            return (Criteria) this;
        }

        public Criteria andIsPreviewIsNull() {
            addCriterion("is_preview is null");
            return (Criteria) this;
        }

        public Criteria andIsPreviewIsNotNull() {
            addCriterion("is_preview is not null");
            return (Criteria) this;
        }

        public Criteria andIsPreviewEqualTo(Boolean value) {
            addCriterion("is_preview =", value, "isPreview");
            return (Criteria) this;
        }

        public Criteria andIsPreviewNotEqualTo(Boolean value) {
            addCriterion("is_preview <>", value, "isPreview");
            return (Criteria) this;
        }

        public Criteria andIsPreviewGreaterThan(Boolean value) {
            addCriterion("is_preview >", value, "isPreview");
            return (Criteria) this;
        }

        public Criteria andIsPreviewGreaterThanOrEqualTo(Boolean value) {
            addCriterion("is_preview >=", value, "isPreview");
            return (Criteria) this;
        }

        public Criteria andIsPreviewLessThan(Boolean value) {
            addCriterion("is_preview <", value, "isPreview");
            return (Criteria) this;
        }

        public Criteria andIsPreviewLessThanOrEqualTo(Boolean value) {
            addCriterion("is_preview <=", value, "isPreview");
            return (Criteria) this;
        }

        public Criteria andIsPreviewIn(List<Boolean> values) {
            addCriterion("is_preview in", values, "isPreview");
            return (Criteria) this;
        }

        public Criteria andIsPreviewNotIn(List<Boolean> values) {
            addCriterion("is_preview not in", values, "isPreview");
            return (Criteria) this;
        }

        public Criteria andIsPreviewBetween(Boolean value1, Boolean value2) {
            addCriterion("is_preview between", value1, value2, "isPreview");
            return (Criteria) this;
        }

        public Criteria andIsPreviewNotBetween(Boolean value1, Boolean value2) {
            addCriterion("is_preview not between", value1, value2, "isPreview");
            return (Criteria) this;
        }

        public Criteria andShorturlIsNull() {
            addCriterion("shorturl is null");
            return (Criteria) this;
        }

        public Criteria andShorturlIsNotNull() {
            addCriterion("shorturl is not null");
            return (Criteria) this;
        }

        public Criteria andShorturlEqualTo(String value) {
            addCriterion("shorturl =", value, "shorturl");
            return (Criteria) this;
        }

        public Criteria andShorturlNotEqualTo(String value) {
            addCriterion("shorturl <>", value, "shorturl");
            return (Criteria) this;
        }

        public Criteria andShorturlGreaterThan(String value) {
            addCriterion("shorturl >", value, "shorturl");
            return (Criteria) this;
        }

        public Criteria andShorturlGreaterThanOrEqualTo(String value) {
            addCriterion("shorturl >=", value, "shorturl");
            return (Criteria) this;
        }

        public Criteria andShorturlLessThan(String value) {
            addCriterion("shorturl <", value, "shorturl");
            return (Criteria) this;
        }

        public Criteria andShorturlLessThanOrEqualTo(String value) {
            addCriterion("shorturl <=", value, "shorturl");
            return (Criteria) this;
        }

        public Criteria andShorturlLike(String value) {
            addCriterion("shorturl like", value, "shorturl");
            return (Criteria) this;
        }

        public Criteria andShorturlNotLike(String value) {
            addCriterion("shorturl not like", value, "shorturl");
            return (Criteria) this;
        }

        public Criteria andShorturlIn(List<String> values) {
            addCriterion("shorturl in", values, "shorturl");
            return (Criteria) this;
        }

        public Criteria andShorturlNotIn(List<String> values) {
            addCriterion("shorturl not in", values, "shorturl");
            return (Criteria) this;
        }

        public Criteria andShorturlBetween(String value1, String value2) {
            addCriterion("shorturl between", value1, value2, "shorturl");
            return (Criteria) this;
        }

        public Criteria andShorturlNotBetween(String value1, String value2) {
            addCriterion("shorturl not between", value1, value2, "shorturl");
            return (Criteria) this;
        }

        public Criteria andCategoryIdIsNull() {
            addCriterion("category_id is null");
            return (Criteria) this;
        }

        public Criteria andCategoryIdIsNotNull() {
            addCriterion("category_id is not null");
            return (Criteria) this;
        }

        public Criteria andCategoryIdEqualTo(Integer value) {
            addCriterion("category_id =", value, "categoryId");
            return (Criteria) this;
        }

        public Criteria andCategoryIdNotEqualTo(Integer value) {
            addCriterion("category_id <>", value, "categoryId");
            return (Criteria) this;
        }

        public Criteria andCategoryIdGreaterThan(Integer value) {
            addCriterion("category_id >", value, "categoryId");
            return (Criteria) this;
        }

        public Criteria andCategoryIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("category_id >=", value, "categoryId");
            return (Criteria) this;
        }

        public Criteria andCategoryIdLessThan(Integer value) {
            addCriterion("category_id <", value, "categoryId");
            return (Criteria) this;
        }

        public Criteria andCategoryIdLessThanOrEqualTo(Integer value) {
            addCriterion("category_id <=", value, "categoryId");
            return (Criteria) this;
        }

        public Criteria andCategoryIdIn(List<Integer> values) {
            addCriterion("category_id in", values, "categoryId");
            return (Criteria) this;
        }

        public Criteria andCategoryIdNotIn(List<Integer> values) {
            addCriterion("category_id not in", values, "categoryId");
            return (Criteria) this;
        }

        public Criteria andCategoryIdBetween(Integer value1, Integer value2) {
            addCriterion("category_id between", value1, value2, "categoryId");
            return (Criteria) this;
        }

        public Criteria andCategoryIdNotBetween(Integer value1, Integer value2) {
            addCriterion("category_id not between", value1, value2, "categoryId");
            return (Criteria) this;
        }

        public Criteria andCreateTimeIsNull() {
            addCriterion("create_time is null");
            return (Criteria) this;
        }

        public Criteria andCreateTimeIsNotNull() {
            addCriterion("create_time is not null");
            return (Criteria) this;
        }

        public Criteria andCreateTimeEqualTo(Date value) {
            addCriterion("create_time =", value, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeNotEqualTo(Date value) {
            addCriterion("create_time <>", value, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeGreaterThan(Date value) {
            addCriterion("create_time >", value, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeGreaterThanOrEqualTo(Date value) {
            addCriterion("create_time >=", value, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeLessThan(Date value) {
            addCriterion("create_time <", value, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeLessThanOrEqualTo(Date value) {
            addCriterion("create_time <=", value, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeIn(List<Date> values) {
            addCriterion("create_time in", values, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeNotIn(List<Date> values) {
            addCriterion("create_time not in", values, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeBetween(Date value1, Date value2) {
            addCriterion("create_time between", value1, value2, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeNotBetween(Date value1, Date value2) {
            addCriterion("create_time not between", value1, value2, "createTime");
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