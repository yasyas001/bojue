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
<title>新增附赠政策</title>
</head>

<body>
<div id="base" class="container-fluid">
		<div class="page-header">
			<h1 id="title">新增附赠政策</h1>
		</div>
		
		<p>赠品类型：市场赠品&nbsp; &nbsp; 覆盖客户数刷新时间：&nbsp;<span id="customUpdate"></span></p>
		
		<form action="/gift/GiftAddAction/addGift.action" method="post" enctype="application/x-www-form-urlencoded">
		<div style="padding: 0px 0px 10px;" class="form-inline">
			<div class="input-group">
				<span class="input-group-addon">赠品库存预警下限:</span> 
				<input type="number" class="form-control" name="lowerLimit" placeholder="输入大于零的整数" onblur="lowerMsg()" min="0" value="0"/>
				<input type="hidden" name="warningId"/>
			</div>
			<div class="input-group">
				<span class="input-group-addon">通知邮箱:</span>
				<input type="email" class="form-control" name="emails" placeholder="多个邮箱地址，中间逗号隔开"/>
				<input type="hidden" name="flag"/>
			</div>
		</div>
		
		<!-- 定义活动开始 -->
		<table class="table table-bordered">
		   <caption>定义活动</caption>
		   <thead>
		      <tr class="text-nowrap">
		         <th>活动名称</th>
		         <th>费用承担部门</th>
		         <th>活动生效日期</th>
		         <th>失效日期</th>
				 <th>是否生效</th>
				 <th>更新日期</th>
		         <th>覆盖客户数</th>
		         <th>计划附赠数</th>
		      </tr>
		   </thead>
		   <tbody id="aTable">
		      <tr>
		         <td><input type="text" placeholder="选填" name="name" class="form-control"><input name="id" type="hidden"/></td>
		         <td><input type="text" placeholder="必填" required="required" name="costDeptName" class="form-control"/></td>
		         <td><input type="text" placeholder="yyyy-mm-dd" name="startDateGift" class="form-control" required="required" onfocus="WdatePicker({isShowClear:false,readOnly:true,minDate:'%y-%M-%d'})"/></td>
		         <td><input type="text" placeholder="yyyy-mm-dd" name="endDateGift" class="form-control" required="required" onfocus="WdatePicker({isShowClear:false,readOnly:true,minDate:'%y-%M-%d'})"/></td>
		         <td><input type="checkbox" name="isValid" value="1"/></td>
		         <td><input type="text" readOnly="readonly" name="updateDate" class="form-control"/></td>
		         <td><!-- <label name="coverNum"></label><label name="totalNum"></label> --><input type="text" value="" id="showNum" class="form-control" disabled="disabled"/></td>
		         <td><input type="number" required="required" class="form-control" name="planNum"/></td>
		      </tr>
		   </tbody>
		</table>
		<!-- 定义活动结束 -->
		
		<!-- 定义条件开始 -->
		<img src="${basePath }/images/u54.png" alt="" class="img-rounded">
		<button type="button" class="btn btn-link" onclick="addHtml('factor')">新增条件</button>
		<img src="${basePath }/images/u58.png" alt="" class="img-rounded">
		<button type="button" class="btn btn-link" onclick="del('factor')">删除</button>
		<table class="table table-bordered">
		   <thead>
		      <tr class="text-nowrap">
		         <th></th>
		         <th>附赠条件</th>
		         <th colspan="3">时间跨度</th>
				 <th colspan="4">条件区间（次/￥/天）</th>
		      </tr>
		   </thead>
		   <tbody id="factor">
		   </tbody>
		</table>
		<!-- 定义条件结束 -->
		
		<!-- 定义赠品开始 -->
		<img src="${basePath }/images/u54.png" alt="" class="img-rounded">
		<button type="button" class="btn btn-link" onclick="addHtml('gift')">新增赠品</button>
		<img src="${basePath }/images/u58.png" alt="" class="img-rounded">
		<button type="button" class="btn btn-link" onclick="del('gift')">删除</button>
		<table class="table table-bordered">
		   <thead>
		      <tr class="text-nowrap">
		         <th></th>
		         <th>附赠商品ID</th>
		         <th>附赠商品名称</th>
		         <th>数量</th>
				 <th>库存可卖数</th>
		      </tr>
		   </thead>
		   <tbody id="gift">
		   </tbody>
		</table>
		<!-- 定义赠品结束 -->
		
		
		<button type="button" onclick="isSubmit('0')" class="btn btn-success">预览</button>
		<button type="button" onclick="isSubmit('1')" class="btn btn-primary">提交</button>
		<button type="button" onclick="window.location.href='${basePath}/gift/giftRecordNew.jsp'" class="btn btn-default">关闭</button>
		</form>
