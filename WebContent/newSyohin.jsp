<%@page import="bean.CategoryBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="styles.css">
<title>新規商品追加</title>
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
		<br>
		<%
			int s_id = (int) session.getAttribute("s_id");
			ArrayList<CategoryBean> category = (ArrayList<CategoryBean>) session.getAttribute("category");

			String s_name = (String) session.getAttribute("s_name");
			String c_id = (String) session.getAttribute("c_id");
			String siire_tanka = (String) session.getAttribute("siire_tanka");
			String h_tanka = (String) session.getAttribute("h_tanka");
			String safe_zaiko = (String) session.getAttribute("safe_zaiko");
		%>
		<center>
			<div id="Enclose">
				<br>
				<h2>新規商品追加</h2>
				</p>
				<form action="InsertCheck" method="Post">
					<table style="table-layout: fixed;" id=bordernone>
						<tr>
							<td>商品ID</td>
							<td>：</td>
							<td><%=s_id%><input type="hidden" name="s_id"
								value="<%=s_id%>"></td>
						</tr>
						<tr>
							<td>商品名</td>
							<td>：</td>
							<%
								if (s_name == null) {
							%>
							<td><input type="text" name="s_name" size="20" required></td>
							<%
								} else {
							%>
							<td><input type="text" name="s_name" size="20"
								value="<%=s_name%>" required></td>
							<%
								}
							%>
						</tr>
						<tr>
							<td>カテゴリ</td>
							<td>：</td>
							<td><select name="category" required>
									<%
										if (c_id == null || c_id.equals("未選択")) {
									%>
									<option value="" selected="selected">未選択</option>
									<%
										for (CategoryBean c : category) {
									%>
									<option value="<%=c.getCategoryid()%>"><%=c.getC_name()%></option>
									<%
										}
										} else {
									%>
									<option value="">未選択</option>
									<%
										for (CategoryBean c : category) {
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
							</select></td>
						</tr>
						<tr>
							<td>仕入基準単価</td>
							<td>：</td>
							<%
								if (siire_tanka == null) {
							%>
							<td><input type="number" name="siire_tanka" size="6" min="1" maxlength="6"
								required>円</td>
							<%
								} else {
							%>
							<td><input type="number" name="siire_tanka" size="6" maxlength="6"
								value="<%=siire_tanka%>" min="1" required>円</td>
							<%
								}
							%>
						</tr>
						<tr>
							<td>販売単価</td>
							<td>：</td>
							<%
								if (h_tanka == null) {
							%>
							<td><input type="number" name="h_tanka" size="6" min="1" maxlength="6" required>円</td>
							<%
								} else {
							%>
							<td><input type="number" name="h_tanka" size="6"
								value="<%=h_tanka%>" min="1" maxlength="6" required>円</td>
							<%
								}
							%>
						</tr>
						<tr>
							<td>安全在庫数</td>
							<td>：</td>
							<%
								if (safe_zaiko == null) {
							%>
							<td><input type="number" name="safe_zaiko" size="6" min="1" maxlength="3" required>個</td>
							<%
								} else {
							%>
							<td><input type="number" name="safe_zaiko" size="6"
								value="<%=safe_zaiko%>" min="1" maxlength="3" required>個</td>
							<%
								}
							%>
						</tr>
					</table>

					<p>
						<button class="buttonA">新規追加</button>
					</p>
				</form>
			</div>
		</center>
		<div class="controls">
			<form action="Menu" method="Post">
				<button class="buttonA" type="submit">戻る</button>
			</form>
		</div>
		<br> <br> <br> <br>
	</div>
	<div id="footer"></div>
</body>
</html>