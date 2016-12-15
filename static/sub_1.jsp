<%@ page import="com.wx.util.WeiXinUtil" %>
<%@ page import="com.wx.common.CommonProperties" %>
<%@ page import="com.wx.util.RandomChar" %>
<%@ page import="com.wx.util.Sign" %>
<%@ page import="com.wx.common.Constant" %>
<%@ page import="java.net.URLEncoder" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String fireCount = request.getParameter("count");
    String name = request.getParameter("name");
    String flag = request.getParameter("flag");

    if(name == null || name.trim().length() == 0){
        name = "";
    }else{
        name = new String(name.getBytes("iso8859-1"),"utf-8");
    }

    if(flag == null || flag.trim().length() == 0){
        flag = "";
    }

    WeiXinUtil.validateWeiXin();
    long times = System.currentTimeMillis()/1000;
    String tourl = CommonProperties.get("domain")+"/firepao/static/sub_1.jsp?name="+URLEncoder.encode(name,"utf-8")+"&count="+fireCount+"&flag="+flag;
    String url = CommonProperties.get("domain")+"/firepao/static/tosub_1.jsp?name="+URLEncoder.encode(name,"utf-8")+"&count="+fireCount+"&flag=";
    String nonce_str = RandomChar.getChars(RandomChar.RANDOM_ALL, 16);
    String sign = Sign.sign(Constant.jsapi_ticket, tourl, nonce_str, times);
    String appId = Constant.WeiXin.AppID;
%>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>上海消防</title>
    <meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1, user-scalable=no">
    <link href="css/main.css" rel="stylesheet" />
    <link href="../assets/css/jquery/jquery.fullPage.css" rel="stylesheet" />
    <link href="../assets/css/animate+animo.css" rel="stylesheet" />
</head>
<body>
<div id="container">
    <div id="index" class="index">
        <div class="back-bottom-1"></div>
        <div class="back-bottom-3"></div>
        <img src="images/glim_img.png" width="40px" class="back-top">
        <div class="back-bottom-15"></div>
        <div class="back-top-15"></div>
        <div class="sub-1-text text-color3 font20"><%=name%>点了<%=fireCount%>炮</div>
        <%if("1".equals(flag)){%>
        <div class="share-div">
            <img src="images/text_green_share.png" height="22px">
        </div>
        <%}else{%>
        <div class="enter-div">
            <img src="images/icon_enter_btn2.png" height="22px">
        </div>
        <%}%>
    </div>
</div>
<div class="share-mask">
    <img class="img-1" src="images/text_share.png" width="250px">
