<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mailbox</title>

<style type='text/css'>
@import url("mailbox.css");
</style>
<link rel="stylesheet" href="css/mailbox.css">
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script>
	$(function(){
		$(".yes").click(function(){
			var p = $(this).parent()[0];
			p.action = "./confirm.do";
			p.submit();
		});
		$(".no").click(function(){
			var p = $(this).parent()[0];
			p.action = "./refuse.do";
			p.submit();
		});
		$(".ok").click(function(){
			var p = $(this).parent()[0];
			p.action = "./ok.do";
			p.submit();
		});
	})
</script>

</head>
<body>
	<a href="#" class="title"><img src="./img/title.png"></a>
	<a class="name">이름</a>
		<table>
			<tr>
				<th><img id="img"
					src="${pageContext.request.contextPath}/img/profile.png" width=30
					height=30 />
				</th>
				<th>친구</th>
				<th>상태메세지</th>
				<th>yes</th>
				<th>no</th>
			</tr>
			<c:forEach var="mview" items="${mviews}">
				<tr>
					<td><img id="img"
						src="${pageContext.request.contextPath}/upload/${mview.img}" width=30
						height=30 />
					</td>
					<td>${mview.name}</td>
					<td>${mview.msg}</td>
					<td>
						<form>
							<c:if test="${mview.req!='r'}">
								<input type="hidden" name="num" value="${mview.num}"> 
								<input type="hidden" name="id" value="${mview.id}"> 
								<input type="hidden" name="fid" value="${mview.fid}"> 
								<input type="hidden" name="req" value="${mview.req}"> 
								<input type="button" value="yes" class="yes">
								<input type="button" value="no" class="no">
							</c:if>
							<c:if test="${mview.req=='r'}">
								<input type="hidden" name="num" value="${mview.num}"> 
								<input type="button" value="ok" class="ok">
							</c:if>
						</form>
					</td>
				</tr>
			</c:forEach>
		</table>
</body>
</html>