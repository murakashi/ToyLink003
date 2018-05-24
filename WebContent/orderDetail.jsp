<%@ page import="java.util.ArrayList"%>
<%@ page import="bean.OrderBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="styles.css">
<title>発注伝票詳細</title>
</head>
<body>

	<div id="header">
		<div class="outline">
			<font size="7" color="white">&nbsp;STEPPY</font>
			<div class="controls">
				<form action="Menu" method="post">
					<button class="buttonA" name="bname" value="メニュー">メニュー</button>
				</form>
			</div>
		</div>
	</div>
	<%
		ArrayList<OrderBean> order_list = (ArrayList<OrderBean>) session.getAttribute("order_list");
	%>
	<div id="wrapper">
		<center>
			<h1>発注伝票詳細</h1>
		</center>
		<br>
		<center>
			<table id="bordernone">
				<tr>
					<td><h3>伝票ID</h3></td>
					<td><h3>：</h3></td>
					<td><h3><%=order_list.get(0).getO_id()%></h3></td>
				</tr>
				<tr>
					<td><h3><p/>仕入先名</h3></td>
					<td><h3>：</h3></td>
					<td><h3><%=order_list.get(0).getSiire_name()%></h3></td>
				</tr>
				<tr>
					<td><h3>発注日</h3></td>
					<td><h3>：</h3></td>
					<td><h3><%=order_list.get(0).getO_date()%></h3></td>
				</tr>
			</table>
		</center>
		<br>
		<center>
			<form action="OrderUpdate" method="post">
				<table class="t-line" id="border">
					<tr id="border">
						<th id="border">商品ID</th>
						<th id="border">商品名</th>
						<th id="border">発注数</th>
					</tr>
					<%
						for (OrderBean order : order_list) {
					%>

					<tr id="border">
						<td id="border"><center><%=order.getS_id()%></center></td>
						<td id="border"><%=order.getS_name()%><input type="hidden"
							name="s_id" value="<%=order.getS_id()%>"></td>
						<td id="border"><div align="right"><%=order.getO_count()%></div>
							<input type="hidden" name="count" value="<%=order.getO_count()%>"></td>
					</tr>
					<%
						}
					%>
				</table>
				<br> <br> <input type="hidden" name="o_id"
					value="<%=order_list.get(0).getO_id()%>">
				<button class="buttonA" value="入庫">入庫</button>
			</form>

			<form action="OrderStatus" method="POST">
				<button class="buttonA" value="戻る">戻る</button>
			</form>
		</center>
	</div>
	<br>
	<div id="footer"></div>
</body>
</html>