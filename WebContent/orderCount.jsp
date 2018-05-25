<%@page import="bean.SiireBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bean.SyouhinBean"%>
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
<title>発注数量入力</title>

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
		<%
			ArrayList<SyouhinBean> syohin = (ArrayList<SyouhinBean>) session.getAttribute("syohin");
			ArrayList<SiireBean> siire_list = (ArrayList<SiireBean>) session.getAttribute("siire_list");

			String siire = (String) session.getAttribute("siire_id");
			String[] count_arr = (String[]) session.getAttribute("count_arr");
		%>
		<br> <br>
		<center>
			<p class="example2">仕入先を選択し、発注数を入力してください。</p>

			<form action="OrderSum" method="Post">

				仕入先<select name="siire_id" required>
					<option value="">未選択</option>
					<%
						if (siire == null) {
							for (SiireBean s : siire_list) {
					%>
					<option value="<%=s.getSiire_id()%>"><%=s.getSiire_name()%></option>
					<%
						}
						} else {
							for (SiireBean s : siire_list) {
								if (s.getSiire_id().equals(siire)) {
					%>
					<option value="<%=s.getSiire_id()%>" selected="selected"><%=s.getSiire_name()%></option>
					<%
						} else {
					%>
					<option value="<%=s.getSiire_id()%>"><%=s.getSiire_name()%></option>
					<%
						}
							}
						}
					%>
				</select>
				<br>

				<br> <span id="prev">前へ</span> <span id="page"></span> <span
				id="next">次へ</span>

				<table class="t-line" id="border">
					<tr id="border">
						<th id="border" class="color" width="60">商品ID</th>
						<th id="border" class="color" width="100">商品名</th>
						<th id="border" class="color" width="100">カテゴリ名</th>
						<th id="border" class="color" width="120">仕入基準単価</th>
						<th id="border" class="color" width="100">販売単価</th>
						<th id="border" class="color" width="100">安全在庫数</th>
						<th id="border" class="color" width="40">数量</th>
					</tr>
					<%
						if (count_arr == null) {
							for (SyouhinBean syohinBean : syohin) {
					%>
					<tr id="border">
						<td align="center" id="border"><%=syohinBean.getS_id()%></td>
						<td id="border"><%=syohinBean.getS_name()%></td>
						<td id="border"><%=syohinBean.getC_id()%></td>
						<td align="right" id="border"><%=syohinBean.getBaseprice()%></td>
						<td align="right" id="border"><%=syohinBean.getHtanka()%></td>
						<td align="right" id="border"><%=syohinBean.getSafezaiko()%></td>
						<td id="border"><input type="number" name="count" size="2"
							maxlength="3" min="1" required> <input id="border"
							type="hidden" name="s_id" value="<%=syohinBean.getS_id()%>">
							<input id="border" type="hidden" name="s_basePrice"
							value="<%=syohinBean.getBaseprice()%>"></td>
					</tr>
					<%
						}
						} else {
							int i = 0;
							for (SyouhinBean syohinBean : syohin) {
					%>
					<tr id="border">
						<td align="center" id="border"><%=syohinBean.getS_id()%></td>
						<td id="border"><%=syohinBean.getS_name()%></td>
						<td id="border"><%=syohinBean.getC_id()%></td>
						<td align="right" id="border"><%=syohinBean.getBaseprice()%></td>
						<td align="right" id="border"><%=syohinBean.getHtanka()%></td>
						<td align="right" id="border"><%=syohinBean.getSafezaiko()%></td>
						<td id="border"><input type="number" name="count" size="2"
							maxlength="3" value="<%=count_arr[i]%>" min="1" required>
							<input id="border" type="hidden" name="s_id"
							value="<%=syohinBean.getS_id()%>"> <input id="border"
							type="hidden" name="s_basePrice"
							value="<%=syohinBean.getBaseprice()%>"></td>
					</tr>
					<%
						i++;
							}
						}
					%>



				</table>


				<p>
					<button class="buttonA" value="発注">発注</button>
					<br>
				</p>
			</form>
		</center>
		<div class="controls">
			<form action="Order" method="Post">
				<button class="buttonA">戻る</button>
			</form>
		</div>

	</div>
	<br>
	<br>
	<br>
	<div id="footer"></div>
</body>
</html>