<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="styles.css">
<title>新規商品追加完了</title>
</head>
<body>
	<div id="header"><div class = "outline">&nbsp;STEPPY</div></div>
	<center>
		<br> <br> <br> <br>
		<div id="Enclose2">
			<p class="example2">
				商品情報を1件追加しました。<br>続けて商品を発注しますか？
			</p>
			<form action="OrderOne" method="post">
				<fieldset>
					<p>
						<button class="buttonA">はい</button>
					</p>
				</fieldset>
			</form>

			<form action="Menu" method="post">
				<fieldset>
					<p>
						<button class="buttonA">いいえ</button>
					</p>
				</fieldset>
			</form>
			<div>
	</center>
	<br>
	<br>
	<br>
	<br>
	<div id="footer"></div>
</body>
</html>