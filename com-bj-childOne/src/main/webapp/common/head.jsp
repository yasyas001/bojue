<%@ page language="java"  import="java.util.*" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
// 取BASE PATH
String _path = request.getContextPath();
String _port = request.getServerPort() == 80 || request.getServerPort() == 443 ? "" : ":" + request.getServerPort();
String _basePath = request.getScheme()+"://"+request.getServerName()+_port+_path;
request.setAttribute("basePath", _basePath);
%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<base href="${basePath }">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="Cache-Control" content="no-store, must-revalidate"> 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- Bootstrap -->
<link href="${basePath }/js/bootstrap-3.3.4/css/bootstrap.min.css" rel="stylesheet">
<script type="text/javascript" src="${basePath }/js/jquery-1.10.2.min.js"></script>
<script src="${basePath }/js/bootstrap-3.3.4/js/bootstrap.min.js"></script>
<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
  <script src="${basePath }/js/bootstrap-3.3.4/html5shiv.min.js"></script>
  <script src="${basePath }/js/bootstrap-3.3.4/respond.min.js"></script>
<![endif]-->