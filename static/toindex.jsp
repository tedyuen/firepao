<%@ page import="com.wx.pojo.WeiXinUserInfo" %>
<%@ page import="com.wx.util.WeiXinUtil" %>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.io.UnsupportedEncodingException" %>
<%@ page import="com.wx.common.CommonProperties" %>
<%--
  Created by IntelliJ IDEA.
  User: hzj
  Date: 2015/2/13
  Time: 17:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String code=request.getParameter("code");
    String state=request.getParameter("state");

    WeiXinUserInfo weiXinUserInfo=null;//用户微信 昵称，和头像的src

    if(!"".equals(code)&&code!=null){
        weiXinUserInfo= WeiXinUtil.getUserinfo(code, state);
    }

    if(weiXinUserInfo==null){
        weiXinUserInfo.setNickname("我");
        weiXinUserInfo.setHeadImgUrl("");
    }

    String nickname = weiXinUserInfo.getNickname();
    String headurl = weiXinUserInfo.getHeadImgUrl();

    try{
        nickname = new String(nickname.getBytes("utf-8"),"iso8859-1");
        headurl = URLEncoder.encode(headurl, "utf-8");
    }catch (UnsupportedEncodingException e){
        e.printStackTrace();
        headurl = "";
    }

//    String nickname = "阿斯达";
//    String headurl = "asdassdasda";

    System.out.println(CommonProperties.get("domain")+"/firepao/static/index.jsp?name="+nickname+"&headurl="+headurl);
    response.sendRedirect(CommonProperties.get("domain")+"/firepao/static/index.jsp?name="+nickname+"&headurl="+headurl);
    //return;
%>
