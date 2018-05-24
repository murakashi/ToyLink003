<%@page import="bean.SyouhinBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="styles.css">
<title>棚卸入力</title>
</head>
<body>

<%
	ArrayList<SyouhinBean> tana = (ArrayList<SyouhinBean>)session.getAttribute("tana");
%>

<div id="header">
		<div class="outline">
			<font size="7" color="white">&nbsp;STEPPY</font>
			<div class="controls">
			<form action="Menu" method="post">
				<button class="buttonA" type="submit">メニュー</button>
			</form>
		</div>
		</div>
	</div>
	<div id="wrapper">
		<br>
		<center>
			<div id="Enclose">
				<form action="TanaorosiFin" method="POST">

					<h1>棚卸入力</h1>
					<br> <br>
					<table id="bordernone">
						<tr>
							<td>商品ID</td>
							<td>&emsp;<%= tana.get(0).getS_id() %>
							<input type="hidden" name="s_id" value="<%= tana.get(0).getS_id() %>">
							</td>
						</tr>
						<tr>
							<td>
								<p /> 商品名
							</td>
							<td>&emsp;<%= tana.get(0).getS_name() %>
							<input type="hidden" name="s_name" value="<%= tana.get(0).getS_name() %>">
							</td>
						</tr>
						<tr>
							<td>数量</td>
							<td>&emsp;<input type="number" class="text" name="tana_count" required>
							</td>
						</tr>
					</table>
					<br>
					<button class="buttonA" type="submit">完了</button>

				</form>
			</div>
		</center>

	</div>
	<br>
	<br>
	<br>
	<div id="footer"></div>

</body>
</html>