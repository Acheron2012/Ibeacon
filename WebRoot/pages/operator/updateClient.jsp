<%@ page language="java" contentType="text/html"
	import="java.util.*,com.ictwsn.bean.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	//获取当前角色的权限信息
	RoleBean rb = null;
	if ((RoleBean) session.getAttribute("RoleBean") != null) {
		rb = (RoleBean) session.getAttribute("RoleBean");
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link rel="Bookmark" href="/favicon.ico" >
<link rel="Shortcut Icon" href="/favicon.ico" />

<link rel="stylesheet" href="css/pintuer.css">
<link rel="stylesheet" href="css/admin.css">

<link rel="stylesheet" type="text/css" href="static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="lib/Hui-iconfont/1.0.8/iconfont.css" />

<link rel="stylesheet" type="text/css" href="static/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/css/style.css" />

<link href="lib/webuploader/0.1.5/webuploader.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div class="page-container">
	<div class="row cl" style="margin-top: -20px;margin-left: -220px;">
			<label class="bread"><a href="searchClient.do?userId=<%=rb.getUserId()%>&page=1&roleName=<%=rb.getRoleName()%>" style="text-decoration: none;"><<返回</a></label>
	  </div>
	<form action="" method="post" class="form form-horizontal" id="form-article-add">
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>用户名称：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input w50" value="${cb.name}" readonly="readonly" maxlength='20' placeholder="请输入用户名称(必填)" id="clientName" name="clientName">
				<span id="name_notice" class="c-red"></span>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>用户密码：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="password" class="input w50" value="${cb.password}" maxlength='20' placeholder="请输入用户密码(必填)" id="clientPassword" name="clientPassword">
				<span id="password_notice" class="c-red"></span>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>确认密码：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="password" class="input w50" value="${cb.password}" maxlength='20' placeholder="请再次输入密码(必填)" id="clientPassword_confirm" name="clientPassword_confirm">
				<span id="password_confirm_notice" class="c-red"></span>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red"></span>联系电话：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input w50" value="${cb.phone}" maxlength='13' placeholder="请输入用户电话" id="clientPhone" name="clientPhone">
				<span id="phone_notice" class="c-red"></span>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red"></span>用户邮箱：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input w50" value="${cb.email}" maxlength='50' placeholder="请输入用户邮箱" id="clientEmail" name="clientEmail">
				<span id="email_notice" class="c-red"></span>
			</div>
		</div>
		<input type="hidden" value="3" id="roleId" name="roleId">
		<input type="hidden" value="${cb.operatorId}" id="operatorId" name="operatorId">
		<input type="hidden" value="${cb.id}" id="clientId" name="clientId"> 
		<div class="row cl">
			<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-2">
				<button onClick="updateClient();" class="btn btn-primary radius" type="button"><i class="Hui-iconfont">&#xe632;</i>确认修改</button>
				<button class="btn btn-default radius" type="reset">&nbsp;&nbsp;重置&nbsp;&nbsp;</button>
			</div>
		</div>
	</form>
</div>

<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="static/h-ui/js/H-ui.min.js"></script> 
<script type="text/javascript" src="static/h-ui.admin/js/H-ui.admin.js"></script> 
<script type="text/javascript">
function setType() {
			var operatorIds = document.getElementById("selectOperator");
			for ( var i = 0; i < operatorIds.length; i++) {
				if (operatorIds[i].selected == true) {
					document.getElementById("operatorId").value = operatorIds[i].value;
					break;
				}
			}
		}
function updateClient() {
			var operatorId = document.getElementById("operatorId").value;
			var clientName = document.getElementById("clientName").value;
			var clientPassword = document.getElementById("clientPassword").value;
			var clientPassword_confirm = document.getElementById("clientPassword_confirm").value;
			var clientPhone = document.getElementById("clientPhone").value;
			var clientEmail = document.getElementById("clientEmail").value;
			var roleId = document.getElementById("roleId").value;
			var clientId = document.getElementById("clientId").value;
			if(clientName==""){
				document.getElementById("name_notice").innerHTML="*请填写用户名称!";
				document.getElementById("clientName").focus();
				return 0;
			}
			if(clientPassword==""){
				document.getElementById("password_notice").innerHTML="*请填写用户密码!";
				document.getElementById("clientPassword").focus();
				return 0;
			}
			if(clientPassword_confirm==""){
				document.getElementById("password_confirm_notice").innerHTML="*请输入确认密码!";
				document.getElementById("clientPassword_confirm").focus();
				return 0;
			}else if(clientPassword_confirm!=clientPassword){
				document.getElementById("password_confirm_notice").innerHTML="*两次输入的密码不一致!";
				document.getElementById("clientPassword_confirm").focus();
				return 0;
			}
			/* var rep=/^(((0\d{2,3})-)(\d{7,8})(-(\d{3,}))?)|(1(3|5|7|8)\d{9})$/; */
			var repPhone=/^(0?(13[0-9]|15[012356789]|17[013678]|18[0-9]|14[57])[0-9]{8})|(400|800)([0-9\\-]{7,10})|(([0-9]{4}|[0-9]{3})(-| )?)?([0-9]{7,8})((-| |转)*([0-9]{1,4}))?$/;
			if(clientPhone==""){
				
			}else if(!rep.test(clientPhone)){
				document.getElementById("phone_notice").innerHTML="*请正确填写电话!";
				document.getElementById("clientPhone").focus();
				return 0;
			}
			var rep2=/^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
			if(clientEmail==""){
				
			}else if(!rep2.test(clientEmail)){
				document.getElementById("email_notice").innerHTML="*请正确填写邮箱!";
				document.getElementById("clientEmail").focus();
				return 0;
			}
			$.post("updateClient.do",{operatorId:operatorId,clientName:clientName,clientPassword:clientPassword,clientPhone:clientPhone,clientEmail:clientEmail,roleId:roleId,clientId:clientId},
			function(data){
				 if(data==1){
					alert("用户信息修改成功!");
					window.location='searchClient.do?userId=<%=rb.getUserId()%>&page=1&roleName=<%=rb.getRoleName()%>';
				}else{
					alert("用户信息修改失败!");
				}
			});
}

</script> 
</body>
</html>
