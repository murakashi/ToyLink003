<%@page import="bean.SelectYearBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.0/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="styles.css">
<title>月間売上</title>
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

<%
	SelectYearBean years = (SelectYearBean)session.getAttribute("years");

	String year = (String)session.getAttribute("year");
%>

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
<h1>月間売上</h1>
<br>

<div id = "Enclose5">
<h3 >検索条件</h3>

<form action="UriageMonth" method="post">
<ul>
<li><label>年&nbsp;:&nbsp;</label>
<select style= width:150px name="year">
<%
	if(year == null || year.equals("")){
%>
		<option selected="selected" value="">未選択</option>
<%
		for(int y=years.getStartyear();y<=years.getEndyear();y++){
%>
		<option value=<%=y %>><%=y %></option>
<%
		}
	}else{
%>
		<option value="">未選択</option>
<%
		for(int y=years.getStartyear();y<=years.getEndyear();y++){
			if(y == Integer.parseInt(year)){
%>
				<option value=<%=y %> selected="selected"><%=y %></option>
<%
			}else{
%>
				<option value=<%= y %>><%= y %></option>
<%
			}
		}
	}
%>
</select></li>
</ul>
<br>
<center><button class = "buttonB" type="submit" name="bname" value = "検索">検索</button></center>
</form>
</div>
<br>

<span id="prev">前へ</span>
<span id="page"></span>
<span id="next">次へ</span>

<br>
<table id = "border" class = "t-line" width = "700px">
<tr id = "border">
<th id = "border" width = "150px">年月</th>
<th id = "border" width = "120px">売上件数</th>
<th id = "border" width = "150px">売上金額</th>
<th id = "border" width = "150px">利益</th>
</tr>

<%ArrayList<String[]> sel = (ArrayList<String[]>)session.getAttribute("URIAGE");
for(int i=0;i < sel.size();i++){
	int s =Integer.parseInt(sel.get(i)[2]);
	int t =Integer.parseInt(sel.get(i)[3]); %>

<tr id = "border">
<td id = "border"><center><%= sel.get(i)[0] %></center></td>
<td id = "border"><div align = "right"><%=String.format("%1$,3d",Integer.parseInt(sel.get(i)[1])) %></div></td>
<td id = "border"><div align = "right"><%=String.format("%1$,3d",Integer.parseInt(sel.get(i)[2])) %></div></td>
<td id = "border">
<%
	int num1 = Integer.parseInt(sel.get(i)[2]);
	int num2 = Integer.parseInt(sel.get(i)[3]);
%>
<div align = "right"><%=String.format("%1$,3d",num1 - num2) %></div>
</td>
</tr>
<%} %>

</table>
</center>
<br>
<div class = "controls">
<form action = "Uriage" method = "POST">
<button class = "buttonA" type = "submit" value = "戻る">戻る</button>
</form>
</div>
</div>
<br>
<br><br>
<br>
<div id = "footer">Copyright © 2018 STEPPY All Rights Reserved.</div>
</body>
</html>