<%@ page import="java.io.UnsupportedEncodingException" %>
<%@ page import="com.wx.common.CommonProperties" %>
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
    String type = request.getParameter("type");
    String name = request.getParameter("name");
    String flag = request.getParameter("flag");
    String headurl = request.getParameter("headurl");

    if(name == null || name.trim().length() == 0){
        name = "我";
    }else{
        try{
            name = new String(name.getBytes("iso8859-1"),"utf-8");
        }catch (UnsupportedEncodingException e){
            e.printStackTrace();
            name = "";
        }
    }

    if(headurl == null || headurl.trim().length() == 0){
        headurl = "";
    }else{
        try{
            headurl = new String(headurl.getBytes("iso8859-1"),"utf-8");
        }catch (UnsupportedEncodingException e){
            e.printStackTrace();
            headurl = "";
        }
    }

    String url = CommonProperties.get("domain")+"/firepao/static/sub_2.jsp?name="+ URLEncoder.encode(name, "utf-8")+"&flag="+flag+"&type="+type+"&headurl="+URLEncoder.encode(headurl, "utf-8");
    response.sendRedirect(url);
%>
