<%@ page import="bean.OrderBean"%>
<%@ page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="styles.css">
<title>発注状況</title>

<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.0/jquery.min.js">
	
</script>

<script language="javascript">
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
		ArrayList<OrderBean> order_list = (ArrayList<OrderBean>) session.getAttribute("order");
	%>
	<div id="wrapper">
		<center>
			<h1>発注状況</h1>
			<br> <span id="prev">前へ</span> <span id="page"></span> <span
				id="next">次へ</span>
			<table class="t-line" id="border">
				<tr id="border">
					<th id="border" width=60><center>伝票ID</center></th>
					<th id="border" width=140><center>仕入先名</center></th>
					<th id="border" width=100><center>発注日</center></th>
					<th id="border">入庫</th>
					<th id="border">詳細</th>
				</tr>
				<%
					for (OrderBean order : order_list) {
				%>
				<tr id="border">
					<td id="border"><center><%=order.getO_id()%></center></td>
					<td id="border"><%=order.getSiire_name()%></td>
					<td id="border"><center><%=order.getO_date()%></center></td>
					<td id="border"><form action="OrderUpdate" method="post" onsubmit="return kakunin()">
							<center>
								<button class="buttonA" value="入庫">入庫</button>
								<input type="hidden" name="o_id" value="<%=order.getO_id()%>">
							</center>
						</form></td>
					<td id="border"><form action="OrderDetail" method="post">
							<center>
								<button class="buttonA" value="詳細">詳細</button>
								<input type="hidden" name="o_id" value="<%=order.getO_id()%>">
							</center>
						</form></td>
				</tr>
				<%
					}
				%>
			</table>
		</center>
	</div>
	<br>
	<div id="footer"></div>

</body>
</html>