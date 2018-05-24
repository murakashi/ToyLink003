<%@page import="bean.CategoryBean"%>
<%@page import="bean.SyouhinBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<jsp:useBean id="id" class="bean.OrderBean" scope="request" />
<link rel="stylesheet" type="text/css" href="styles.css">
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.0/jquery.min.js"></script>
<title>発注</title>

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
			<font size="7" color="white" height="center">STEPPY</font>
			<div class="controls">
				<form action="Menu" method="Post">
					<button class="buttonA" type="submit" value="メニュー">メニュー</button>
				</form>
			</div>
		</div>
	</div>
	<div id="wrapper">
<% ArrayList<SyouhinBean> syohin = (ArrayList<SyouhinBean>)session.getAttribute("syohin");
   ArrayList<CategoryBean> category = (ArrayList<CategoryBean>)session.getAttribute("category");

   String name = (String)session.getAttribute("s_name");
   String c_id = (String)session.getAttribute("c_id");

%>
		<br>

		<center>
			<h1>発注</h1>
			<div id="Enclose3">
				<font size="5">検索条件</font>
				<p>
				<form action="OrderSearch" method="post">
					<ul>
						<li><label>商品名&emsp;：</label><%
 	   if(name == null || name.equals("")){
 %>
 	   		<input type="text" class="text" name="s_name">
 <%
 	   }else{
 %>
    			<input type="text" class="text" name="s_name" value="<%= name %>">
 <%
 	   }
 %><br></li>
						<li><label>カテゴリ：</label><select name="category">
 <%
 	if(c_id == null || c_id.equals("未選択")){
 %>
 			<option value="未選択" selected="selected">未選択</option>
 <%
             for(CategoryBean c : category){

 %>
 			<option value="<%= c.getCategoryid() %>"><%= c.getC_name() %></option>
 <%
             }
 	}else{
 %>
 			<option value="未選択">未選択</option>
 <%
 	        for(CategoryBean c : category){
 	        	if(c.getCategoryid().equals(c_id)){
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
 		</select>
					</ul>
					<br> 安全在庫数が下回っている商品を表示する <input type="checkbox" name="dflg"
						value="denger">
					<p>
						<button class="buttonB" value="検索">検索</button>
						<br>
					</p>
				</form>
			</div>
			<br> <span id="prev">前へ</span> <span id="page"></span> <span
				id="next">次へ</span>
			<form action="OrderCount" method="Post">

				<table class="t-line" id="border">
					<tr>
						<th id="border" width="20"></th>
						<th id="border" width="60">商品ID</th>
						<th id="border" width="160">商品名</th>
						<th id="border" width="100">カテゴリ名</th>
						<th id="border" width="120">仕入基準単価</th>
						<th id="border" width="100">販売単価</th>
						<th id="border" width="100">安全在庫数</th>
					</tr>

					<%
						for (SyouhinBean syohinBean : syohin) {
					%>
					<tr id="border">
						<td id="border"><input type="checkbox" name="order_check"
							value="<%=syohinBean.getS_id()%>"></td>
						<td align="center"><%=syohinBean.getS_id()%></td>
						<td id="border"><%=syohinBean.getS_name()%></td>
						<td id="border"><%=syohinBean.getC_id()%></td>
						<td id="border" align="right"><%=syohinBean.getBaseprice()%></td>
						<td id="border" align="right"><%=syohinBean.getHtanka()%></td>
						<td id="border" align="right"><%=syohinBean.getSafezaiko()%></td>
					</tr>
					<%
						}
					%>
				</table>


				<p>
					<button class="buttonA">数量入力</button>
				</p>
			</form>
		</center>
	</div>
</body>
<div id="footer"></div>
</html>