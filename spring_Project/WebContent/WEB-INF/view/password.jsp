<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

  <div class="outer">
	<div class="inner"  style="max-width: 800px">
		<div class="centered" >
		<form action="/member/passwordresult" method="post"
			style="line-height: 34px;" 	autocomplete="off">
			<p align="left">
				<b>ID(*)</b>
			</p>
			<p>
				<small id="checkrst"></small> <input type="text" name="id" id="id"
					pattern="[a-zA-Z]+" style="width: 100%;" required>
			</p>
			<p align="left">
				<b>EMAIL(*)</b>
			</p>
			<p>
				<input type="text" name="email" id="email" style="width: 100%;" required>
			</p>
			<p style="margin-top: 25px;" align="right">
				<button id="sbt" type="submit" class="btn btn-info" style="height: 34px;">비밀번호 찾기</button>
			</p>
		</form>
</div>
</div>
</div>
