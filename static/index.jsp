<%@ page import="com.wx.pojo.WeiXinUserInfo" %>
<%@ page import="com.wx.util.WeiXinUtil" %>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.io.UnsupportedEncodingException" %>
<%@ page import="com.wx.common.CommonProperties" %>
<%@ page import="java.net.URLDecoder" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
//    String path = request.getContextPath();
//    String name = "XYT";
//
//    String code=request.getParameter("code");
//    String state=request.getParameter("state");
//
//    WeiXinUserInfo weiXinUserInfo=null;//用户微信 昵称，和头像的src
//
//    if(!"".equals(code)&&code!=null){
//        weiXinUserInfo= WeiXinUtil.getUserinfo(code,state);
//    }
//
//    if(weiXinUserInfo==null){
//        weiXinUserInfo.setNickname("我");
//        weiXinUserInfo.setHeadImgUrl("");
//    }
//
//    String nickname = weiXinUserInfo.getNickname();
//    String headurl = weiXinUserInfo.getHeadImgUrl();
//
//    try{
//        headurl = URLEncoder.encode(headurl,"utf-8");
//    }catch (UnsupportedEncodingException e){
//        e.printStackTrace();
//        headurl = "";
//    }
    String nickname = request.getParameter("name");
    System.out.println("nickname 11111 : "+nickname);
    if(nickname == null || nickname.trim().length() == 0){
        nickname = "我";
    }else{
        nickname = new String(nickname.getBytes("iso8859-1"),"utf-8");
    }
    System.out.println("nickname 22222 : "+nickname);

    String headurl = request.getParameter("headurl");
    if(headurl == null || headurl.trim().length() == 0){
        headurl = "";
    }
    try{
        headurl = URLEncoder.encode(headurl, "utf-8");
    }catch (UnsupportedEncodingException e){
        e.printStackTrace();
        headurl = "";
    }

    String name = URLEncoder.encode(nickname,"utf-8");
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
        <div class="back-bottom-2"></div>
        <div class="back-bottom-3"></div>
        <div class="back-bottom-4"></div>
        <img src="images/glim_img.png" width="40px" class="back-top">
        <img src="images/background_down_00.png" width="200px" class="back-bottom-00">
        <img id="anim-id" src="images/background_top_00.png" width="140px" class="back-top-00">

        <div id="btn-1" style="top:40%;">
        </div>
        <div id="btn-2" style="top:50%;">
        </div>
        <div id="bottom-text" class="bottom-text text-color2 font12">上海市消防局</div>

    </div>

    <div id="index-21" class="index">
        <div class="back-bottom-2"></div>
        <div class="back-bottom-3"></div>
        <div class="back-bottom-4"></div>
        <img src="images/glim_img.png" width="40px" class="back-top">
        <img src="images/background_down_00.png" width="200px" class="back-bottom-00">
        <img src="images/background_top_00.png" width="140px" class="back-top-00">
        <div class="wish-text text-color4">快来选一个羊年愿望</div>
        <div class="wish-frame">
            <img alt="1" src="images/icon_money_1.png" width="90px" class="wish-icon">
            <img alt="2" src="images/icon_money_2.png" width="90px" class="wish-icon">
            <img alt="3" src="images/icon_money_3.png" width="90px" class="wish-icon">
            <img alt="4" src="images/icon_money_4.png" width="90px" class="wish-icon">
        </div>
    </div>

    <div id="index-11" class="index">
        <div class="back-bottom-1"></div>
        <div class="back-bottom-3"></div>

        <img src="images/glim_img.png" width="40px" class="back-top">
        <!--<img id="fire-img" src="images/background_down_11.png" width="330px" class="back-bottom-11">-->
        <img id="click-next" src="images/background_top_14.png" width="140px" class="back-top-00">

        <div id="middle" class="middle text-color1">
            <div id="fire-count" class="fire-count font34">0</div>
            <div id="time-count" class="time-count font28">3</div>
        </div>
        <div id="fire-img" class="fire-img"></div>
        <div id="click-div">

        </div>
        <audio id="myaudio2" src="mpt/3.mp3" loop="true" hidden="true"/>

    </div>

</div>
</body>
<script src='../assets/js/sea.js'></script>
<script src='../assets/js/jquery/jquery-1.9.1.min.js'></script>
<script src="../assets/js/jquery/jquery-ui-1.10.3.min.js"></script>
<script src="../assets/js/jquery/jquery.fullPage.min.js"></script>
<script src='../assets/js/backbone/underscore.js'></script>
<script src='../assets/js/backbone/backbone.js'></script>
<script src='../assets/js/backbone/backbone-localstorage.js'></script>
<script src="../assets/js/animo.js"></script>
<script type="text/javascript">
    var isDebug = false;//测试用
    <%--var url = "<%=path%>";--%>
    var headurl = '<%=headurl%>';
    var url = '<%=CommonProperties.get("domain")%>';
    var name = '<%=name%>';
    var mpt = document.getElementById('myaudio2');
    document.addEventListener('DOMContentLoaded', function() {
        $(document).ready(function() {
            seajs.use('./js/app');

//            $('#container').fullpage();
        });
    }, false);
</script>
</html>