<%@page import="bean.CategoryBean"%>
<%@page import="bean.SyouhinBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="styles.css">
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>商品情報の変更</title>
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
			ArrayList<SyouhinBean> syohinlist = (ArrayList<SyouhinBean>) session.getAttribute("syohindata");
			ArrayList<CategoryBean> categorylist = (ArrayList<CategoryBean>) session.getAttribute("categorylist");
			String c_id = (String) session.getAttribute("c_id");
		%>



		<center>
			<div id="Enclose">

				<br>
				<br>
				<h2>商品情報変更</h2>
				<form action="SyohinFix" method="post">
					<table style="table-layout: fixed;" id=bordernone>
						<tr>
						<br>
						<br>
							<td>商品名</td>
							<td>：</td>
							<td><input type="text" name="s_name"
								value="<%=syohinlist.get(0).getS_name()%>" required></td>
						</tr>

						<tr>
							<td>カテゴリ名</td>
							<td>：</td>
							<td><select name="category">
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
									%>
							</select></td>
						<tr>
							<td>仕入基準単価</td>
							<td>：</td>
							<td><input type="number" name="baseprice" size="6"
								value="<%=syohinlist.get(0).getBaseprice()%>" maxlength="6" min="1" required>円</td>
						</tr>
						<tr>
							<td>販売単価</td>
							<td>：</td>
							<td><input type="number" name="htanka"  size="6"
								value="<%=syohinlist.get(0).getHtanka()%>" maxlength="6" min="1" required>円</td>
						</tr>
						<tr>
							<td>安全在庫数</td>
							<td>：</td>
							<td><input type="number" name="safezaiko"  size="6"
								value="<%=syohinlist.get(0).getSafezaiko()%>" maxlength="3" min="1" required>個</td>
						</tr>
					</table>

					<p>
						<button class="buttonA" type="submit" name="bname" value="変更">変更</button>
					</p>
					</form>
			</div>
		</center>
		<div class="controls">
			<form action="SyohinFix" method="post">
				<button class="buttonA" type="submit" name="bname" value="戻る">戻る</button>
			</form>
		</div>
	</div>
	<br>
	<br>
	<br>
	<div id="footer"></div>
</body>
</html>