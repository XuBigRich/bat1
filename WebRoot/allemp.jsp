<%@page contentType="text/html;charset=utf-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<html>
<head>
	<title>员工列表</title>
	<link rel="stylesheet" type="text/css" href="common.css">
	<script language="javascript" src="time.js" charset="gbk"></script>
</head>
<script language="javascript">
function showHist(){
	var obj=event.srcElement.parentElement.nextSibling;
	if(obj.style.display=="none")obj.style.display="block";
	else obj.style.display="none";
}
function secAll(){
	var deids=document.getElementsByName("deid");
	for(i=0;i<deids.length;i++)deids[i].checked=event.srcElement.checked;
}
function checkFrm(){
	var eids=document.getElementsByName("deid");
	for(i=0;i<eids.length;i++)if(eids[i].checked)return true;
	alert("请选择待删除的记录");
	return false;
}
</script>
<body>
<center>
<form action="emp!findEmp" method="post">
<table width=600 cellspacing=1>
	<tr>
		<th>姓名</th>
		<td><input type=text name="emp.ename" size=15></td>
		<th>性别</th>
		<td>
			<input type=radio name="emp.sex" value="k" checked class="nob">所有
			<input type=radio name="emp.sex" value="m" class="nob">男
			<input type=radio name="emp.sex" value="f" class="nob">女
		</td>
	</tr>
	<tr>
		<th>入职日期</th>
		<td>
			<input type=text name="emp.hire" readonly onclick=setday(this) size=10>
			-
			<input type=text name="emp.hire2" readonly onclick=setday(this) size=10>
		</td>
		<th>所属部门</th>
		<td>
			<select name="emp.did">
				<option value="0">请选择</option>
				<s:iterator value="depts">
					<option value="${did }">${dname }</option>
				</s:iterator>
			</select>
		</td>
	</tr>
	<tr><th colspan=4><input type=submit value='查 找'></th></tr>
</table>
</form>

<form action="emp!delEmpAll" method="post" onsubmit="return checkFrm();">
<table width=600 cellspacing=1>
	<tr>
		<th>
			<input type=checkbox onclick=secAll()>
			<input type=submit value="批量删除">
		</th>
		<th>姓名</th>
		<th>性别</th>
		<th>入职日期</th>
		<th>工资</th>
		<th>所属部门</th>
		<th>操作</th>
	</tr>
	<s:iterator value="emps">
		<tr>
			<td>
				<input type=checkbox name="deid" value="${eid }">
			</td>
			<td onclick=showHist()>${ename }</td>
			<td>${sex=='m'?'男':'女' }</td>
			<td><s:property value="hire"/></td>
			<td>${sar }</td>
			<td>${dept.dname }</td>
			<td>
				<a href="emp!beforeUpdate?emp.eid=${eid }">修改</a>
				<a href="emp!delEmp?emp.eid=${eid }" onclick="return confirm('确定删除这条记录？');">删除</a>
			</td>
		</tr>
		<tr style="display:none;">
			<td colspan=7>
				<table width=100% cellspacing=1>
					<s:iterator value="hist">
						<tr>
							<td><s:property value="startdate"/></td>
							<td><s:property value="enddate"/></td>
							<td>${place }</td>
							<td>${job }</td>
						</tr>
					</s:iterator>
				</table>
			</td>
		</tr>
	</s:iterator>
</table>
</form>
<br>
<a href="emp!beforeAdd">添加员工</a>
</center>
</body>
</html>