</div>
</body>
<script type="text/javascript" src="${basePath }/js/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="${basePath }/js/modernizr/modernizr.min.js"></script>
<script type="text/javascript" src="${basePath }/js/artDialog4.1.6/jquery.artDialog.js?skin=idialog"></script>
<script type="text/javascript" src="${basePath }/js/artDialog4.1.6/plugins/iframeTools.js"></script>
<script type="text/javascript" src="${basePath }/js/jquery.extends.js"></script>
<script type="text/javascript" src="${basePath }/js/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript">
var isPointList = true;
var isPointSuccess = true;
var isClearInput = false;
$(function(){
	$("input[name='endDateGift']").blur(function(){
		if(!checkEndTime($("input[name='startDateGift']").val(),$("input[name='endDateGift']").val())){
			$.tips("失效时间必须晚于生效时间!");
			return false;
		}
	});
	$("input[name='startDateGift']").blur(function(){
		if(!checkEndTime($("input[name='startDateGift']").val(),$("input[name='endDateGift']").val())){
			$.tips("失效时间必须晚于生效时间!");
			return false;
		}
	});
	
	$(document).click(function() {
		//$("#skuNameList").prev().val(null);
		if(($("#skuNameList").html())!=undefined){
			console.log(isClearInput);
			if(isClearInput){
				$("#skuNameList").parent().parent().find("input").each(function(){
					var name = $(this).attr("name");
					if(name!="giftNum"){
						$(this,"[name='"+name+"']").val(null);
					}
				});
			}
			$("#skuNameList").remove();
		}
    });
	
});
function startDateVsEndDate(){
	var flag = true;
	$("#factor input[name='endDate']").each(function(){
		if(!checkEndTime($($($(this).parent().prev().prev()).children('[name="startDate"]')).val(),$(this).val())){
			var a = $(this);
			$.tips("时间跨度：第一时间必须小于等于第二时间",function(){
				$(a).focus().val(null);
			});
			flag=false;
			return flag;
		}
	});
	return flag;
}
function del(id){
	var trsCheck = $("#"+id+" tr input[type='checkbox']:checked");
	var trsNum = $("#" + id + " tr").length;
	var isN = trsNum==trsCheck.length;
	if (trsNum <= 1 || trsCheck.length == 0) {
			return false;
	}

	$(trsCheck).each(function() {//做删除指定数据用
		/*$(this).parent().find("input[name]").each(function(){
			alert($(this).val());
		});*/
		$(this).parent().parent().remove();
	});
	
	if(isN){
		addHtml(id);
	}
}

