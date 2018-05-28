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
	<div id="header">
		<div class="outline">&nbsp;STEPPY</div>
	</div>
	<div id="wrapper">
		<br>
		<center>
			<div id="Enclose2">
				<br>
				<p>
					<font color="red">商品を選択してください。</font>
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
		</div>
		<div id="footer">Copyright © 2018 STEPPY All Rights Reserved.</div>
</body>
</html>