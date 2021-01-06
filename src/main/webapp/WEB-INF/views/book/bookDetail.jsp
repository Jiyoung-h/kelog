<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My book</title>

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<link href="${path}/resources/movieList.css" rel="stylesheet" type="text/css">
<link href="${path}/resources/movieDetail.css" rel="stylesheet" type="text/css">
<script src="https://kit.fontawesome.com/81816a43c2.js" crossorigin="anonymous"></script>

</head>
<body>
	<nav id="sideNav" class="col-lg-3">
		<h1>
			<a href="/">keylog : 기록</a>
		</h1>
		<div class="sidebtn">
			<a href="/movie" class="btn-1">MOVIE</a>
		</div>
		<div class="sidebtn">
			<a href="/book" class="btn-1">BOOK</a>
		</div>
		<div class="sidebtn">
			<a href="/all" class="btn-1">ALL</a>
		</div>
	</nav>
	<div class="col-lg-9" style="margin-left: 300px;">
		<div class="movielog">
			<span class="movie">BOOK</span><span class="log">log</span>
		</div>
		<div class="container">
		
		<div class="row">
			<div class="col-4" style="margin: 0 auto;">
				<div id="image_container">
					<c:set var="search" value="${dto.search}" />
          			<c:choose>
						<c:when test="${search eq '1'}">
							<img src="${dto.image_url}"
					id="image_preview" style="position: relative; z-index: 100; width: 263.8px; height: 373px;"/>
						</c:when>
						<c:otherwise>
							<img src="${path}/images/${dto.image_url}"
					id="image_preview" style="position: relative; z-index: 100; width: 263.8px; height: 373px;"/>
						</c:otherwise>
					</c:choose>
					
				</div>
			</div>
			<div class="col-6 movie-info" style="margin: 0 auto;">
				<div> <span>제목</span> ${dto.title } </div>
				<div> <span>장르</span> ${dto.genre }</div>
				<div> <span>출판일</span> <fmt:formatDate value="${dto.releaseDate}" pattern="yyyy.MM.dd"/></div>
				<div> <span>작가</span> ${dto.author } </div>
				<div> <span>출판사</span> ${dto.publisher }</div>
				<div> <span>독서 완료일</span> <fmt:formatDate value="${dto.viewDate}" pattern="yyyy.MM.dd"/> </div>
				<div> <span>별점</span> 
				<c:set var="star" value="${dto.star}" />
          			<c:choose>
						<c:when test="${star eq '1'}">★☆☆☆☆</c:when>
						<c:when test="${star eq '2'}">★★☆☆☆</c:when>
						<c:when test="${star eq '3'}">★★★☆☆</c:when>
						<c:when test="${star eq '4'}">★★★★☆</c:when>
						<c:when test="${star eq '5'}">★★★★★</c:when>
					</c:choose>
				</div>
				<div class="quote"> <span>나의 한마디</span> <i class="fas fa-quote-left"></i>${dto.quote }<i class="fas fa-quote-right"></i> </div>
			</div>
		</div>
		<div class="row" style="width: fit-content; margin: 25px auto;">
			<div class="col-2 memo">메모</div>
			<div class="col" style="width:543px;">${dto.content }</div>
		</div>
		
		</div>
	</div>

	<a onclick="confirm('삭제하시겠습니까?')" href="${path }/book/delete/${dto.no}">
	<div class="floating-action-button u-flex-center">
  	<div style="color:white; font-weight:900;">삭제</div>
	</div>
	</a>
	
	<a href="${path}/book/modify/${dto.no }">
	<div class="floating-action-button u-flex-center twobtn">
  	<div style="color:white; font-weight:900;">수정</div>
	</div>
	</a>
</body>
</html>