function addHtml(id){
	var html = id=="factor"
			?
			" <tr>\n" +
			"	 <td><input type=\"checkbox\"><input type=\"hidden\" name=\"conditionId\"></td>\n" +
			"	 <td>\n" +
			"		<select name=\"code\" onchange=\"updateMake(this)\" class=\"form-control\">\n" +
			"			<option value=\"1\">按购物频次</option>\n" +
			"			<option value=\"2\">按购物金额</option>\n" +
			"			<option value=\"3\">按注册天数</option>\n" +
			"			<option value=\"4\">按所购商品</option>\n" +
			"			<option value=\"5\">按未购商品</option>\n" +
			"		</select >\n" +
			"	 </td>\n" +
			"	 <td><input type=\"text\" name=\"startDate\" class=\"form-control\" placeholder=\"yyyy-mm-dd\" required=\"required\" onfocus=\"WdatePicker({isShowClear:false,readOnly:true,maxDate:'%y-%M-{%d-1}'})\"/></td>\n" +
			"	 <td>--</td>\n" +
			"	 <td><input type=\"text\" name=\"endDate\" class=\"form-control\" placeholder=\"yyyy-mm-dd\" required=\"required\" onfocus=\"WdatePicker({isShowClear:false,readOnly:true,maxDate:'%y-%M-{%d-1}'})\"/></td>\n" +
			"	 <td>&ge;<input name=\"lowerRelationSign\" class=\"form-control\" type=\"hidden\" value=\">=\"/></td>\n" +
			"	 <td><input type=\"number\" name=\"lower\" class=\"form-control\" min=\"0\" required=\"required\"/></td>\n" +
			"	 <td>&lt;<input name=\"upperRelationSign\" class=\"form-control\" type=\"hidden\" value=\"<\"/></td>\n" +
			"	 <td><input type=\"number\" name=\"upper\" class=\"form-control\" min=\"0\" required=\"required\"/></td>\n" +
			"</tr>"
			:
			"<tr>\n" +
			"	 <td><input type=\"checkbox\"><input type=\"hidden\" name=\"giftId\"></td>\n" +
			"	 <td><input type=\"text\" placeholder=\"商品id\" class=\"form-control\" name=\"skuId\" required=\"required\" oninput=\"getPointList(this)\"/>"+
			"</td>\n" +
			"	 <td><input type=\"text\" placeholder=\"必填,由商品ID自动补全\" class=\"form-control\" name=\"skuName\" readonly=\"readonly\" required=\"required\"/><input type=\"hidden\" name=\"tempAreaId\"/></td>\n" +
			"	 <td><input type=\"number\" value=\"1\" min=\"1\" class=\"form-control\" name=\"giftNum\" required=\"required\" /></td>\n" +//readonly=\"readonly\"
			"	 <td><input type=\"number\" name=\"stockNum\" class=\"form-control\" required=\"required\" readonly=\"readonly\"/></td>\n" +
			"</tr>";
	$("#"+id).append(html);
}

function getPointList(obj){
	if(isPointList && isPointSuccess){
		isClearInput = true;
		var val = $(obj).val();
		$.log(val);
		var w = $(obj).width();
		if(val!=null && $.trim(val)!=""){
			//随机数，商品编号，列表条数
			$.post('${basePath}/gift/GiftAddAction/querySkuNameList.action',
					{"postTIME":new Date().getMilliseconds(),"skuId":val,"listNum":20},
					function(data){
				//display:none background:blue;<ul class=\"list-group\" style=''></ul>
				/* $("#skuNameList").remove(); */
				var html = "<div id=\"skuNameList\" style=\"width:"+(w+23)+"px;position:absolute;overflow: auto; max-height: 300px;\">";
				var array=data.querySkuNameList;
				if(array!=null && array.length>0){
					 for (var i = 0; i < array.length; i++) {
						html+="<a class=\"list-group-item\" href=\"javascript:void(0)\" onclick=\"resultSkuName(this,"+(array[i].skuCode)+")\">";
						html+=((array[i].skuName)+"["+(array[i].skuCode )+"]"); 
						html+="</a>";
	                }  
					
				}else{
					html+="<p class=\"list-group-item\">没有找到条目！</p>";
				}
				html+="</div>";
				$("#skuNameList").remove();
				$(obj).parent().append(html);
			});
		}else{
			$("#skuNameList").remove();
		}
	}
}
function resultSkuName(obj,skuCode){
	$(obj).parent().prev().val(skuCode);
	isClearInput = false;
	//$(obj).parent().prev().val("698145");
	obj = $(obj).parent().prev();
	$("#skuNameList").css("display","none");
	console.log($("#skuNameList").html());
	getSkuName(obj,1);
}
function updateMake(obj){
	var code = $(obj).val();
	if(code==3 || code==4 || code==5){
		$(obj).parent().parent().find("input").each(function(){
			var name = $(this).attr("name");
			if(name=="startDate" || name=="endDate"){//和 #factor tr一样
				$(this).replaceWith("<input name=\""+name+"\" class=\"form-control\" type=\"text\" value=\"只读\" readonly=\"readonly\" placeholder=\"\">");
			}else if(code!=3 && (name=="lower" || name=="upper")){
				$(this).replaceWith("<input name=\""+name+"\" class=\"form-control\" type=\"text\" value=\"\" placeholder=\""+(name=="lower"?("请输入商品Id"):("请输入商品名称"))+"\""+(name=="lower"?("required=\"required\""):(""))+">");
			}else if(code==3 && (name=="lower" || name=="upper")){
				$(this).replaceWith("<input name=\""+name+"\" class=\"form-control\" type=\"number\" value=\"\" placeholder=\"\" min=\"0\" required=\"required\">");
			}
			
		});
	}else{
		$(obj).parent().parent().find("input").each(function(){
			var name = $(this).attr("name");
			if(name=="startDate" || name=="endDate"){
				$(this).removeAttr("disabled");
				$(this).val(null);
				$(this).attr({required:"required",onfocus:"WdatePicker({isShowClear:false,readOnly:true,maxDate:'%y-%M-{%d-1}'})",placeholder:"yyyy-mm-dd"});
			}else if(name=="lower" || name=="upper"){
				$(this).replaceWith("<input name=\""+name+"\" class=\"form-control\" type=\"number\" value=\"\" placeholder=\"\" min=\"0\" required=\"required\">");
			}
		});
	}
	
}
function checkEndTime(startTime,endTime){
	var start=new Date(startTime.replace("-", "/").replace("-", "/"));
	var end=new Date(endTime.replace("-", "/").replace("-", "/"));
	if(start>end){
	 	return false;
	}
	return true;
}