</div>
</body>
<%--<script src='../assets/js/sea.js'></script>--%>
<script src='../assets/js/jquery/jquery-1.9.1.min.js'></script>
<script src="../assets/js/jquery/jquery-ui-1.10.3.min.js"></script>
<script src="../assets/js/jquery/jquery.fullPage.min.js"></script>
<script src='../assets/js/backbone/underscore.js'></script>
<script src='../assets/js/backbone/backbone.js'></script>
<script src='../assets/js/backbone/backbone-localstorage.js'></script>
<script src="../assets/js/animo.js"></script>
<script src='http://res.wx.qq.com/open/js/jweixin-1.0.0.js'></script>
<script type="text/javascript">

    var descText = "羊年春节我来拜年，掌上鞭炮一起PK。20秒你能放多少？";
    var descTitle = "<%=name%>来拜年，安全点炮<%=fireCount%>响，快来PK！";

    //alert("appId : <%=appId%> ; timestamp : <%=times%> ; nonceStr : <%=nonce_str%> ; signature : <%=sign%>");
    wx.config({
        debug: false, // 开启调试模式,调用的所有api的返回值会在客户端alert出来，若要查看传入的参数，可以在pc端打开，参数信息会通过log打出，仅在pc端时才会打印。
        appId: '<%=appId%>', // 必填，公众号的唯一标识
        timestamp: <%=times%>, // 必填，生成签名的时间戳
        nonceStr: '<%=nonce_str%>', // 必填，生成签名的随机串
        signature: '<%=sign%>',// 必填，签名，见附录1
        jsApiList: [
            'onMenuShareTimeline',
            'onMenuShareAppMessage',
            'onMenuShareQQ',
            'onMenuShareWeibo'
        ] // 必填，需要使用的JS接口列表，所有JS接口列表见附录2
    });

    wx.ready(function(){
        //alert("ready");
        // config信息验证后会执行ready方法，所有接口调用都必须在config接口获得结果之后，config是一个客户端的异步操作，所以如果需要在页面加载时就调用相关接口，则须把相关接口放在ready函数中调用来确保正确执行。对于用户触发时才调用的接口，则可以直接调用，不需要放在ready函数中。
        //朋友圈
        wx.onMenuShareTimeline({
            // 分享标题
            title: descTitle,
            // 分享链接
            link: '<%=url%>',
            // 分享图标
            imgUrl: '<%=CommonProperties.get("domain")%>/firepao/static/images/share_out_icon.png',
            success: function () {
                // 用户确认分享后执行的回调函数
            },
            cancel: function () {
                // 用户取消分享后执行的回调函数
            }
        });

        //朋友
        wx.onMenuShareAppMessage({
            // 分享标题
            title: descTitle,
            // 分享描述
            desc: descText,
            // 分享链接
            link: '<%=url%>',
            // 分享图标
            imgUrl: '<%=CommonProperties.get("domain")%>/firepao/static/images/share_out_icon.png',
            type: '', // 分享类型,music、video或link，不填默认为link
            dataUrl: '', // 如果type是music或video，则要提供数据链接，默认为空
            success: function () {
                // 用户确认分享后执行的回调函数
            },
            cancel: function () {
                // 用户取消分享后执行的回调函数
            }
        });

        //QQ
        wx.onMenuShareQQ({
            // 分享标题
            title: descTitle,
            // 分享描述
            desc: descText,
            // 分享链接
            link: '<%=url%>',
            // 分享图标
            imgUrl: '<%=CommonProperties.get("domain")%>/firepao/static/images/share_out_icon.png',
            success: function () {
                // 用户确认分享后执行的回调函数
            },
            cancel: function () {
                // 用户取消分享后执行的回调函数
            }
        });

        //腾讯微博
        wx.onMenuShareWeibo({
            // 分享标题
            title: descTitle,
            // 分享描述
            desc: descText,
            // 分享链接
            link: '<%=url%>',
            // 分享图标
            imgUrl: '<%=CommonProperties.get("domain")%>/firepao/static/images/share_out_icon.png',
            success: function () {
                // 用户确认分享后执行的回调函数
            },
            cancel: function () {
                // 用户取消分享后执行的回调函数
            }
        });
    });

    wx.error(function(res){
        //alert(res.errMsg);
        // config信息验证失败会执行error函数，如签名过期导致验证失败，具体错误信息可以打开config的debug模式查看，也可以在返回的res参数中查看，对于SPA可以在这里更新签名。
    });
</script>
<script type="text/javascript">
    var isDebug = false;//测试用

    document.addEventListener('DOMContentLoaded', function() {
        $(document).ready(function() {
            $('.share-div').bind("click",function(){
                $('.share-mask').fadeIn(300);
            });
            $('.enter-div').bind("click",function(){
                location.href = "https://open.weixin.qq.com/connect/oauth2/authorize?appid=wx8cd744689c972ba4&redirect_uri=http%3A%2F%2Fwww.dovecar.com.cn%2Ffirepao%2Fstatic%2Ftoindex.jsp&response_type=code&scope=snsapi_userinfo&state=state#wechat_redirect";
            });
            <%if(!"1".equals(flag)){%>
                $('.back-top-15').bind("click",function(){
                    location.href = "https://open.weixin.qq.com/connect/oauth2/authorize?appid=wx8cd744689c972ba4&redirect_uri=http%3A%2F%2Fwww.dovecar.com.cn%2Ffirepao%2Fstatic%2Ftoindex.jsp&response_type=code&scope=snsapi_userinfo&state=state#wechat_redirect";
                });
            <%}%>

            $('.share-mask').bind("click",function(){
                $('.share-mask').fadeOut(300);
            });
        });
    }, false);
</script>
</html>