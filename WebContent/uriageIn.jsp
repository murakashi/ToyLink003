<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="bean.SyouhinBean"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="styles.css">
<title>売上入力</title>
</head>
<body>
	<div id="header">
		<div class="outline">
			&nbsp;STEPPY
			<div class="controls">
			<form action="Menu" method="post">
				<button class="buttonA" type="submit">メニュー</button>
			</form>
		</div>
		</div>
	</div>
	<div id="wrapper">
		<center>
		<h1>売上入力</h1>
			<div id="Enclose">
				<form action="UriageFin" method="POST">
					<%
						ArrayList<SyouhinBean> syouhinlist = (ArrayList<SyouhinBean>) session.getAttribute("syouhinlist");
						String startdate = (String)session.getAttribute("startdate");
						String enddate = (String)session.getAttribute("enddate");

						String syouID = (String)session.getAttribute("syouID");
						String salNum = (String)session.getAttribute("salNum");
						String tanka = (String)session.getAttribute("tanka");
					%>
					<br> <br>
					<table id="bordernone">
						<tr>
							<td>商品名</td>
							<td>&emsp;<select name="syouID" required>
<%
							if(syouID == null || syouID.equals("")){
%>
									<option value="" selected="selected">未選択</option>

									<%
										for (SyouhinBean s : syouhinlist) {
									%>
									<option value="<%=s.getS_id()%>"><%=s.getS_name()%>
<%
										}
							}else{
%>
									<option value="">未選択</option>

									<%
										for (SyouhinBean s : syouhinlist) {
											if(s.getS_id() == Integer.parseInt(syouID)){

									%>
											<option value="<%=s.getS_id()%>" selected="selected"><%=s.getS_name()%></option>
<%
											}else{
%>
												<option value="<%=s.getS_id()%>"><%=s.getS_name()%></option>
<%
											}
										}
							}
%>
							</select>
							</td>
						</tr>
						<tr>
							<td>
								<p /> 売上日
							</td>
							<td>&emsp;<input type="date" class="text" min="<%= startdate %>"
							 max="<%= enddate %>" name="day" required></td>
						</tr>
						<tr>
							<td>売上数</td>
<%
						if(salNum == null){
%>
							<td>&emsp;<input type="number" class="text" name="salNum"
								min="1" maxlength="7" required>&nbsp;個
							</td>
<%
						}else{
%>
							<td>&emsp;<input type="number" class="text" name="salNum" value="<%= salNum %>"
									min="1" maxlength="7" required>&nbsp;個
							</td>
<%
						}
%>
						<tr>
							<td>
								<p /> 販売単価
							</td>
<%
						if(tanka == null){
%>
							<td>&emsp;<input type="number" class="text" name="tanka"
								min="1" maxlength="7" required>&nbsp;円
							</td>
<%
						}else{
%>
							<td>&emsp;<input type="number" class="text" name="tanka" value="<%= tanka %>"
									min="1" maxlength="7" required>&nbsp;円
							</td>
<%
						}
%>
						<tr>
							<td>破損</td>
							<td>
								<div class="chkbox">
									&emsp;<input type="checkbox" id="checkbox01" name="break"
										value="hason"> <label for="checkbox01"></label>
								</div>
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