package com.ruoyi.reward.facade.enums;

import com.google.common.collect.Lists;
import lombok.Getter;
import org.near.toolkit.model.BaseEnum;
import org.near.toolkit.model.ToString;

import java.util.List;

/**
 * @author sunflower
 */
@Getter
public enum MultiType implements BaseEnum {


    /**
     * 用户提现
     */
    dialog("dialog", "网页包含违法信息"


            , Lists.newArrayList(
            new ItemContent(1, "色情"),
            new ItemContent(15, "暴恐血腥"),
            new ItemContent(5, "政治敏感"),
            new ItemContent(16, "赌博")


    )),
    /**
     * picker
     */

    picker("picker", "网页包含诱导分享/关注性质的内容"


            ,

            Lists.newArrayList(
                    new ItemContent(56, "好友助力加速"),
                    new ItemContent(57, "砍价"),
                    new ItemContent(58, "任务收集"),
                    new ItemContent(59, "诱导下载")

            )),

    /**
     * top
     */
    top("top", "网页包含不适当的内容对我造成骚扰",
            Lists.newArrayList(
                    new ItemContent(60, "内容低俗/题文不符"),
                    new ItemContent(61, "骚扰/广告/垃圾信息"))

    ),

    /**
     * navbar
     */
    navbar("navbar", "网页包含隐私泄露风险",
            Lists.newArrayList(
                    new ItemContent(62, "收集个人隐私信息（如：钓鱼链接）"),
                    new ItemContent(63, "违规使用用户头像"),
                    new ItemContent(64, "仿冒微信功能")
            )
    ),
    ;

    private String code;
    private String desc;
    private List<ItemContent> list;

    MultiType(String code, String desc) {
        this.code = code;
        this.desc = desc;
    }

    MultiType(String code, String desc, List<ItemContent> list) {
        this.code = code;
        this.desc = desc;
        this.list = list;
    }

    @Override
    public String getCode() {
        return code;
    }

    @Override
    public String getDesc() {
        return desc;
    }

    public List<ItemContent> getList() {
        return list;
    }


    public static
    class ItemContent extends ToString {
        private Integer id;
        private String name;

        public ItemContent() {
        }

        public ItemContent(Integer id, String name) {
            this.id = id;
            this.name = name;
        }

        public Integer getId() {
            return id;
        }

        public void setId(Integer id) {
            this.id = id;
        }

        public void setName(String name) {
            this.name = name;
        }

        public String getName() {
            return name;
        }
    }

}
