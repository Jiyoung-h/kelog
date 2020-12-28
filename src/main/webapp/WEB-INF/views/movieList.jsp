<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="https://kit.fontawesome.com/81816a43c2.js" crossorigin="anonymous"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Moive</title>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<link href="${path}/resources/movieList.css" rel="stylesheet" type="text/css">
</head>
<body>
<nav id="sideNav" class="col-lg-3">
	<h1><a href="/">keylog : 기록</a></h1>
	<div class="sidebtn"><a href="/movie" class="btn-1">MOVIE</a></div>
	<div class="sidebtn"><a href="/movie" class="btn-1">BOOK</a></div>
	<div class="sidebtn"><a href="/movie" class="btn-1">ALL</a></div>
</nav>
<div class="col-lg-9" style="margin-left:300px;">
<div class="movielog"><span class="movie">MOVIE</span><span class="log">log</span></div>
<div class="container">
      <div class="row">
      <c:forEach var="row" items="${list}">
        <div class="col-4">
          <div class="card">
          	<div class="row">
          		<img src="${path}/images/${row.image_url}" alt="" class="card-img-top" />
          	</div>
            <div class="card-body">
              <h5 class="card-title">${row.title}</h5>
              <div class="row">
              	<div class="col-6"><fmt:formatDate value="${row.releaseDate}" pattern="yyyy.MM.dd"/></div>
              	<div class="col-6">★★★★★</div>
              </div>
              <div class="quote"><i class="fas fa-quote-left"></i>${row.content}<i class="fas fa-quote-right"></i></div>
            </div>
          </div>
        </div>
        </c:forEach>
      </div>
    </div>
</div>
<a href="movie/write">
<div class="floating-action-button u-flex-center">
  <i class="fas fa-plus"></i>
  </svg>
</div>
</a>
</body>
</html>