<%@page contentType="text/html;charset=utf-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<html>
<head>
	<title>添加员工</title>
	<link rel="stylesheet" type="text/css" href="common.css">
	<script language="javascript" src="time.js" charset="gbk"></script>
</head>
<script language="javascript">
function addHistory(){
	var cn=document.getElementById("model").cloneNode(true);
	cn.style.display="block";
	document.getElementById("tb").appendChild(cn);
}
function delRow(){
	var rindex=event.srcElement.parentElement.parentElement.rowIndex;//获取行的索引
	document.getElementById("tab").deleteRow(rindex);
}
</script>
<body>
<center>
<s:form action="emp!addEmp" method="post">
<table width=600 cellspacing=1>
	<tr><th colspan=2>添加新员工</th></tr>
	<s:textfield label="姓名" name="emp.ename"/>
	<s:radio label="性别" name="emp.sex" list="#{'m':'男','f':'女'}" value="'m'"/>
	<s:textfield label="入职日期" name="emp.hire" readonly="true" onclick="setday(this)"/>
	<s:textfield label="工资" name="emp.sar"/>
	<s:select label="所属部门" name="emp.did" list="depts" listKey="did" listValue="dname"/>
	<tr><th colspan=2><a href="#" onclick=addHistory()>添加工作经历</a></th></tr>
	<tr>
		<td colspan=2>
			<table id="tab" width=100% cellspacing=1>
				<tr>
					<th>开始时间</th>
					<th>结束时间</th>
					<th>工作地点</th>
					<th>职位</th>
					<th>删除</th>
				</tr>
				<tr id="model" style="display:none;">
					<td><input type=text name="startdate" size=10 readonly onclick=setday(this)></td>
					<td><input type=text name="enddate" size=10 readonly onclick=setday(this)></td>
					<td><input type=text name="place"></td>
					<td><input type=text name="job"></td>
					<td><input type=button value="删 除" onclick=delRow()></td>
				</tr>
				<tbody id="tb"></tbody>
				
			</table>
		</td>
	</tr>
	<s:submit value="添 加" align="center"/>
</table>
</s:form>
</center>
</body>
</html>



