<%@page import="bean.CategoryBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="styles.css">
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.0/jquery.min.js"></script>
<title>売上一覧</title>
<script>
	$(function() {
		var page = 0;
		function draw() {
			$('#page').html(page + 1);
			$('tr').hide();
			$('tr:first,tr:gt(' + page * 10 + '):lt(10)').show();
		}
		$('#prev').click(function() {
			if (page > 0) {
				page--;
				draw();
			}
		});
		$('#next').click(function() {
			if (page < ($('tr').size() - 1) / 10 - 1) {
				page++;
				draw();
			}
		});
		draw();
	});
</script>
<style>
#prev, #next {
	color: red;
	cursor: pointer;
}
</style>

</head>
<body>
	<div id="header">
		<div class="outline">
			&nbsp;STEPPY
			<div class="controls">
			<form action="Menu" method="post">
				<button class="buttonA" type="submit">メニュー</button>
			</form>
		</div>
		</div>
	</div>
	<div id="wrapper">
		<center>
			<h1>売上一覧</h1></center>
			<br>

			<div id ="Enclose4">

		<center><h3>検索条件</h3></center>
		<form action="UriageSearch" method="post">

			<%
ArrayList<CategoryBean> categorylist = (ArrayList<CategoryBean>)session.getAttribute("categorylist");

			   String s_name = (String)session.getAttribute("s_name");
			   String category = (String)session.getAttribute("c_id");

%>
			<ul>
				<li class = "center"><label>商品名&emsp;：</label> <%
	   if(s_name == null || s_name.equals("")){
%> <input type="text" class="text" name="syouhinName"> <%
	   }else{
%> <input type="text" class="text" name="syouhinName"
					value="<%= s_name %>"> <%
	   }
%></li>
				<li class = "center"><label>カテゴリ：</label> <select name="category">
						<%
	if(category == null || category.equals("未選択")){
%>
						<option value="未選択" selected="selected">未選択</option>
						<%
            for(CategoryBean c : categorylist){

%>
						<option value="<%= c.getCategoryid() %>"><%= c.getC_name() %></option>
						<%
            }
	}else{
%>
						<option value="未選択">未選択</option>
						<%
	        for(CategoryBean c : categorylist){
	        	if(c.getCategoryid().equals(category)){
%>
						<option value="<%= c.getCategoryid() %>" selected="selected"><%= c.getC_name() %></option>
						<%
	        	}else{
%>
						<option value="<%= c.getCategoryid() %>"><%= c.getC_name() %></option>
						<%
	        	}
	        }
	}
%>
				</select></li>
			</ul>
			<center>
		<button class="buttonB" type="submit" name="bname">検索</button>
	</center>
	</form>
	</div>

	<br>
	<center>
		<br> <span id="prev">前へ</span> <span id="page"></span> <span
			id="next">次へ</span>

		<table id="border" class="t-line" width="800px">

			<tr id="border">
				<th id="border" width="150px">日時</th>
				<th id="border" width="330px">商品名</th>
				<th id="border" width="120px">売上数</th>
				<th id="border" width = "170px">金額</th>
			</tr>

			<%
				ArrayList<String[]> sel = (ArrayList<String[]>)session.getAttribute("URIAGE");
				for(int i=0;i < sel.size();i++){
					int s =Integer.parseInt(sel.get(i)[2]);
					int t =Integer.parseInt(sel.get(i)[3]);
				%>

			<tr id="border">
				<td id="border"><center><%=sel.get(i)[0]%></center></td>
				<td id="border"><%=sel.get(i)[1]%></td>
				<td id="border"><div align="right"><%=String.format("%1$,3d",Integer.parseInt(sel.get(i)[2]))%></div></td>
				<td id="border"><div align="right"><%=String.format("%1$,3d",s*t)%></div></td>
				<%
						}
					%>
			</tr>
		</table>

		<br>
		<div class="ButtonSet">
			<form action="UriageYear" method="post">
				<fieldset>
					<button class="buttonA" type="submit">年間売上</button>
				</fieldset>
			</form>
			<form action="UriageMonth" method="post">
				<fieldset>
					<button class="buttonA" type="submit" name="bname" value="月間">月間売上</button>
				</fieldset>
			</form>
		</div>
	</center>
	</div>
	<div id="footer">Copyright © 2018 STEPPY All Rights Reserved.</div>
</body>
</html>