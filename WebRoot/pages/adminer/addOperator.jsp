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
	<form action="" method="post" class="form form-horizontal" id="form-article-add">
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>运营商名称：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input w50" value="" maxlength='20' placeholder="请输入运营商名称" id="operatorName" name="operatorName">
				<span id="name_notice" class="c-red"></span>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>运营商密码：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input w50" value="" maxlength='20' placeholder="请输入运营商密码" id="operatorPassword" name="operatorPassword">
				<span id="password_notice" class="c-red"></span>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>运营商UUID：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input w50" value="" maxlength='36' placeholder="请输入UUID" id="operatorUuid" name="operatorUuid">
			
			<span id="uuid_notice" class="c-red"></span>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>运营商major：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input w50" value="" maxlength='11' placeholder="请输入major" id="operatorMajor" name="operatorMajor">
			
			<span id="major_notice" class="c-red"></span>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red"></span>运营商电话：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input w50" value="" maxlength='11' placeholder="请输入运营商电话" id="operatorPhone" name="operatorPhone">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red"></span>运营商地址：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input w50" value="" maxlength='50' placeholder="请输入运营商地址" id="operatorAddress" name="operatorAddress">
			</div>
		</div>
		<input type="hidden" value="2" id="roleId" name="roleId">
		<div class="row cl">
			<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-2">
				<button onClick="addOperator();" class="btn btn-primary radius" type="button"><i class="Hui-iconfont">&#xe632;</i>确认添加</button>
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
function addOperator(){
			var operatorName=document.getElementById("operatorName").value;
			var operatorPassword=document.getElementById("operatorPassword").value;
			var uuid=document.getElementById("operatorUuid").value;
			var major=document.getElementById("operatorMajor").value;
			var operatorPhone=document.getElementById("operatorPhone").value;
			var operatorAddress=document.getElementById("operatorAddress").value;
			var roleId = document.getElementById("roleId").value;
			if(operatorName==""){
				document.getElementById("name_notice").innerHTML="*请填写运营商名称!";
				document.getElementById("operatorName").focus();
				return 0;
			}
			if(operatorPassword==""){
				document.getElementById("password_notice").innerHTML="*请填写运营商密码!";
				document.getElementById("operatorPassword").focus();
				return 0;
			}
			if(uuid==""){
				document.getElementById("uuid_notice").innerHTML="*请填写UUID!";
				document.getElementById("operatorUuid").focus();
				return 0;
			}
			if(major==""){
				document.getElementById("major_notice").innerHTML="*请填写major!";
				document.getElementById("operatorMajor").focus();
				return 0;
			}
			$.post("addOperator.do",{operatorName:operatorName,operatorPassword:operatorPassword,uuid:uuid,major:major,operatorPhone:operatorPhone,operatorAddress:operatorAddress,roleId:roleId},
				function(data){
					if(data==1){
						alert("运营商添加成功!");
						window.location='searchOperator.do?userId=<%=rb.getUserId()%>&page=1&roleName=<%=rb.getRoleName()%>';
					}else if(data==-1){
						document.getElementById("name_notice").innerHTML="*运营商名称已存在,请重新填写!";
						document.getElementById("operatorName").focus();
					}else{
						alert("运营商添加失败!");
				}
			});
		}
</script> 
</body>
</html>
