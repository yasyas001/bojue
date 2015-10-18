<%@ page language="java"  import="java.util.*" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%
// 取BASE PATH
String _path = request.getContextPath();
String _port = request.getServerPort() == 80 || request.getServerPort() == 443 ? "" : ":" + request.getServerPort();
String _basePath = request.getScheme()+"://"+request.getServerName()+_port+_path;
request.setAttribute("basePath", _basePath);
%>
<jsp:include page="/common/head.jsp"/>
<title>诚信鞋业</title>
</head>
<body>
<div class="container-fluid">
	<div class="row-fluid">
		<div class="span12">
		<div class="page-header">
				<h1>
					时尚生活<small>走自己的路</small>
				</h1>
			</div>
			<div class="navbar">
				<div class="navbar-inner">
					<div class="container-fluid">
						 <a data-target=".navbar-responsive-collapse" data-toggle="collapse" class="btn btn-navbar"><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></a> <a href="#" class="brand">诚信鞋业</a>
						<div class="nav-collapse collapse navbar-responsive-collapse">
							<ul class="nav">
								<li class="active">
									<a href="#">主页</a>
								</li>
								<li>
									<a href="#">联系我们</a>
								</li>
								<li>
									<a href="#">招贤纳士</a>
								</li>
								<li class="dropdown">
									 <a data-toggle="dropdown" class="dropdown-toggle" href="#">下拉菜单<strong class="caret"></strong></a>
									<ul class="dropdown-menu">
										<li>
											<a href="#">商品分类</a>
										</li>
										<li>
											<a href="#">下拉导航2</a>
										</li>
										<li>
											<a href="#">其他</a>
										</li>
										<li class="divider">
										</li>
										<li class="nav-header">
											标签
										</li>
										<li>
											<a href="#">链接1</a>
										</li>
										<li>
											<a href="#">链接2</a>
										</li>
									</ul>
								</li>
							</ul>
							<ul class="nav pull-right">
								<li>
								<c:if test="${sessionScope.loginName==null }">
									<a href="javascript:void(0)"  data-toggle="modal" data-target="#myModal">登陆</a>
								</c:if>
								</li>
								<li class="divider-vertical">
								</li>
								<li class="dropdown">
									 <a data-toggle="dropdown" class="dropdown-toggle" href="#">欢迎您${sessionScope.loginName }!<strong class="caret"></strong></a>
									<ul class="dropdown-menu">
										<li>
											<a href="#">导入商品</a>
										</li>
										<li>
											<a href="#">进入后台管理系统</a>
										</li>
										<li>
											<a href="#">其他</a>
										</li>
										<li class="divider">
										</li>
										<li>
											<a href="#">退出</a>
										</li>
									</ul>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</div>

			<div class="carousel slide" id="carousel-350899">
				<ol class="carousel-indicators">
					<li class="active" data-slide-to="0"
						data-target="#carousel-350899"></li>
					<li data-slide-to="1" data-target="#carousel-350899"></li>
					<li data-slide-to="2" data-target="#carousel-350899"></li>
				</ol>
				<div class="carousel-inner">
					<div class="item active">
						<img alt="" src="${basePath}/images/1.jpg" />
						<div class="carousel-caption">
							<h4>棒球</h4>
							<p>棒球运动是一种以棒打球为主要特点，集体性、对抗性很强的球类运动项目，在美国、日本尤为盛行。</p>
						</div>
					</div>
					<div class="item">
						<img alt="" src="${basePath}/images/3.jpg" />
						<div class="carousel-caption">
							<h4>冲浪</h4>
							<p>
								冲浪是以海浪为动力，利用自身的高超技巧和平衡能力，搏击海浪的一项运动。运动员站立在冲浪板上，或利用腹板、跪板、充气的橡皮垫、划艇、皮艇等驾驭海浪的一项水上运动。
							</p>
						</div>
					</div>
					<div class="item">
						<img alt="" src="${basePath}/images/3.jpg" />
						<div class="carousel-caption">
							<h4>自行车</h4>
							<p>
								以自行车为工具比赛骑行速度的体育运动。1896年第一届奥林匹克运动会上被列为正式比赛项目。环法赛为最著名的世界自行车锦标赛。
							</p>
						</div>
					</div>
				</div>
				<a data-slide="prev" href="#carousel-350899"
					class="left carousel-control">‹</a> <a data-slide="next"
					href="#carousel-350899" class="right carousel-control">›</a>
			</div>
			<div class="row-fluid">
				<div class="span12">
				
				<ul id="myTab" class="nav nav-tabs">
				 <c:forEach items="${types }" var="row" varStatus="vs">
				 
				   <li style="border-right: solid 1px #ccc;border-radius:0.2em;">
					   <div class="btn-group">
					   <c:if test="${queryMap.parentType==row.type }">
						   <button type="button" class="btn btn-link active" onclick="queryTable(${row.type},null)">${row.typeName }</button>
					   </c:if>
					   <c:if test="${queryMap.parentType!=row.type }">
						   <button type="button" class="btn btn-link" onclick="queryTable(${row.type},null)">${row.typeName }</button>
					   </c:if>
						   <button type="button" class="btn btn-link dropdown-toggle" data-toggle="dropdown">
						      <span class="caret"></span>
						   </button>
						   <ul class="dropdown-menu" role="menu">
						   	<c:if test="${row.nextClasss!=null }">
						     <c:forEach items="${row.nextClasss }" var="next">
						       	<li id="next_${next.type }"><a href="javascript:void(0)" onclick="queryTable(${row.type},${next.type })">${next.typeName }</a></li>
						     </c:forEach>
						     </c:if>
						   </ul>
						</div>
				   </li>
				 </c:forEach>
				   
				</ul>
				
				
		<div id="myTabContent" class="tab-content">
				<table class="table table-bordered table-condensed">
			<c:if test="${fn:length(page.row)>0 }">
			<c:forEach items="${page.row }" var="row" varStatus="vs">
				<c:if test="${vs.index%4==0 }">
				<tr>
				</c:if>
					<td id="img_${row.id }">
						<img alt="" src="${basePath}${row.imgUrls[0].imgUrl}" style="max-height: 500px;max-width: 300px;"/>
						<div style="text-align: center;">${row.shoesName }(${row.typeName })</div>
					</td>
					<c:if test="${fn:length(page.row)==vs.index+1 && vs.index%4!=3 }">
					  <c:forEach items="${page.row }" begin="0" step="1" end="${3-vs.index%4 }">
					 	<td>
						</td>
					  </c:forEach>
					</c:if>
				<c:if test="${vs.index%4==3 || fn:length(page.row)==vs.index+1 }">
				</tr>
				</c:if>
			</c:forEach>
			</c:if>
			<c:if test="${page.row==null || fn:length(page.row)==0 }">
			<tr>
			<td>
			<p>
				该分类没有商品！
			</p>
			</td>
			</tr>
			</c:if>
				</table>
				<ul class="pager">
					<li>
						<a href="javascript:void(0)" onclick="setPageNum(${page.pagenum-1<1?1:page.pagenum-1})">上一页</a>
					</li>
					<c:forEach begin="${page.starPage}" end="${page.endPage}" var="num">
			    		<li><a href="javascript:void(0)" onclick="setPageNum('${num}')" <c:if test="${page.pagenum==num }">style="background:#ddd"</c:if>>${num }</a></li>
			    	</c:forEach>
					<li>
						<a href="javascript:void(0)" onclick="setPageNum(${page.pagenum+1<1?1:page.pagenum+1})">下一页</a>
					</li>
				</ul>
				</div>
				</div>
			</div>
		</div>
		<div class="row-fluid">
			<div class="span12">
			<div style="text-align: center;margin-top: 20px;margin-bottom: 10px;">
			 Copyright &copy; 2013-2015 
			<strong><a target="_blank" href="${basePath}">诚信鞋业</a></strong>&nbsp; 
			<%-- <strong><a target="_blank" href="/">${basePath}</a></strong> --%> 
			All Rights Reserved. 备案号：闽ICP备12019840号-5 
			</div>
			</div>
		</div>
	</div>
