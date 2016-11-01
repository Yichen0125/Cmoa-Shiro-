<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="atguigu" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../static/jquery/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="../static/jquery/themes/icon.css">
<script type="text/javascript" src="../static/jquery/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="../static/jquery/jquery.easyui.min.js"></script>

<script type="text/javascript">
	$(function(){
		$("#addNew").click(function(){
			var date = $("#date").val();
			var todo = $("#todo").val();
			
			var url = "/crm/addNew";
			var args = {"date":date, "todo":todo, "time":new Date};
			
			$.post(url, args, function(data){
				//若 data 能转为一个正整数, 则可以认为其成功. 
				var reg = /^\d+\$/g;
				var flag = reg.test(data);
				
				if(flag){
					alert("添加成功!");
					
					var $tr = $("<tr></tr>");
					$tr.append("<td>" + date + "</td>")
					   .append("<td><input type='text' value='" + todo + "' id='todo-" + data + "'/></td>")
					   .append("<td><button id='update-" + data + "'>Update</button>&nbsp;<button>Delete</button><input type='hidden' value='" + data + "'/></td>");
					$tr.find("#update-" + data).click(function(){
						update(this);
					});
					
					$("table").append($tr);
				}else{
					alert("添加失败!");
				}
			});
		});
		
		$("button[id^='update']").click(function(){
			update(this);
		});
		
		function update(button){
			var url = "/crm/testAjax";
			
			var id = $(button).nextAll(":hidden")[0].value;
			var todo = $("#todo-" + id).val();
			
			var args = {"id":id, "todo":todo, "time":new Date()};
			$.post(url, args, function(data){
				if(data == "1"){
					alert("修改成功!");
				}else{
					alert("修改失败!");
				}
			});
		}
	})
</script>

</head>
<body>
	
	<br><br>
	<img alt="" src="../testJfreeChart2">
	
	<br><br>
	<!-- 遍历 Map -->
	<% 
		Map maps = new HashMap();
		maps.put("1", "A");
		maps.put("2", "B");
		maps.put("3", "C");
		maps.put("4", "D");
		maps.put("5", "E");
		maps.put("6", "F");
		
		pageContext.setAttribute("map", maps);
	%>
	
	<c:forEach items="${map }" var="item">
		${item.key } - ${item.value }
		<br>
	</c:forEach>
	
	<br><br>
	<img alt="" src="../testJfreeChart">
	
	<br><br>
	<!--  
		关于 Ajax 修改:
		1. 若按钮或 a 标签的 class 已经被使用了. 则可以标示其 id, 但 id 不能重复, 所以 id 可以标记为: 固定的字符串-id值
		<img id="delete-${item.id }" title="删除" src="${ctp}/static/images/bt_del.gif" class="op_button" />
		2. 真正需要提交的 id 可以编辑为一个隐藏域.
		3. Handler 的 Ajax 方法中需要使用 @ResponseBody 注解. 
		
		关于 Ajax 添加:
		1. 添加成功后, 返回的标记为不能再是单纯的 0 或 1, 而需要是新添加的 SalesPlan 的 id. 
		2. 如何验证返回值是否正确呢 ? 使用正则表达式. 
		3. 需要手工在 table 中添加 tr 和 td. 
		4. 新添加的 tr 中的 button 不能响应 ajax 请求, 因为他们是新被添加的!
		
		如何让新被添加的项也能使用之前定义的 ajax 请求.
		1. 把之前的 update 的响应函数独立出来. 为了再后面可以重用.
		2. 在新增 tr 时, 为新添加的按钮也加上对应的响应函数. 
	-->
	<table>
		<tr>
			<td>1990-11-11</td>
			<td>
				<input type="text" value="AAAA" id="todo-1001"/>
			</td>
			<td>
				<button id="update-1001">Update</button>
				<button>Delete</button>
				<input type="hidden" value="1001"/>
			</td>
		</tr>
		<tr>
			<td>1990-12-12</td>
			<td>
				<input type="text" value="BBBB" id="todo-1002"/>
			</td>
			<td>
				<button id="update-1002">Update</button>
				<button>Delete</button>
				<input type="hidden" value="1002"/>
			</td>
		</tr>
		<tr>
			<td>1990-10-10</td>
			<td>
				<input type="text" value="CCCC" id="todo-1003"/>
			</td>
			<td>
				<button id="update-1003">Update</button>
				<button>Delete</button>
				<input type="hidden" value="1003"/>
			</td>
		</tr>
	</table>
	
	<br><br>
	
	日期: <input type="text" id="date"/>
	&nbsp;&nbsp;
	计划项: <input type="text" id="todo"/>
	&nbsp;&nbsp;
	<button id="addNew">Add New</button>
	
	<br><br>
	<br><br>
	<atguigu:helloworld username="abcd">
		Age : ${param.age }
	</atguigu:helloworld>
	<br><br>

	<a href="?a=1">Test</a>
	<br><br>

	<!--  
	1. 把 jquery-easyui-1.3.5 复制到 tomcat 的 webapps 目录下
	2. 编辑 tomcat 的 conf/tomcat-user.xml 文件. 加入如下配置:
	<role rolename="manager-gui"/>
	<user username="a" password="a" roles="manager-gui"/>
	3. 编辑 tomcat 的 conf/web.xml 文件. 修改 DefaultServlet 的 listings 参数值为 true
	4. 点击 http://localhost:8080/ 下的 manager app 链接.
	或直接输入 http://localhost:8080/jquery-easyui-1.3.5/demo/tree/animation.html 地址。 
	5. 按官方给的例子, 在 eclipse 下把自己的页面跑起来. 
	-->

	<ul class="easyui-tree" data-options="url:'tree_data1.json',method:'get',animate:true"></ul>

</body>
</html>