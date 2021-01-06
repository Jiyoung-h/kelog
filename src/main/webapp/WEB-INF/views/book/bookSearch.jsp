<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<link href="${path}/resources/movieList.css" rel="stylesheet"
	type="text/css">
<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://kit.fontawesome.com/81816a43c2.js" crossorigin="anonymous"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
$(function(){
	function search(query, start){
		$.ajax({
			type: "post",
			url: "bookSearch_result",
			data: param={"query":query, "start":start},
			success: function(result){
				var jsonObj = JSON.parse(result);
				console.log(jsonObj);
				$(".list").remove();
				for(var i in jsonObj.items){
					title = jsonObj.items[i].title.replace(/<b>|<\/b>/g, "");
					author = jsonObj.items[i].author.replace(/\|/g, "");
					publisher = jsonObj.items[i].publisher.replace(/\|/g, ", ");
					
					titleurl = encodeURI(title);
					authorurl = encodeURI(author);
					publisherurl = encodeURI(publisher);
					imageurl = encodeURI(jsonObj.items[i].image);
					dateurl = encodeURI(jsonObj.items[i].pubdate);
					
					$("#result").append(
							"<a href='/book/write?title=" + titleurl 
							+ "&author=" + authorurl
							+ "&image=" + imageurl 
							+ "&publisher=" + publisherurl
							+ "&pubdate=" + dateurl + "'>"
							+ "<div class='list'>"
							+ "<div class='title'>"
							+ title
							+ "</div>"
							+ author
							+ "</div>"
							+ "</a>"
					);
				}
			}
		});
	};
	var start = 1;
	$('#button1').click(function(){
		query=$('#query').val();
		search(query, start);
	});
	$('#next').click(function(){
		start = start + 10;
		search(query, start);
	});
	$('#previous').click(function(){
		start = start - 10;
		search(query, start);
	});
	
});
</script>
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
<div class="col-lg-9" style="margin-left:300px;">
<div class="movielog"><span class="movie">BOOK</span><span class="log">search</span></div>

<div class="container">
      <div class="row">
		<b>책 제목을 입력하세요</b> : <input id="query">
		<button type="submit" id="button1" ><i class="fas fa-search"></i></button>
		
      </div>
      <div id="result"></div>
      <div class="buttons">
	      <button type="submit" id="previous" ><i class="fas fa-angle-left"></i></button>
	      <button type="submit" id="next"><i class="fas fa-angle-right"></i></button>
      </div>
    </div>
</div>

</body>
</html>