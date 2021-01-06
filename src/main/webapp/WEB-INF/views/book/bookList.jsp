<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="https://kit.fontawesome.com/81816a43c2.js" crossorigin="anonymous"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Book</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<link href="${path}/resources/movieList.css" rel="stylesheet" type="text/css">
<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://kit.fontawesome.com/81816a43c2.js" crossorigin="anonymous"></script>

</head>
<script>
function popup(){
    if($('.popupselect').css('display') == 'none'){
    	$('.popupselect').fadeIn();
   	}else{
        $('.popupselect').fadeOut();
    }
}
</script>

<body>
<nav id="sideNav" class="col-lg-3">
	<h1><a href="/">keylog : 기록</a></h1>
	<div class="sidebtn"><a href="/movie" class="btn-1">MOVIE</a></div>
	<div class="sidebtn"><a href="/book" class="btn-1">BOOK</a></div>
	<div class="sidebtn"><a href="/all" class="btn-1">ALL</a></div>
</nav>
<div class="col-lg-9" style="margin-left:300px;">
<div class="movielog"><span class="movie">BOOK</span><span class="log">log</span></div>
<div class="popupselect">
	<div class="row">
		<a href="/bookSearch" style="display: contents; color:white;"><div class="col-md-5"><div><i class="fas fa-search"></i></div>도서 검색</div></a>
		<a href="/book/mywrite" style="display: contents; color:white;"><div class="col-md-5"><div><i class="fas fa-keyboard"></i></div>직접 입력</div></a>
	</div>
</div>
<div class="container">
      <div class="row">
      <c:forEach var="row" items="${list}">
        <div class="col-4">
          <div class="card">
          	<div class="row">
          		<a href="${path }/book/detail/${row.no}">
          			<c:set var="search" value="${row.search}" />
          			<c:choose>
						<c:when test="${search eq '1'}">
							<img src="${row.image_url}" alt="" class="card-img-top" />
						</c:when>
						<c:otherwise>
							<img src="${path}/images/${row.image_url}" alt="" class="card-img-top" />
						</c:otherwise>
					</c:choose>
          		</a>
          	</div>
            <div class="card-body">
              <a href="${path }/movie/detail/${row.no}"><h5 class="card-title">${row.title}</h5></a>
              <div class="row">
              	<div class="col-6"><fmt:formatDate value="${row.viewDate}" pattern="yyyy.MM.dd"/></div>
              	<div class="col-6" style="color:orange;"><c:set var="star" value="${row.star}" />
          			<c:choose>
						<c:when test="${star eq '1'}">★☆☆☆☆</c:when>
						<c:when test="${star eq '2'}">★★☆☆☆</c:when>
						<c:when test="${star eq '3'}">★★★☆☆</c:when>
						<c:when test="${star eq '4'}">★★★★☆</c:when>
						<c:when test="${star eq '5'}">★★★★★</c:when>
					</c:choose>
				</div>
              </div>
              <div class="quote"><i class="fas fa-quote-left"></i>
              <span style="font-size:13px; font-weight:600;">${row.quote}</span>
              <i class="fas fa-quote-right"></i></div>
            </div>
          </div>
        </div>
        </c:forEach>
      </div>
    </div>
</div>
<a onclick="popup();">
<div class="floating-action-button u-flex-center">
  <i class="fas fa-plus"></i>
</div>
</a>
</body>
</html>