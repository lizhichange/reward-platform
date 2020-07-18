# 微信域名拦截检测

前一阵公司经历了几次域名被微信封禁，情况比较被动都是用户反馈后我们才知道的。为了能及时发现微信拦截并作出相应措施，于是提出对相关域名的可用性进行检查，一旦出现问题及时解决。
网上很多网站提供类似的付费服务，但是价格不菲。于是自己研究了一下相关原理，然后基于springboot 2.3实现了一个简单的微信域名拦截检测服务，希望有相同需求的朋友可以参考。

### 实现原理
通过微信公众号开放平台提供的【长链接转成短链接】接口，把我们的链接转成微信自己的链接，当我们访问这个短连接时首先会经过微信服务器，这时微信会对该链接进行有效性检查，如果正常就放行，否则会重定向跳转到这个链接 https://weixin110.qq.com/cgi-bin/mmspamsupport-bin/newredirectconfirmcgi?main_type=2&evil_type=20&source=2&url=http%3A%2F%www.baidu.com#wechat_redirect。
这样我们可以判断短链接的重定向链接即可得知是否被封禁。如果重定向后的连接与我们检测的连接域名一致则说明地址正常，如果不一致则则说明被微信服务器拦截。

### 技术框架

+ springboot 系统框架
+ httpclient http客户端
+ commons-lang3 apche工具类
+ hutool 适合国人的工具集合
+ jsoup html解析工具

### 使用说明

1. 下载本项目到本地，然后导入到IDE中
2. 修改application.yml中wx.appid和wx.secret为你自己的公众号appid和secret，如果没有公众号可以使用[微信公众平台测试账号](http://mp.weixin.qq.com/debug/cgi-bin/sandbox?t=sandbox/login) ，只要有微信号就可以直接体验和测试公众平台所有高级接口功能。
3. 启动项目后访问 http://localhost:8080/wx_url_check/check?url=要检测的连接
4. 响应报文说明
    - 正常情况：{"code": "00","msg": "访问正常"} 
    - 被拦截：{"code": "01","msg": "已停止访问该网页","desc": "网页包含诱导分享、关注等诱导行为内容，被多人投诉，为维护绿色上网环境，已停止访问。"}
    - 系统错误：{"code": "99","msg": "invalid appid"}
