<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Moive</title>

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<link href="${path}/resources/movieList.css" rel="stylesheet"
	type="text/css">
<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://kit.fontawesome.com/81816a43c2.js" crossorigin="anonymous"></script>
<%    
    request.setCharacterEncoding("UTF-8");
    String title = request.getParameter("title");
    String director = request.getParameter("director");
    String image = request.getParameter("image");
    String actor = request.getParameter("actor");
    String pubDate = request.getParameter("pubDate");
    image = image.replace("type=m1", "");
%>
<script>
	var t = "<%= title %>";
	var d = "<%= director %>";
	var i = "<%= image %>";
	var a = "<%= actor %>";
	var p = "<%= pubDate %>";
	$(document).ready(function() {
        $('#title').val(t);
        $('#director').val(d);
        $('#actor').val(a);
        $('#pubDate').val(p +"-01-01");
        $('#image').val(i);
        document.getElementById('image_preview').setAttribute("src", i); 
    });
</script>
</head>
<script>
function movielog_write(){
	var title = document.form1.title.value;
	var viewDate = document.form1.viewDate.value;
	var quote = document.form1.quote.value;
	if(title == ""){
		alert("영화 제목을 입력해주세요!");
		document.form1.title.focus();
		return;
	}
	if(viewDate == ""){
		alert("영화를 관람한 날을 입력해주세요!");
		document.form1.viewDate.focus();
		return;
	}
	if(quote == ""){
		alert("영화를 표현할 한마디를 입력해주세요!");
		document.form1.quote.focus();
		return;
	}
	document.form1.action="${path}/movie/insert";
	document.form1.submit();
}
</script>
<body>
	<nav id="sideNav" class="col-lg-3">
		<h1>
			<a href="/">keylog : 기록</a>
		</h1>
		<div class="sidebtn">
			<a href="/movie" class="btn-1">MOVIE</a>
		</div>
		<div class="sidebtn">
			<a href="/movie" class="btn-1">BOOK</a>
		</div>
		<div class="sidebtn">
			<a href="/movie" class="btn-1">ALL</a>
		</div>
	</nav>
	<div class="col-lg-9" style="margin-left: 300px;">
		<div class="movielog">
			<span class="movie">MOVIE</span><span class="log">log</span>
		</div>
		<div class="container">
		<form id="form1" name="form1" method="post" enctype="multipart/form-data">
		<div class="row">
			<div class="col-4" style="margin: 0 auto;">
				<label for="image" style="z-index: 101;">
				</label> 
				<input type="hidden" name="image_url" id="image"/> 
				<div id="image_container">
					<div style="position: absolute; z-index: 99; padding: 134px 6px;"><i class="fas fa-plus-circle"></i><div>영화 포스터 사진을 추가하세요.</div></div>
					<img id="image_preview" style="position: relative; z-index: 100; width: 263.8px; height: 373px;"/>
				</div>
			</div>
			<div class="col-6 movie-info" style="margin: 0 auto;">
				<div> <span>제목</span> <input name="title" id="title"> </div>
				<div> <span>장르</span> <input name="genre"> </div>
				<div> <span>개봉일</span> <input type="date" id="pubDate" name="releaseDate"> </div>
				<div> <span>감독</span> <input name="director" id="director"> </div>
				<div> <span>배우</span> <input name="actor" id="actor"> </div>
				<div> <span>장소</span> <input name="place"> </div>
				<div> <span>관람일</span> <input type="date" name="viewDate"> </div>
				<div> <span>같이 본 사람</span> <input name="withwho"> </div>
				<div> <span>나의 한마디</span> <input name="quote"> </div>
				<div> <span>별점</span> 
					<select name="star">
					  <option value="1">★</option>
					  <option value="2">★★</option>
					  <option value="3">★★★</option>
					  <option value="4">★★★★</option>
					  <option value="5">★★★★★</option>
					</select> 
				</div>
			</div>
		</div>
		<div style="width: fit-content; margin: 25px auto;">
			<div class="memo">메모</div>
			<textarea rows="3" cols="60" name="content" id="content"></textarea>
		</div>
			<input type="hidden" name="search" value="1">
		</form>
		</div>
	</div>
	<a onclick="movielog_write()">
	<div class="floating-action-button u-flex-center">
  	<div style="color:white; font-weight:900;">완료</div>
	</div>
	</a>
</body>
</html>