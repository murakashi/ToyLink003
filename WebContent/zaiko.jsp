<%@ page import="bean.SyouhinBean"%>
<%@ page import="bean.CategoryBean"%>
<%@ page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="styles.css">
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.0/jquery.min.js"></script>
<title>在庫一覧</title>
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

	function textControl(obj){

		if(obj.checked == true){

			//document.getElementById("s_name").value = "";
			document.getElementById("s_name").disabled = true;
			document.getElementById("category").disabled = true;

		}
		else{

			document.getElementById("s_name").disabled = false;
			document.getElementById("category").disabled = false;
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
			<font size="7" color="white">&nbsp;STEPPY</font>
			<div class="controls">
				<form action="ZaikoSearch" method="post">
					<button class="buttonA" name="bname" value="メニュー">メニュー</button>
				</form>
			</div>
		</div>
	</div>
	<div id="wrapper">
		<br>

		<center>
			<h1>在庫状況</h1>
		</center>
		<br>
		<%
			ArrayList<SyouhinBean> syohinlist = (ArrayList<SyouhinBean>) session.getAttribute("syohinlist");
			String orderid = (String) session.getAttribute("orderid");
			ArrayList<CategoryBean> categorylist = (ArrayList<CategoryBean>) session.getAttribute("categorylist");

			String s_name = (String) session.getAttribute("s_name");
			String c_id = (String) session.getAttribute("c_id");
		%>
		<div id="Enclose3">
			<center>
				<h3>検索条件</h3>
			</center>
			<form action="ZaikoSearch" method="post">
				<ul>
					<%
						if (s_name != null) {
					%>
					<li><label>商品名&emsp;：</label>
					<input type="text" class="text" name="syouhin" value="<%=s_name%>" id="s_name"> <br></li>
					<%
						} else {
					%>
					<li><label>商品名&emsp;：</label>
					<input type="text" class="text" name="syouhin" id="s_name"> <br></li>
					<%
						}
					%>
					<li><label>カテゴリ：</label> <select name="category" id="category">
							<%
								if (c_id == null || c_id.equals("未選択")) {
							%>
							<option value="未選択" selected="selected">未選択</option>
							<%
								for (CategoryBean c : categorylist) {
							%>
							<option value="<%=c.getCategoryid()%>"><%=c.getC_name()%></option>
							<%
								}
								} else {
							%>
							<option value="未選択">未選択</option>
							<%
								for (CategoryBean c : categorylist) {
										if (c.getCategoryid().equals(c_id)) {
							%>
							<option value="<%=c.getCategoryid()%>" selected="selected"><%=c.getC_name()%></option>
							<%
								} else {
							%>
							<option value="<%=c.getCategoryid()%>"><%=c.getC_name()%></option>
							<%
								}
									}
								}
							%>
					</select></li>
				</ul>
				<center>
					<div class="chkbox">
						<input type="checkbox" id="checkbox01" name="dflg" value="denger" onclick="textControl(this);">
						安全在庫数が下回っている商品を表示する
						<label for="checkbox01"></label>
					</div>
				</center>

				<p />
				<center>
					<button class="buttonB" name="bname" value="検索">検索</button>
				</center>
				<p />
			</form>
		</div>

		<p />
		<center>
			<span id="prev">前へ</span> <span id="page"></span> <span id="next">次へ</span>
		</center>

		<center>
			<table class="t-line" id="border">
				<tr id="border">
					<th id="border" width="80">商品ID</th>
					<th id="border" width="310">商品名</th>
					<th id="border" width="100">安全在庫数</th>
					<th id="border" width="80">在庫数</th>
					<th id="border" width="30">発注</th>
					<th id="border" width="30">棚卸</th>
				</tr>
				<%
					int id = 0;
					for (int i = 0; i < syohinlist.size(); i++) {
				%>
				<tr id="border">
					<td id="border"><center><%=syohinlist.get(i).getS_id()%></center></td>
					<td id="border"><%=syohinlist.get(i).getS_name()%></td>
					<td id="border"><div align="right"><%=syohinlist.get(i).getSafezaiko()%></div></td>
					<td id="border"><div align="right"><%=syohinlist.get(i).getZaiko()%></div></td>
					<td id="border"><form action="ZaikoSearch" method="post">
							<button class="buttonA" name="order"
								value="<%=syohinlist.get(i).getS_id()%>">発注</button>
						</form></td>
					<td id="border"><form action="Tanaorosi" method="post">
							<button class="buttonA" name="tana"
								value="<%=syohinlist.get(i).getS_id()%>">棚卸</button>
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