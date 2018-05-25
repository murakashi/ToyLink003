<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="bean.SelectYearBean"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.0/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="styles.css">
<title>年間売上</title>
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
	SelectYearBean years = (SelectYearBean)session.getAttribute("yearslist");

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
<h1>年間売上</h1></center>
<br>

<div id = "Enclose5">
<center><h3>検索条件</h3>
<br><br>
<form action="UriageYearSearch" method="post">
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
<button class = "buttonB" type = "submit" value = "検索">検索</button>
</form>
</center>
</div>
<br>
<br>
<center>
<span id="prev">前へ</span>
<span id="page"></span>
<span id="next">次へ</span>

<table id = "border" class = "t-line" width = "700px">
<tr id = "border">
<th id = "border" width = "150px">年</th>
<th id = "border" width = "120px">売上件数</th>
<th id = "border">売上金額</th>
<th id = "border">利益</th>
</tr>

<% ArrayList<String[]> sel = (ArrayList<String[]>)session.getAttribute("URIAGEY");
for(int i=0;i < sel.size();i++){
	int t =Integer.parseInt(sel.get(i)[2]);
	int n =Integer.parseInt(sel.get(i)[3]); %>

<tr id = "border">
<td id = "border"><center><%= sel.get(i)[0] %></center></td>
<td id = "border"><div align = "right"><%= sel.get(i)[1] %></div></td>
<td id = "border"><div align = "right"><%= sel.get(i)[2] %></div></td>
<td id = "border"><div align = "right"><%= t-n %></div></td>
<%} %>
</tr>

</table>
</center>
<br>
<div class = "controls">
<form action = "Uriage" method = "POST">
<button class = "buttonA" type = "submit">戻る</button>
</form>
</div>
<br>
<br>
<br>
<br>
</div>
<div id = "footer"></div>
</body>
</html>