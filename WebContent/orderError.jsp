<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="styles.css">
<title>Insert title here</title>
</head>
<%--発注画面でチェックを入れずに発注ボタンを押した時のエラー画面 --%>
<body>
	<div id="header"><div class = "outline"><font size="7" color="white" height="center">STEPPY</font></div></div>
	<br>
	<br>
	<br>
	<center>
		<div id="Enclose2">
			<br>
			<p>
				<font size="5" color="red" weight="900">商品を選択してください。
			</p>
			<form action="Order" method="Post">
				<p>
					<button class="buttonA" value="戻る">戻る</button>
					<br>
				</p>
			</form>
		</div>
	</center>
	<br>
	<br>
	<br>
	<div id="footer"></div>
</body>
</html>