<%@ page import="com.wx.util.WeiXinUtil" %>
<%@ page import="com.wx.common.CommonProperties" %>
<%@ page import="com.wx.util.RandomChar" %>
<%@ page import="com.wx.common.Constant" %>
<%@ page import="com.wx.util.Sign" %>
<%@ page import="java.net.URLEncoder" %>
<%--
  Created by IntelliJ IDEA.
  User: hzj
  Date: 2015/2/14
  Time: 15:57
  To change this template use File | Settings | File Templates.
--%>
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

    String url = CommonProperties.get("domain")+"/firepao/static/sub_1.jsp?name="+ URLEncoder.encode(name, "utf-8")+"&count="+fireCount+"&flag="+flag;
    response.sendRedirect(url);
%>
