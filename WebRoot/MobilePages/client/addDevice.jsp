<%@ page language="java" contentType="text/html" import="java.util.*,com.ictwsn.bean.*" pageEncoding="UTF-8"%>
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
<title>设备添加页面</title>
<meta http-equiv="Content-type" content="text/html; charset=utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="Cache-Control" content="no-transform" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" />
<!-- <meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=2.0, user-scalable=1"> -->
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="layoutmode" content="standard">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="renderer" content="webkit">


<!--uc浏览器判断到页面上文字居多时，会自动放大字体优化移动用户体验。添加以下头部可以禁用掉该优化-->
<meta name="wap-font-scale" content="no">

<meta content="telephone=no" name="format-detection" />
<META HTTP-EQUIV="Pragma" CONTENT="no-cache">



<link rel="stylesheet" type="text/css"
	href="css/fontsIco.min.css?v=201707171211" />
<link rel="stylesheet" type="text/css"
	href="css/base.min.css?v=201708102044" title="default" />
<link rel="stylesheet" type="text/css"
	href="css/bannerAnimation.min.css?v=201611211856" title="" />
<link rel="stylesheet" id="mobiStyleTemplateCss" type="text/css"
	href="css/1011_1.min.css?v=201612121825" />


<!-- //横向标签样式css -->
<style id='mobiTabStyleCss'>
.fk-tabStyle2 .f-formTabButtonList .formTabButtonClick {
	border-bottom-color: #ff692c;
}

.fk-tabStyle2 .f-formTabButtonList .formTabButtonClick {
	color: #ff692c;
}

.fk-tabStyle1 div.formTabButtonClick .f-formTabMiddle {
	background-color: #ff692c;
}
</style>

<!-- //输出模块样式css -->
<style id='mobiStyleModule'>
</style>
<style id='mobiStyleNav' type='text/css'>
.open .navItem:nth-child(2) {
	transition-delay: 160ms;
}

.open .navItem:nth-child(4) {
	transition-delay: 240ms;
}

.open .navItem:nth-child(6) {
	transition-delay: 320ms;
}

#navbar_105 .icon-navItemIcon:before {
	content: '';
	content: '';
}

#navbar_105 .icon-navItemIcon {
	background-image: none;
}

.open .navItem:nth-child(8) {
	transition-delay: 400ms;
}

.open .navItem:nth-child(10) {
	transition-delay: 480ms;
}

.open .navItem:nth-child(12) {
	transition-delay: 560ms;
}
</style>

<style id="webBodyBackgroundStyle">
#g_web {
	background: none;
}

#webContainerBox {
	background: none;
}

#webBodyBackground {
	background:
		url(http://10937501.s61i.faiusr.com/2/AD0IncmbBRACGAAg4_6yvwUon4fR8gEwgAU46Ac.jpg)
		center center;
	background-size: cover;
}
</style>

<style id='mobiCubeStyleModule'>
</style>

<style id='mobiSearchStyleModule'>
</style>




<!-- 输出底部样式 -->
<style id='fixedAreaBoxStyle'>
</style>


<!-- 系统特殊隐藏栏目隐藏头部、banner -->


