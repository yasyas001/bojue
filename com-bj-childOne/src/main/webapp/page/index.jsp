<%@ page language="java"  import="java.util.*" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%
// 取BASE PATH
String _path = request.getContextPath();
String _port = request.getServerPort() == 80 || request.getServerPort() == 443 ? "" : ":" + request.getServerPort();
String _basePath = request.getScheme()+"://"+request.getServerName()+_port+_path;
request.setAttribute("basePath", _basePath);
%>
<jsp:include page="/common/head.jsp"/>
<title>主页</title>
</head>
<body>
<div id="LG" class="container-fluid">
	<div class="row-fluid">
		<div class="span12">
			<div class="page-header">
				<h1>
					时尚生活<small>走我的路</small>
				</h1>
			</div>
			<ul class="breadcrumb">
				<li>
					<a href="#">主页</a>
				</li>
				<li>
					<a href="#">联系我们</a>
				</li>
				<li class="active">
					<a href="#">招贤纳士</a> 
				</li>
			</ul>
			
			<div class="carousel slide" id="carousel-494835">
				<ol class="carousel-indicators">
					<li data-slide-to="0" data-target="#carousel-494835">
					</li>
					<li data-slide-to="1" data-target="#carousel-494835" class="active">
					</li>
				</ol>
				<div class="carousel-inner">
					<div class="item">
						<img alt="" src="${basePath}/images/1.jpg" />
						<div class="carousel-caption">
							<h4>棒球</h4>
							<p>棒球运动是一种以棒打球为主要特点，集体性、对抗性很强的球类运动项目，在美国、日本尤为盛行。</p>
						</div>
					</div>
					<div class="item active">
						<img alt="" src="${basePath}/images/3.jpg" />
						<div class="carousel-caption">
							<h4>
								自行车
							</h4>
							<p>
								以自行车为工具比赛骑行速度的体育运动。1896年第一届奥林匹克运动会上被列为正式比赛项目。环法赛为最著名的世界自行车锦标赛。
							</p>
						</div>
					</div>
				</div> 
				<a data-slide="prev" href="#carousel-494835" class="left carousel-control">‹</a> 
				<a data-slide="next" href="#carousel-494835" class="right carousel-control">›</a>
			</div>
			
			<div class="row-fluid">
				<div class="col-xs-3 span3">
				</div>
				<div class="col-xs-3 span3">
				</div>
				<div class="col-xs-3 span3">
				</div>
				<div class="col-xs-3 span3">
				</div>
			</div>
		</div>
	</div>
</div>
</body>
<script type="text/javascript" src="${basePath }/js/modernizr/modernizr.min.js"></script>
<script type="text/javascript" src="${basePath }/js/artDialog4.1.6/jquery.artDialog.js?skin=idialog"></script>
<script type="text/javascript" src="${basePath }/js/artDialog4.1.6/plugins/iframeTools.js"></script>
<script type="text/javascript" src="${basePath }/js/jquery.extends.js"></script>
<script type="text/javascript" src="${basePath }/js/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript">
$(function(){
	$('.carousel').carousel({interval: 2000});
});
</script>
</html>