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
			&nbsp;STEPPY
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
		<br> <br> <br>
		<center>
			<h2>仕入先を選択し、発注数を入力してください。</h2>

			<form action="OrderSum" method="Post">
				<br> <br> 仕入先：<select name="siire_id" required>
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
				</select> <br> <br> <span id="prev">前へ</span> <span id="page"></span>
				<span id="next">次へ</span>

				<table class="t-line" id="border" width="1000px">
					<tr id="border">
						<th id="border" class="color" width="60">商品ID</th>
						<th id="border" class="color" width="320">商品名</th>
						<th id="border" class="color" width="150">カテゴリ名</th>
						<th id="border" class="color" width="150">仕入基準単価</th>
						<th id="border" class="color" width="100">販売単価</th>
						<th id="border" class="color" width="130">安全在庫数</th>
						<th id="border" class="color" width="110">在庫数</th>
						<th id="border" class="color" width="60">数量</th>
					</tr>
					<%
						if (count_arr == null) {
							for (SyouhinBean syohinBean : syohin) {
					%>
					<tr id="border">
						<td align="center" id="border"><%=syohinBean.getS_id()%></td>
						<td id="border"><%=syohinBean.getS_name()%></td>
						<td id="border"><%=syohinBean.getC_id()%></td>
						<td align="right" id="border"><%=String.format("%1$,3d",syohinBean.getBaseprice())%></td>
						<td align="right" id="border"><%=String.format("%1$,3d",syohinBean.getHtanka())%></td>
						<td align="right" id="border"><%=String.format("%1$,3d",syohinBean.getSafezaiko())%></td>
						<td align="right" id="border"><%=String.format("%1$,3d",syohinBean.getZaiko())%></td>
						<td id="border"><center><input type="number" class = "text1" name="count" size="2"
							maxlength="3" min="1" required> <input id="border"
							type="hidden" name="s_id" value="<%=syohinBean.getS_id()%>">
							<input id="border" type="hidden" name="s_basePrice"
							value="<%=syohinBean.getBaseprice()%>"></center></td>
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
						<td align="right" id="border"><%=String.format("%1$,3d",syohinBean.getBaseprice())%></td>
						<td align="right" id="border"><%=String.format("%1$,3d",syohinBean.getHtanka())%></td>
						<td align="right" id="border"><%=String.format("%1$,3d",syohinBean.getSafezaiko())%></td>
						<td align="right" id="border"><%=String.format("%1$,3d",syohinBean.getZaiko())%></td>
						<td id="border"><center><input type="number" class = "text1" name="count" size="2"
							maxlength="3" value="<%=count_arr[i]%>" min="1" required>
							<input id="border" type="hidden" name="s_id"
							value="<%=syohinBean.getS_id()%>"> <input id="border"
							type="hidden" name="s_basePrice"
							value="<%=syohinBean.getBaseprice()%>"></center></td>
					</tr>
					<%
						i++;
							}
						}
					%>
				</table>
<br>
					<button class="buttonA" value="発注">発注</button>
			</form>
		</center>
		<div class="controls">
			<form action="Order" method="Post">
				<button class="buttonA">キャンセル</button>
			</form>
		</div>
		<br> <br> <br>
	</div>
	<br>
	<div id="footer">Copyright © 2018 STEPPY All Rights Reserved.</div>
</body>
</html>