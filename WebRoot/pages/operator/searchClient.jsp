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
<html lang="zh-cn">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<meta name="renderer" content="webkit">
<title></title>
<link rel="stylesheet" href="css/pintuer.css">
<link rel="stylesheet" href="css/admin.css">
<script src="js/jquery.js"></script>
<script src="js/pintuer.js"></script>
</head>
<body>

  <div class="panel admin-panel">
    <div class="panel-head"><strong class="icon-reorder"> 终端用户列表</strong> <a href="" style="float:right; display:none;">添加字段</a></div>
    <div class="padding border-bottom">
    <form method="post" action="searchClientByCondition.do"
				id="searchClientByConditionForm" name="searchClientByConditionForm">
      <ul class="search" style="padding-left:10px;">
        <li> <a class="button border-main icon-plus-square-o" href="addClientBefore.do"> 添加终端用户</a> </li>
          <li>
            <select name="selectSearchType" id="selectSearchType" class="input" style="width:200px; line-height:17px;" onchange="setSearchType();">
            				<%
							if (rb.getRoleName() != null && rb.getRoleName().equals("adminer")) {
							%> 
							<option value="clientName">用户名称</option>
							<option value="operatorName">运营商名称</option>
							<%
							}
							%>
							<%
							if (rb.getRoleName() != null && rb.getRoleName().equals("operator")) {
							%> 
							<option value="clientName">用户名称</option>
							<%
							}
							%>
            </select>
          </li>
      
        <li><input type="text" placeholder="请输入搜索关键字" name="keyword" id="keyword" class="input" style="width:250px; line-height:17px;display:inline-block" /> 
			<input type="hidden" value="clientName" name="type" id="type"/>
			<input type="hidden" value="<%=rb.getUserId()%>" name="userId" id="userId"/>
			<input type="hidden" value="<%=rb.getRoleName()%>" name="roleName" id="roleName"/>
			<input type="hidden" value="1" name="page" id="page"/> 
        <a href="javascript:searchClientByCondition();" class="button border-main icon-search">搜索</a></li>
		  <li style="padding-right:10px;float:right;"><span class="r" style="float:right;">共有数据：<strong>${totalCount}</strong> 条</span></li>
      </ul>
      </form>
    </div>
    <table class="table table-hover text-center">
      <tr>
        <th width="200px">用户名称</th>
		<th width="200px">用户密码</th>
		<th width="150px">联系电话</th>
		<th width="150px">用户邮箱</th>
		<th width="200px">所属运营商</th>
        <th width="124px">操作</th>
      </tr>
      <c:forEach var="list" items="${cblist}">
      <tr id="client_tr_${list.id}">
        <td width="200px">${list.name}</td>
		<td width="200px">${list.password}</td>
		<td width="150px">${list.phone}</td>
		<td width="150px">${list.email}</td>
		<td width="200px">${list.operatorName}</td>
        <td width="124px"><input type="button" id="editButton" onclick="javascript:window.location.href='updateClientBefore.do?clientId=${list.id}'" value="修改">&nbsp;<input type="button" id="deleteButton" onclick="javascript:deleteClient(${list.id})" value="删除"></td>
      </tr>
      </c:forEach>
       
      <tr>
        <td colspan="8"><div class="pagelist"> 
        <c:choose>
										<c:when test="${page==1}">
											<a>上一页</a>
										</c:when>
										<c:otherwise>
											<a href="${prePageHref}">上一页</a>
										</c:otherwise>
									</c:choose>
									 &nbsp;&nbsp;${page}/${maxPage}&nbsp;&nbsp;
									<c:choose>
										<c:when test="${page==maxPage}">
											<a>下一页</a>
										</c:when>
										<c:otherwise>
											<a href="${nextPageHref}">下一页</a>
										</c:otherwise>
        </c:choose>
        </div></td>
      </tr>
    </table>
  </div>
<script type="text/javascript">
function setSearchType() {
			var types = document.getElementById("selectSearchType");
			for ( var i = 0; i < types.length; i++) {
				if (types[i].selected == true) {
					document.getElementById("type").value = types[i].value;
					break;
				}
			}
}
function deleteClient(clientId){
				if(confirm("确定要删除该终端用户吗?")){
					$.post("deleteClient.do",{clientId:clientId},
				 	function(data){
				 		if(data==1){
							alert("终端用户删除成功!");
							document.getElementById("client_tr_"+clientId).style.display="none";
						}else{
							alert("终端用户添加失败!");
						}
				 	});
			 	}
			}
function searchClientByCondition(){
	if(document.getElementById("type").value==''){
		alert("请选择查询项!");
		document.getElementById("selectSearchType").focus();
		return 0;
	}
	if(document.getElementById("keyword").value==''){
		//alert("请输入查询参数!");
		window.location.href='searchClient.do?userId=<%=rb.getUserId()%>&page=1&roleName=<%=rb.getRoleName()%>';
		//document.getElementById("keyword").focus();
		return 0;
	}
	document.searchClientByConditionForm.submit();
}
</script>
</body>
</html>

