<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="styles.css">
<title>入庫完了</title>
</head>
<body>

	<div id="header">
		<div class="outline">
			&nbsp;STEPPY
			<div class="controls">
				<form action="Menu" method="post">
					<button class="buttonA" name="bname" value="メニュー">メニュー</button>
				</form>
			</div>
		</div>
	</div>
	<div id="wrapper">
		<br>
		<div id="Enclose2">
			<center>
				<br>
				<h2>入庫が完了しました</h2>
				<br>
				<br>
				<form action="OrderStatus" method="post">
					<button class="buttonA" value="OK">OK</button>
				</form>
			</center>
		</div>
	</div>
	<div id="footer"></div>

</body>
</html>