</head>
<body faiscoMobi="true" id="g_body" class="g_locale2052 mobiCol3">
	<script src="js/jquery-1.4.3.min.js" type="text/javascript"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			var message='<%=request.getParameter("message")%>';
			if(message!='null'){
				if(message==1){
					alert("设备添加成功!");
				}else if(message==0){
					alert("设备添加失败!");
				}
				
			}
		});
		var _htmlFontSize = (function() {
			var clientWidth = document.documentElement ? document.documentElement.clientWidth
					: document.body.clientWidth;
			if (clientWidth > 768 && clientWidth < 1280) {
				clientWidth = 768;
			} else if (clientWidth >= 1280) {
				clientWidth = 512;
			}
			document.documentElement.style.fontSize = clientWidth * 1 / 16
					+ "px";
			return clientWidth * 1 / 16;
		})();
		function setType() {
			var clientIds = document.getElementById("selectClient");
			for ( var i = 0; i < clientIds.length; i++) {
				if (clientIds[i].selected == true) {
					document.getElementById("clientId").value = clientIds[i].value;
					break;
				}
			}
		}
		function addDevice(){
			var deviceName = document.getElementById("deviceName").value;
			var minor = document.getElementById("minor").value;
			var clientId= document.getElementById("clientId").value;
			if(deviceName==""){
				document.getElementById("notice").style.display="block";
				document.getElementById("notice").innerHTML="请填写设备名称!";
				Mobi.scrollToTop('webContainerBox');
				return 0;
			}
			if(minor==""){
				document.getElementById("notice").style.display="block";
				document.getElementById("notice").innerHTML="请填写设备minor!";
				Mobi.scrollToTop('webContainerBox');
				return 0;
			}
			if(clientId==""){
				document.getElementById("notice").style.display="block";
				document.getElementById("notice").innerHTML="请选择设备所属用户!";
				Mobi.scrollToTop('webContainerBox');
				return 0;
			}
			$.post("checkMinorRepeat.do",{
				clientId:clientId,
				minor:minor
			},function(data){
				if(data == 1){
					document.getElementById("notice").style.display="block";
					document.getElementById("notice").innerHTML="设备minor已存在,请重新填写!";
					Mobi.scrollToTop('webContainerBox');
				}else{
					document.addDeviceForm.submit();
				}
			});
		}
		
	</script>

	<div class="webLeft"></div>
	<div id="g_web" class="g_web">
		<!-- this is loading  -->
		<div id="webLoading" class="loading" style='display:none;'>
			<div id="splashscreen" class='splashscreen ui-loader'>
				<span class='ui-icon ui-icon-loading spin'></span>
			</div>
		</div>
		
		<div class='loginHeader webHeaderBg'>
			<a
				href='searchDevice.do?userId=<%=rb.getUserId()%>&page=1&roleName=<%=rb.getRoleName()%>'
				class='g_close icon-gClose'></a><span class='title pageTitle'>添加设备

			
		</div>
		<div id="webBannerBox" class="webBannerBox  ">
			<div id='webBanner' style='display:none;' class='webBanner'></div>
		</div>
		<div id="webContainerBox" class="webContainerBox">
			<div id="webModuleContainer" class="webModuleContainer">
				<div id='module9' class='form Handle  formStyle14 ' _autoHeight='1'
					_height='0' _bHeight='0' _inTab='0'>

					<div class='formMiddle formMiddle9'>
						<div class='middleLeft middleLeft9'></div>
						<div class='middleCenter middleCenter9'>
							<div class='formMiddleContent formMiddleContent9 moduleContent'
								_innerType='0'>
								<div id='signupPage'>

									<div class='signUpContent'>
										<div id='profileArea'>
											<form id="addDeviceForm" name="addDeviceForm"
												action="addDevice.do" method="post"
												enctype="multipart/form-data">
												<div class="notice" id="notice" style="display:none"></div>
												<div class='g_globalLine '>
													<input type='text' maxlength='20' name='deviceName'
														id='deviceName'
														class='mustItem itemEdit userAddItem g_input'
														placeholder='请输入设备名称(必填)'><span
														class='icon-codeIcon g_mainColor'></span><span
														class='mustIcon'>&nbsp;</span>
												</div>
												<div class='g_globalLine '>
													<input type='text'
														class='mustItem itemEdit userAddItem g_input' id='uuid'
														name='uuid' maxlength='36' readonly="readonly"
														value="<%=rb.getUuid()%>"><span
														class='icon-uuidIcon g_mainColor'></span><span
														class='mustIcon'>&nbsp;</span>
												</div>
												<div class='g_globalLine '>
													<input type='text'
														class='mustItem itemEdit userAddItem g_input' id='major'
														name='major' maxlength='11' readonly="readonly"
														value="<%=rb.getMajor()%>"><span
														class='icon-majorIcon g_mainColor'></span><span
														class='mustIcon'>&nbsp;</span>
												</div>
												<div class='g_globalLine '>
													<input type='text' maxlength='11' id='minor' name='minor'
														class='mustItem itemEdit userAddItem g_input'
														placeholder='请输入设备minor(必填)'><span
														class='icon-minorIcon g_mainColor'></span><span
														class='mustIcon'>&nbsp;</span>
												</div>
												<div class='g_globalLine'>
													<span class='icon-clientIcon g_mainColor'></span> <label
														for="select"></label> <select name="select"
														class="itemEdit g_select  mustItem" id="selectClient"
														onChange="setType()">
															<option value="">请选择设备所属用户</option>
														<c:forEach var="list" items="${clientList}"
															varStatus="status">
															<option value="${list.id}">${list.name}</option>
														</c:forEach>
													</select> <input type="hidden" name="roleName" id="roleName"
														value="<%=rb.getRoleName()%>">
												</div>
												<div class='g_globalLine '>
													<input type='text' maxlength='200' id='deviceInfo'
														name='deviceInfo'
														class='mustItem itemEdit userAddItem g_input'
														placeholder='请输入设备信息'><span
														class='icon-deviceInfoIcon g_mainColor'></span><span
														class='mustIcon'>&nbsp;</span>
												</div>
												<div class='g_globalLine '>
													<input type='text' maxlength='50' id='title' name='title'
														class='mustItem itemEdit userAddItem g_input'
														placeholder='请输入展示标题'><span
														class='icon-titleIcon g_mainColor'></span><span
														class='mustIcon'>&nbsp;</span>
												</div>
												<div class='g_globalLine '>
													<input type='text' maxlength='50' id='content_title'
														name='content_title'
														class='mustItem itemEdit userAddItem g_input'
														placeholder='请在下方文本框输入,不超过500字' readonly="readonly"><span
														class='icon-contentIcon g_mainColor'></span>
												</div>
												<div class='g_globalLine '>
													<textarea id='content'
														class='mustItem itemEdit userAddItem g_textArea msg_textArea'
														name='editorValue'></textarea>
												</div>
												<input type='hidden' id="clientId" name='clientId'
													value=''>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class='middleRight middleRight9'></div>
					</div>
				</div>
				<div id="module414" class="form Handle  formStyle13" _autoheight="1"
					_height="0" _bheight="0" _intab="0" style="height: auto;">
					<div style="cursor:move;" _bannerautoheight="1"
						class="formBannerTitle formBannerTitle414">
						<div class="titleLeft titleLeft414"></div>
						<div class="titleCenter titleCenter414">
							<div class="titleText titleText414">
								<div class="titleTextIcon icon-titleText">&nbsp;</div>
								<div class="textContent">上传图片</div>
							</div>
							<div class="formBannerMore formBannerMore414"></div>
						</div>
						<div class="titleRight titleRight414"></div>
					</div>
					<div class="formMiddle formMiddle414">
						<div class="middleLeft middleLeft414"></div>
						<div class="middleCenter middleCenter414">
							<div class="formMiddleContent formMiddleContent414 moduleContent"
								_innertype="0">
								<div class="siteForm fk-siteForm-v">
									<div id="siteFormItems6" class="siteFormItemTable">
										<div class="siteFormItem siteFormItemTr">
											<div class="siteFormItemTd" width="100%"
												style="padding:0 0 0.45rem 0;">
												<div
													class="F6siteFormItemShowVal fk-siteFormItemShowVal f-fk-siteFormItemShowVal">
													<div class="fk-uploadComponent">
														<span id="uploadButton4140"> <input type="file"
															name="imageFile" id="imageFile"> </span> <font
															class="fk-importantStar">*</font>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="middleRight middleRight414"></div>
					</div>
				</div>
				<div id="module415" class="form Handle  formStyle13" _autoheight="1"
					_height="0" _bheight="0" _intab="0" style="height: auto;">
					<div style="cursor:move;" _bannerautoheight="1"
						class="formBannerTitle formBannerTitle415">
						<div class="titleLeft titleLeft415"></div>
						<div class="titleCenter titleCenter415">
							<div class="titleText titleText415">
								<div class="titleTextIcon icon-titleText">&nbsp;</div>
								<div class="textContent">上传视频</div>
							</div>
							<div class="formBannerMore formBannerMore415"></div>
						</div>
						<div class="titleRight titleRight415"></div>
					</div>
					<div class="formMiddle formMiddle415">
						<div class="middleLeft middleLeft415"></div>
						<div class="middleCenter middleCenter415">
							<div class="formMiddleContent formMiddleContent415 moduleContent"
								_innertype="0">
								<div class="siteForm fk-siteForm-v">
									<div id="siteFormItems6" class="siteFormItemTable">
										<div class="siteFormItem siteFormItemTr">
											<div class="siteFormItemTd" width="100%"
												style="padding:0 0 0.45rem 0;">
												<div
													class="F6siteFormItemShowVal fk-siteFormItemShowVal f-fk-siteFormItemShowVal">
													<div class="fk-uploadComponent">
														<span id="uploadButton4150"> <input type="file"
															name="videoFile" id="videoFile"> </span> <font
															class="fk-importantStar">*</font>
													</div>
												</div>
											</div>
										</div>

									</div>

								</div>
							</div>
						</div>
						<div class='signupSubmitCtrl g_globalLine'>
							<input type='button' style="cursor:pointer"
								class='g_button sendIcon signupSubmit submitIcon' id="button1"
								value='确认添加' onclick="addDevice();" />
						</div>
						<div class="middleRight middleRight415"></div>

					</div>

				</div>

				</form>
			</div>
		</div>
		<div id="webFooterBox" class="webFooterBox  ">
			<!--图片详情Div -->
			<div id="fullScreenDivCotainer" class='fullScreenDivCotainer'></div>
		</div>

		<div id="fixedAreaBox" class="fixedAreaBox fixedAreaBox1011_1"
			tplid="1011_1"></div>

		<!--设置网站的背景颜色  start-->
		<div class="webBackgroundBox  ">
			<div id="webBodyBackground" class="webBackground "></div>
			<div id='navExistOffPanel' class='navExistOffPanel'></div>
		</div>
		<!--设置网站的背景颜色  end-->

		<!-- ------------------------------------------ -->
	</div>
	<div class="webRight"></div>
	
	<script type="text/javascript" charset="utf-8"
		src="js/jqmobi.min.js?v=201706192138"></script>
	<script type="text/javascript" charset="utf-8"
		src="js/jqmobi_ui.min.js?v=201708111609"></script>
	<script id="mobiOperationJS" type="text/javascript" charset="utf-8"
		src="js/mobi.min.js?v=201708091152"></script>
	<script type="text/javascript" language="javascript">
		//管理态下的预览页面提前作处理 之前这里的g_viewMode先去掉
		if (!false && window.top !== window.self) {
			var g_className = document.getElementById("g_body").className;
			document.getElementById("g_body").className = g_className + " ";
		}

		//用于iframe显示手机模板的时候 给g_web加上width
		var g_webWidth = 0;
		if (g_webWidth == 0) {
			g_webWidth = window.localStorage ? localStorage
					.getItem("g_webWidth") : Cookie.read("g_webWidth");
			if (g_webWidth != null) {
				document.getElementById("g_web").style.width = g_webWidth
						+ "px";
			}
		} else {
			document.getElementById("g_web").style.width = g_webWidth + "px";
			if (window.localStorage) {
				localStorage.setItem("g_webWidth", g_webWidth);
			} else {
				Cookie.write("g_webWidth", g_webWidth);
			}
		}
	</script>



</body>
</html>
