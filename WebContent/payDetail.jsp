<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="bean.OrderBean"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="styles.css">

<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.0/jquery.min.js">
</script>

<title>支払詳細</title>
<script language="javascript">

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


function nyukin(){
	var setDate = document.getElementById("pay_date");

	if (!isDate(setDate.value,"/")){
		if (!isDate(setDate.value,"-")){
			alert("入金日を入力してください");
			return false;
		}else{
			if(kakunin() == true){
				dt.value = setDate.value;
				document.frmMain.submit();
			}
		}
		return false;
	}



}

function isDate (str, delim) {
	  var arr = str.split(delim);
	  if (arr.length !== 3) return false;
	  const date = new Date(arr[0], arr[1] - 1, arr[2]);
	  if (arr[0] !== String(date.getFullYear()) || arr[1] !== ('0' + (date.getMonth() + 1)).slice(-2) || arr[2] !== ('0' + date.getDate()).slice(-2)) {
	    return false;
	  } else {
	    return true;
	  }
	};

</script>

<script>

	function kakunin(){

		message = confirm("入金を行いますか？");

		if ( message == true ){
			return true;
	    }else{
	    	return false;
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
			&nbsp;STEPPY
			<div class="controls">
			<form action="Menu" method="post">
				<button class="buttonA" type="submit">メニュー</button>
			</form>
		</div>
		</div>
	</div>
	<div id="wrapper">
		<%
			ArrayList<OrderBean> pay_list = (ArrayList<OrderBean>) session.getAttribute("pay_list");
		%>
		<center>
			<h1>発注伝票詳細</h1>
			<table id = "bordernone">
			<tr><td>
			<h3>伝票ID&emsp;</h3></td>
			<td>：&emsp;</td>
			<td><h3><%=pay_list.get(0).getO_id()%></h3></td>
			</tr>
			<tr>
			<td><h3><p>仕入先名&emsp;</p></h3></td>
			<td>：&emsp;</td>
				<td><h3><%=pay_list.get(0).getSiire_name()%></h3></td>
			</tr>

			<tr>
			<td><h3>発注日&emsp;</h3></td>
			<td>：&emsp;</td>
			<td><h3><%=pay_list.get(0).getO_date()%></h3></td>
			</tr>
		</table>
		<br> <span id="prev">前へ</span> <span id="page"></span> <span
				id="next">次へ</span>
		</center>
		<center>
			<form action="PayFinish" method="POST" name="frmMain">

				<table id="border" class = "t-line" width="800px">
					<tr id="border">
						<td id="border"><center>商品ID</center></td>
						<td id="border" width = "310px"><center>商品名</center></td>
						<td id="border"><center>発注数</center></td>
						<td id="border"><center>仕入単価</center></td>
						<td id="border"><center>金額</center></td>
					</tr>

					<%
						for (OrderBean order : pay_list) {
					%>
					<tr>
						<td id="border"><center><%=order.getS_id()%></center></td>
						<td id="border"><%=order.getS_name()%><input type="hidden"
							name="s_id" value="<%=order.getS_id()%>"></td>
						<td id="border"><div align = "right"><%=order.getO_count()%></div><input type="hidden"
							name="count" value="<%=order.getO_count()%>"></td>
						<td id="border"><div align = "right"><%=order.getBaseprice()%></div>
						<input type="hidden" name="price" value="<%=order.getBaseprice()%>"></td>
						<td id="border"><div align = "right"><%=order.getKingaku()%></div><input type="hidden"
							name="kingaku" value="<%=order.getKingaku()%>"></td>
					</tr>

					<%
						}
					%>
				</table>
				<br>
				<br> <h2 style = "text-decoration: underline">支払総金額<%=session.getAttribute("sum")%>円</h2>
<br><br>
				入金日<input type="date" class="text" name="pay_date" id="pay_date" required>
				<input type="hidden" name="o_id" value="<%=pay_list.get(0).getO_id()%>">
				<br> <br>
				<button class="buttonA" onclick="return nyukin();">支払</button>

			</form>

			<form action="PayStatus" method="POST">
				<button class="buttonA" type="submit">戻る</button>
			</form>
		</center>
		<br>
	</div>
	<div id = "footer"></div>
</body>
</html>