function isSubmit(flag) {
	var bol = true;
	 $("[required='required']").each(function(){
		var val = $(this).val();
		var min = $(this).attr("min");
		if(val==null || val==""){
			$.tips("必填字段为空或错误！");
			$(this).focus().addClass("inputError").val(null);
			bol= false;
			return bol;
		}else if(min!=null && val<min){
			$.tips("当前文本框数字不能小于"+min);
			$(this).focus().addClass("inputError").val(null);
			bol= false;
			return bol;
		}else{
			$(this).removeClass("inputError");
		}
	});
	if(!bol){
		return false;
	}
	//检查温区
	/* if(bol){
		var tmp = null;
		$("[name='tempAreaId']").each(function(){
			var id = $(this).val();
			if(id!=(tmp==null?tmp=id:tmp)){
				$.tips("赠品温区不一致！");
				$(this).parent().prev().find("input[name='skuId']")[0].focus();
				bol= false;
				return bol;	
			}
		});	
	} */
	bol = infoSkuIsRepeat();
	if(!bol){
		$.tips("赠品有重复，请修改！");
		return bol;
	}
	if(bol){
		if(!checkEndTime($("input[name='startDateGift']").val(),$("input[name='endDateGift']").val())){
			$.tips("失效时间必须晚于生效时间!");
			return false;
		}
		if(!startDateVsEndDate()){
			return false;
		}
		var val = $("input[name='lowerLimit']").val();
		if(val>0){
			var emails = $("input[name='emails']").val();
			
			if(emails==null || emails==''){
				$.tips("请填写预警邮箱！");
				$("input[name='emails']").focus();
				return false;
			}else{
				emails = emails.replace("，",",");
				$("input[name='emails']").val(emails);
				emails = emails.split(",");
				for(i in emails ){
					if(emails[i]==null || emails[i]==''){
						$.tips("请删除首尾处的逗号");
						$("input[name='emails']").focus();
						return false;
					}else if(!(/^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/.test(emails[i]))){
						$.tips("请正确填写预警邮箱！错误邮箱："+emails[i]);
						$("input[name='emails']").focus();
						return false;
					}
				}
			}
		}
			$("input[name='flag']").val(flag);
			//var activityId = $.getUrlParam("activityId");?postTIME="+(new Date().getMilliseconds())+"
			
			$("input[name]").each(function(){
				$(this).val($.trim($(this).val()));
			});
			
			$.ajax({
				url: "<s:url value='/gift/GiftAddAction/addGift.action'/>",
				data:$('form').serialize(),
				type:"POST",
				//async:false,
				beforeSend:function() {
					$.loading();
				},
				success:function(result){
					$.loading().close();
					if(result.successMsg=="null" || result.successMsg==null){
						$.tips("操作成功！",function(){
							if(flag==1){
								window.location.href = "${basePath }/gift/giftRecordNew.jsp";
							}else{
								var activity = result.GIFTACTIVITY;
								$("#showNum").val(((activity.coverNum)+"("+((activity.coverNum/activity.totalNum)*100).toFixed(2)+"%)")).focus();
								$("#showNum").parent().addClass("has-error");
								/* $("input[name='coverNum']").val(activity.coverNum);
								$("input[name='totalNum']").val(activity.totalNum);*/
								$("input[name='updateDate']").val(result.addGiftUpdateTime); 
								/* $("input[name='id']").val(activity.id); */
								$("#customUpdate").html((activity.updateDate).replace("T"," "));
								
							}
						});
					}else{
						$.tips("<div>操作失败！<br>"+result.successMsg+"</div>");
					}
				},
				error:function(){
					$.loading().close();
					$.tips("网络错误，请刷新重试！");
				}
			});
	} 
}
function getSkuName(obj,num){
	isPointList = true;
	if(num==0){
		obj =$(obj).parent().prev();
	}
	var val = $.trim($(obj).val());
	if(!(val>0)){
		$(obj).parent().parent().find("input").each(function(){
			var name = $(this).attr("name");
			if(name!="giftNum"){
				$(this,"[name='"+name+"']").val(null);
			}
		});
		return false;
	}
	$(obj).val(val);
	if(!infoSkuIsRepeat()){
		return false;
		
	}
	 $.ajax({
		url: "${basePath }/gift/GiftAddAction/goSkuName.action",
		data:{"date":new Date().getMilliseconds(),"skuId":val},
		type:"get",
		success:function(result){
			//console.log(result.successMsg+"\n"+result.operationResult);
			if(result.successMsg == "null"  || result.successMsg==null){
				$.tips("根据["+val+"]未找到商品",function(){
					$(obj).focus().val(null);
					$(obj).parent().parent().find("input").each(function(){
						var name = $(this).attr("name");
						if(name!="giftNum"){
							$(this,"[name='"+name+"']").val(null);
						}
					});
					/* $(obj).parent().siblings().find("input").each(function(){
						if(!"giftNum"==($(this).attr("name"))){
							$(this).val(null);
						}
					}); */
				});
				return false;
			}else{
				var successMsg = JSON.parse(result.successMsg);
				$(obj).parent().next().find("input").each(function(){
					var name = $(this).attr("name");
					$(this,"[name='"+name+"']").val(successMsg[name]);
				});
				//可卖数callSell	"{\"cause:\"null\"}"
				try{
					$(obj).parent().parent().removeClass("warning");
					var callSell = JSON.parse(result.callSell);
					if(callSell !=null && callSell[0].stockNum!=null && callSell[0].stockNum>0){
						var lowerLimit = $("input[name='lowerLimit']").val();
						$(obj).parent().siblings('*:last').find("input").each(function(){
							if(callSell[0].stockNum<lowerLimit){
								$(this).parent().parent().addClass("warning");
							}
							$(this,"[name='stockNum']").val(callSell[0].stockNum);
						});
					}else{
						$.msg("商品["+val+"]没有找到库存数据");
						$(obj).parent().siblings('*:last').find("input").each(function(){
							$(this).val(null);
						});
					}
				}catch(e){
					$.log(e);
					$.msg("商品["+(val)+"]获取关联数据失败！",function(){
						$(obj).parent().siblings('*:last').find("input").each(function(){
							$(this).val(null);
						});
					});
				}
			}
			/* $("#skuNameList").remove(); */
		}
		
	}); 
}

