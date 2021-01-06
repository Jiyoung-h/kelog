<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Book</title>

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<link href="${path}/resources/movieList.css" rel="stylesheet"
	type="text/css">
<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://kit.fontawesome.com/81816a43c2.js" crossorigin="anonymous"></script>
<%    
    request.setCharacterEncoding("UTF-8");
    String title = request.getParameter("title");
    String author = request.getParameter("author");
    String image = request.getParameter("image");
    String publisher = request.getParameter("publisher");
    String pubdate = request.getParameter("pubdate");
    image = image.replace("type=m1", "");
%>
<script>
	var t = "<%= title %>";
	var a = "<%= author %>";
	var i = "<%= image %>";
	var p = "<%= publisher %>";
	var d = "<%= pubdate %>";
	var year = d.substr(0,4), month = d.substr(4,2), date = d.substr(6,2);
	console.log(year+"-"+month+"-"+date);
	$(document).ready(function() {
        $('#title').val(t);
        $('#author').val(a);
        $('#publisher').val(p);
        $('#pubdate').val(year+"-"+month+"-"+date);
        $('#image').val(i);
        document.getElementById('image_preview').setAttribute("src", i); 
    });
</script>
</head>
<script>
function booklog_write(){
	var title = document.form1.title.value;
	var viewDate = document.form1.viewDate.value;
	var quote = document.form1.quote.value;
	if(title == ""){
		alert("책 제목을 입력해주세요!");
		document.form1.title.focus();
		return;
	}
	if(viewDate == ""){
		alert("독서 완료일을 입력해주세요!");
		document.form1.viewDate.focus();
		return;
	}
	if(quote == ""){
		alert("책을 표현할 한마디를 입력해주세요!");
		document.form1.quote.focus();
		return;
	}
	document.form1.action="${path}/book/insert";
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
		<form id="form1" name="form1" method="post" enctype="multipart/form-data">
		<div class="row">
			<div class="col-4" style="margin: 0 auto;">
				<label for="image" style="z-index: 101;">
				</label> 
				<input type="hidden" name="image_url" id="image"/> 
				<div id="image_container">
					<div style="position: absolute; z-index: 99; padding: 134px 6px;"><i class="fas fa-plus-circle"></i><div>책 표지 사진을 추가하세요.</div></div>
					<img id="image_preview" style="position: relative; z-index: 100; width: 263.8px; height: 373px;"/>
				</div>
			</div>
			<div class="col-6 movie-info" style="margin: 0 auto;">
				<div> <span>제목</span> <input name="title" id="title"> </div>
				<div> <span>장르</span> <input name="genre"> </div>
				<div> <span>출판일</span> <input type="date" id="pubdate" name="releaseDate"> </div>
				<div> <span>작가</span> <input name="author" id="author"> </div>
				<div> <span>출판사</span> <input name="publisher" id="publisher"> </div>
				<div> <span>독서 완료일</span> <input type="date" name="viewDate"> </div>
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
	<a onclick="booklog_write()">
	<div class="floating-action-button u-flex-center">
  	<div style="color:white; font-weight:900;">완료</div>
	</div>
	</a>
</body>
</html>