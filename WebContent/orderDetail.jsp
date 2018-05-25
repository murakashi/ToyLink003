<%@ page import="java.util.ArrayList"%>
<%@ page import="bean.OrderBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="styles.css">

<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.0/jquery.min.js">
	
</script>

<title>発注伝票詳細</title>

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

<script>
	function kakunin() {
		message = confirm("入庫を行いますか？");
		if (message == true) {
			return true;
		} else {
			return false;
		}
	}
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
		<ul>
			<li><label>伝票ID&emsp;：</label><%=order_list.get(0).getO_id()%><br></li>
			<li><label>仕入先名：</label><%=order_list.get(0).getSiire_name()%><br></li>
			<li><label>発注日&emsp;：</label><%=order_list.get(0).getO_date()%></li>
		</ul>
		<center>
			<br> <span id="prev">前へ</span> <span id="page"></span> <span
				id="next">次へ</span> <br>
			<form action="OrderUpdate" method="post" onsubmit="return kakunin()">
				<table class="t-line" id="border">
					<tr id="border">
						<th id="border" width="60">商品ID</th>
						<th id="border" width=330">商品名</th>
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
				<br> <input type="hidden" name="o_id"
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