function lowerMsg(){
	var val = $("input[name='lowerLimit']").val();
	if(val!=null && val>0){
		val = parseInt(val);
		$("input[name='stockNum']").each(function(){
			if($(this).val()!=null && $(this).val()!="" && $(this).val()<val){
				$(this).parent().parent().addClass("warning");
			}else{
				$(this).parent().parent().removeClass("warning");
			}
		});
	}
	
}
function initHtml(factor,gift){
	for(i=0;i<factor;i++){
		addHtml("factor");
	}
	for(i=0;i<gift;i++){
		addHtml("gift");
	}
	return true;
}

$(function() {
	var activityId = $.getUrlParam("activityId");
	if(activityId!=null && activityId!=''){
	$.get("${basePath}/gift/GiftAddAction/queryGiftActivityEdit.action?activityId="+(activityId)+"&data="+new Date().getMilliseconds(),function(data){
		try{
				
			//var success = false;
			//var errorMsg = null;
			if(data==null  || data.operationResult!="success" || data.successMsg==null){
				$.tips("获取数据失败，准备跳转首页！",function(){
					window.location.href = "${basePath }/gift/giftRecordNew.jsp";
				});
			}
			$("#title").html("编辑附赠政策");
			$("title").html("编辑附赠政策");
			var obj = data.successMsg;
			$("#aTable input").each(function(){
				var name = $(this).attr("name");
				if(name=="startDateGift" || name=="endDateGift"){
					$(this).val(obj[name.replace("Gift","")].substring(0,10));
				}else if(name=="isValid"){
					$(this).attr("checked",obj[name]==1?true:false);
				}else if(name=="updateDate"){
					$(this).val(obj[name].replace("T"," "));//数据提交时间
					if(obj.createDate!=null){
						$("#customUpdate").html(obj.createDate.replace("T"," "));//客户刷新时间
					}
				}else if(name!=null){
					$(this).val(obj[name]);
				}
			});
			$("#showNum").val(((obj.coverNum)+"("+((obj.coverNum/obj.totalNum)*100).toFixed(2)+"%)"));
			$("input[name='lowerLimit']").val(obj.giftStockWarning.lowerLimit);
			$("input[name='emails']").val(obj.giftStockWarning.emails);
			$("input[name='warningId']").val(obj.giftStockWarning.warningId);
			
			var giftConditions = obj.giftConditions;
			var giftinfos = obj.giftinfos;
			
			if(initHtml(giftConditions.length,giftinfos.length)){
			isPointList = false;
			isPointSuccess = false;
			$("#factor tr").each(function(i){
				$(this).find("[name]").each(function(){
					var name = $(this).attr("name");
					var code = giftConditions[i].code;
					if((code==3|| code==4 || code==5) && ((name=='startDate' || name=='endDate') || (name=="lower" || name=="upper"))){//此处替换和updateMake方法里面一样
						if(name=='startDate' || name=='endDate'){
							$(this).replaceWith("<input name=\""+name+"\" class=\"form-control\" type=\"text\" value=\"只读\" readonly=\"readonly\">");
						}else if(code!=3 && (name=="lower" || name=="upper")){
							$(this).removeAttr(name=="upper"?"required":"").removeAttr("min").attr({placeholder:(name=="lower"?("请输入商品Id(必填)"):("请输入商品名称")),type:"text"});
						}/* else if(code==3 && (name=="lower" || name=="upper")){
							$(this).replaceWith("<input name=\""+name+"\" class=\"form-control\" type=\"text\" value=\"\" min=\"0\" required=\"required\">");
						} */
					}
						var val = giftConditions[i][name];
						if(val!=null){
							$(this).val((name=='startDate'|| name=='endDate')?val.substring(0,10):val);
						}
				});
				
			});
			$("#gift tr").each(function(i){
				$(this).find("[name]").each(function(){
					var name = $(this).attr("name");
					if("skuId"==name || "skuName"==name || "giftNum"==name || "giftId"==name){
						//console.log("name:"+name+"__i:"+i%3+"____zhi:"+giftinfos[i][name]);
						$(this).val(giftinfos[i][name]);
					}
				});
			});
			$("input[name='skuId']").each(function(){
				getSkuName(this,1);
			});
			setTimeout("isPointSuccess = true", 3000 )
			}
		}catch(e){
			$.log(e);
			$.tips("解析活动数据失败，页面将返回首页<br>请联系管理员，错误信息："+e.message,function(){
				//window.location.reload();
				history.go(-1);
			});
		}/* finally{
			if(!success){
				
			}
		}  */
	 });
	}else{
		initHtml(1,1);
	}
});
function infoSkuIsRepeat(){
	/* $("#skuNameList").remove(); */
	var a = new Object;
	var flag = true;
	$("input[name='skuId']").each(function(){
		var val = $(this).val();
		if(val!=null && val!="" && val>0){
			if(a[val]==val){
				flag = false;
				//$(this).focus();
				var obj = $(this);
				$.tips("赠品有重复，请重新填写！",function(){
					/* $(obj).parent().parent().find("input").each(function(){
						var name = $(this).attr("name");
						if(name!="giftNum"){
							$(this,"[name='"+name+"']").val(null);
						}
					}); */
				});
				
				return flag;
			}
			a[val] = val;
		}
	});
	return flag;
}
</script>
</html>