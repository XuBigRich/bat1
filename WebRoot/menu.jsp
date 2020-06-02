<%@page contentType="text/html;charset=utf-8"%>
<html>
<head>
<title>菜单</title>
</head>
<script language="javascript">
function fun(){
	var tr=event.srcElement.parentElement.parentElement.nextSibling;
	if(tr.style.display=="none")tr.style.display="block";
	else tr.style.display="none";
}

</script>
<style type="text/css">
table{
	position:absolute;
	left:0px;
	top:0px;
	border:0px;
	font-size:9pt;
}
tr{
	text-align:center;
}
td{
	text-align:left;
}
.ms{
	width:195;
	height:22px;
	color:black;
	text-align:left;
	font-size:11pt;
	padding-left:20px;
	padding-top:4px;
	text-decoration:none;
	background-image:url(img/bg1.gif);
}
.ms:hover{
	color:white;
	background-image:url(img/bg2.gif);
}
.sub{
	font-size:10pt;
	text-decoration:none;
	width:195;
	height:20px;
	padding-top:4px;
	padding-left:5px;
}
.sub:hover{
	color:black;
	background-color:#CCC;
}

</style>
<body>
<center>
<table width=100% cellspacing=0>
    <tr><td><a href="#" class=ms onclick=fun()>员工管理</a></td></tr>
    <tr style="display:none;">
        <td>
            <a href="emp!allEmp" class=sub target="content">员工查询</a><br>
            <a href="emp!beforeAddEmp" class=sub target="content">添加员工</a><br>
        </td>
    </tr>
</table>

</center>
</body>
</html>