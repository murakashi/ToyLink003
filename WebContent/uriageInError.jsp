<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="styles.css">
<title>売上入力エラー</title>
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

<div id = "wrapper">
<center>

<br>
	<div id = "Enclose2">
	<br>
	<h2>実在庫数がマイナスになってしまいます</h2>
	<br>
	<br>
	<form action="UriageIn" method="POST">
		<button class="buttonA" type="submit">戻る</button>
	</form>
	</div>
</center>
</div>
<div id = "footer"></div>
</body>
</html>