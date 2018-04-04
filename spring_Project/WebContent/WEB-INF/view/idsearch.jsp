<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <div class="outer">
	<div class="inner"  style="max-width: 800px">
		<div class="centered" >
		<form action="/member/idresult" method="post"
			style="line-height: 34px;"
			autocomplete="off">
			<p align="left">
				<b>ID 찾기</b>
			</p>
			<p>
				<small id="checkrst"></small> <input type="text" name="email" id="email" style="width:100%" placeholder="EMAIL을 입력해주세요">
			</p>
			<p align="right">
				<button type="submit" class="btn btn-info" style="height: 39px;">ID 찾기</button>
			</p>
		</form>
		</div>
		</div>
		</div>
