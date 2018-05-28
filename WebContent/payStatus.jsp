<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="bean.OrderBean"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="styles.css">
<title>支払状況</title>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.0/jquery.min.js">
</script>

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

function nyukin(oid){
	var form = document.getElementById("Nyukin");
	var dt   = document.getElementById("hid_date");
	var nyukin = document.getElementById("o_id_nyukin");
	var setDate = document.getElementById("pay_date" + oid);
	nyukin.value=oid

	if (!isDate(setDate.value,"/")){
		if (!isDate(setDate.value,"-")){
			alert("入金日を入力してください");
			return false;
		}else{
			if(kakunin() == true){
				dt.value = setDate.value;
				form.submit();
			}
		}
	}

	//dt.value = setDate.value;
	//form.submit();

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
			ArrayList<OrderBean> order_payList = (ArrayList<OrderBean>) session.getAttribute("order_payList");
		%>
		<center>
			<h1>支払状況</h1>
			<br> <span id="prev">前へ</span> <span id="page"></span> <span id="next">次へ</span>
			<table id="border" class = "t-line" width = "900px">
				<tr>
					<th id="border" width = "80px"><center>伝票ID</center></th>
					<th id="border"width = "250px"><center>支払先名</center></th>
					<th id="border" width = "120px"><center>支払金額</center></th>
					<th id="border" width = "160px"><center>入金日</center></th>
					<th id="border" width = "110px"><center>支払</center></th>
					<th id="border" width = "110px"><center>詳細</center></th>
				</tr>
				<%
					for (OrderBean order : order_payList) {
				%>
				<tr height=40>
					<td id="border"><center><%=order.getO_id()%></center></td>
					<td id="border"><center><%=order.getSiire_name()%></center></td>
					<td id="border"><div align="right"><%=String.format("%1$,3d",order.getKingaku())%></div></td>
					<td id="border">
						<center>
							<input type="date" class="text" width="400px" name="pay_date_tmp"
								id="pay_date<%=order.getO_id()%>" required>
						</center>
					</td>

					<td id="border">
						<!-- <form action="PayFinish" method="post"> -->

							<center>
								<button class="buttonB" type="submit"
									onclick ="nyukin(<%=order.getO_id()%>);">支払</button>
							</center>

					</td>
					<td id="border">
						<form action="PayDetail" method="post">

							<center>
								<input type="hidden" name="o_id" value="<%=order.getO_id()%>">
								<button class="buttonB" type="submit">詳細</button>
								<input type="hidden" name="o_id" value="<%=order.getO_id()%>>">
							</center>
						</form>
					</td>
				</tr>
				<%
					}
				%>
			</table>
		</center>
		<br>

		<form id="Nyukin" method="POST" action="PayFinish">
			<input type="hidden" name="pay_date" id="hid_date"> <input
				type="hidden" name="o_id" id="o_id_nyukin">
		</form>

		<div class="controls">
			<form action="Menu" method="post">
				<button class="buttonA" type="submit">戻る</button>
			</form>
		</div>
		<br><br>
		<br><br>
	</div>
<div id = "footer">Copyright © 2018 STEPPY All Rights Reserved.</div>
</body>
</html>