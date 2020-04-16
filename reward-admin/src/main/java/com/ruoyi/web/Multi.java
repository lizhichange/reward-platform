package com.ruoyi.web;

import java.util.List;

/**
 * @author sunflower
 */
public class Multi {


    /**
     * list : ["请选择投诉该网页的原因：",{"id":32,"name":"网页包含欺诈信息（如：假红包）","list":["你可以：",{"id":108,"name":"提交给微信团队审核","proof":0}]},{"id":58,"name":"网页包含违法信息","list":["请选择哪一类违法内容：",{"id":1,"name":"色情","list":["你可以：",{"id":108,"name":"提交给微信团队审核","proof":0}]},{"id":15,"name":"暴恐血腥","list":["你可以：",{"id":108,"name":"提交给微信团队审核","proof":0}]},{"id":5,"name":"政治敏感","list":["你可以：",{"id":108,"name":"提交给微信团队审核","proof":0}]},{"id":16,"name":"赌博","list":["你可以：",{"id":108,"name":"提交给微信团队审核","proof":0}]}]},{"id":14,"name":"网页可能包含谣言信息","list":["你可以：",{"id":108,"name":"提交给微信团队审核","proof":0}]},{"id":13,"name":"网页包含诱导分享/关注性质的内容","list":["请选择哪一类违法内容：",{"id":56,"name":"好友助力加速","list":["你可以：",{"id":108,"name":"提交给微信团队审核","proof":0}]},{"id":57,"name":"砍价","list":["你可以：",{"id":108,"name":"提交给微信团队审核","proof":0}]},{"id":58,"name":"任务收集","list":["你可以：",{"id":108,"name":"提交给微信团队审核","proof":0}]},{"id":59,"name":"诱导下载","list":["你可以：",{"id":108,"name":"提交给微信团队审核","proof":0}]}]},{"id":56,"name":"网页包含（虚假/抽奖性质/欺诈）拼团信息","list":["你可以：",{"id":108,"name":"提交给微信团队审核","proof":0}]},{"id":23,"name":"网页包含不适当的内容对我造成骚扰","list":["请选择哪一类违法内容：",{"id":60,"name":"内容低俗/题文不符","list":["你可以：",{"id":108,"name":"提交给微信团队审核","proof":0}]},{"id":61,"name":"骚扰/广告/垃圾信息","list":["你可以：",{"id":108,"name":"提交给微信团队审核","proof":0}]}]},{"id":59,"name":"网页包含有偿投票信息","list":["你可以：",{"id":108,"name":"提交给微信团队审核","proof":0}]},{"id":60,"name":"网页包含隐私泄露风险","list":["请选择哪一类违法内容：",{"id":62,"name":"收集个人隐私信息（如：钓鱼链接）","list":["你可以：",{"id":108,"name":"提交给微信团队审核","proof":0}]},{"id":63,"name":"违规使用用户头像","list":["你可以：",{"id":108,"name":"提交给微信团队审核","proof":0}]},{"id":64,"name":"仿冒微信功能","list":["你可以：",{"id":108,"name":"提交给微信团队审核","proof":0}]}]},{"id":24,"name":"遇到网页流量被劫持怎么办","type":"article","href":"http://mp.weixin.qq.com/s?__biz=MzIzNzAzODg4OA==&mid=401352390&idx=1&sn=49d7f7d99a4944b065ba5cc54b060130#wechat_redirect"}]
     * ret : 0
     */

    private int ret;

    private List<String> list;

    public int getRet() {
        return ret;
    }

    public void setRet(int ret) {
        this.ret = ret;
    }

    public List<String> getList() {
        return list;
    }

    public void setList(List<String> list) {
        this.list = list;
    }


}