</div>
<!-- 模态框（Modal） -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" 
   aria-labelledby="myModalLabel" aria-hidden="true">
   <div class="modal-dialog">
      <div class="modal-content">
         <div class="modal-header">
            <button type="button" class="close" 
               data-dismiss="modal" aria-hidden="true">
                  &times;
            </button>
            <h4 class="modal-title" id="myModalLabel">
              登陆
            </h4>
         </div>
         <div class="modal-body">
          <form>
				<fieldset>
					 <label>用户名</label>
					 <input type="text" required="required" id="userName" name="user.userName"/> 
					 <label>密码</label>
					 <input type="text" required="required" id="password" name="user.password"/> 
					 <label>效验码</label>
					 <input type="text" placeholder="联系管理员获取" required="required" id="valid" name="user.valid"/> 
				</fieldset>
			</form>
         </div>
         <div class="modal-footer">
            <button type="button" class="btn btn-default" 
               data-dismiss="modal">关闭
            </button>
            <button type="button" class="btn btn-primary" onclick="submitForm(this)">
                                         登录
            </button>
         </div>
      </div><!-- /.modal-content -->
</div><!-- /.modal -->
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
	var t = '${type}';
	$("#next_"+t).addClass("active");
});
function queryTable(parentType,type){
	window.location.href="${pageContext.request.contextPath}${page.url}?parentType="+parentType+"&type="+type;
}

function submitForm(obj){
	if($(obj).attr("disabled")!=null){
		return;
	}
	var valid = $.trim($("#valid").val());
	var userName = $.trim($("#userName").val());
	var password = $.trim($("#password").val());
	if(isNuLL(valid)  || isNuLL(userName) || isNuLL(password)){
		$.alert("登录信息填写不完整！");
	}else{
		$(obj).attr({"disabled":"disabled"});
		$.ajax({
			url:"${basePath}/cxxy/IndexAction/login.action",
			type:"post",
			data:$("form").serialize(),
			success:function(data){
				if(data.loginMsg=='-2'){
					$.alert("登录信息不能为空");
				}else if(data.loginMsg=='-1'){
					$.alert("没有该用户或密码错误");
				}else if(data.loginMsg=='1'){
					$.alert("效验码不正确");
				}else if(data.loginMsg=='2'){
					$.alert("用户名不能为空");
				}else if(data.loginMsg=='3'){
					$.alert("密码不能为空");
				}else if(data.loginMsg=='0'){
					window.location.href = window.location.href;
				}
				$(obj).removeAttr("disabled");
			},
			error:function(){
				$.alert("登录出错，刷新页面后再操作！",function(){
					window.location.href = "${basePath}";
				});
				$(obj).removeAttr("disabled");
			}
		});
	}
	
}
function isNuLL(val){
	return val==null || val=='';
}
function setPageNum(value){
	if(${fn:length(page.row)>0}){
		window.location.href="${pageContext.request.contextPath}${page.url}?page.pagenum="+value+"&parentType=${parentType}&type=${type==null?'':type}";
	}
}
</script>
</html>