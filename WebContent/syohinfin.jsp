<%@page import="bean.SyouhinBean"%>
<%@page import="bean.CategoryBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="styles.css">
<title>変更確認画面</title>
</head>
<body>
	<div id="header">
		<div class="outline">
		&nbsp;STEPPY
		</div>
	</div>
	<center>
		<br> <br> <br> <br> <br>
		<%
			SyouhinBean syohin = (SyouhinBean) session.getAttribute("updatesyohin");
			ArrayList<SyouhinBean> before = (ArrayList<SyouhinBean>) session.getAttribute("syohinlist");

			String c_name = (String) session.getAttribute("c_name");
		%>
		<h2>≪以下の内容に変更してよろしいですか？≫</h2> <br>
		<fieldset>
			<div id="Enclose">
			<br>
				<h3>変更前</h3>
				<br>
				<br>
				<table style="table-layout: fixed;" id=bordernone>
					<tr>
						<td width="120">商品名</td>
						<td>：</td>
						<td><%=before.get(0).getS_name()%></td>
					</tr>
					<tr>
						<td width="150">カテゴリ名</td>
						<td>：</td>
						<td><%=before.get(0).getC_id()%></td>
					</tr>
					<tr>
						<td width="120">仕入基準価格</td>
						<td>：</td>
						<td><%=String.format("%1$,3d",before.get(0).getBaseprice())%></td>
					</tr>
					<tr>
						<td width="120">販売価格</td>
						<td>：</td>
						<td><%=String.format("%1$,3d",before.get(0).getHtanka())%></td>
					</tr>
					<tr>
						<td width="120">安全在庫数</td>
						<td>：</td>
						<td><%=String.format("%1$,3d",before.get(0).getSafezaiko())%></td>
					</tr>
				</table>
			</div>
		</fieldset>
		<fieldset>
			<h1>☞</h1><br>
		</fieldset>
		<fieldset>
			<div id="Enclose">
			<br>
				<h3>変更後</h3>
				<br>
				<br>
				<table style="table-layout: fixed;" id=bordernone>
					<tr>
						<td width="120">商品名</td>
						<td>：</td>
						<td><%=syohin.getS_name()%></td>
					</tr>
					<tr>
						<td width="150">カテゴリ名</td>
						<td>：</td>
						<td><%=c_name%></td>
					</tr>
					<tr>
						<td width="120">仕入基準価格</td>
						<td>：</td>
						<td><%=String.format("%1$,3d",syohin.getBaseprice())%></td>
					</tr>
					<tr>
						<td width="120">販売価格</td>
						<td>：</td>
						<td><%=String.format("%1$,3d",syohin.getHtanka())%></td>
					</tr>
					<tr>
						<td width="120">安全在庫数</td>
						<td>：</td>
						<td><%=String.format("%1$,3d",syohin.getSafezaiko())%></td>
					</tr>
				</table>
			</div>
		</fieldset>
		<br>
<br>
		<form action="SyohinFix" method="post">
			<fieldset>
				<button class="buttonA" name="bname" value="はい">はい</button>
			</fieldset>
			<fieldset>
				<button class="buttonA" name="bname" value="いいえ">いいえ</button>
				<br>
			</fieldset>
		</form>
	</center>
</body>
<br>
<div id="footer">Copyright © 2018 STEPPY All Rights Reserved.</div>
</html>