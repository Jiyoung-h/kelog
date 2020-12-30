<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
$(function(){
	function search(query, start){
		$.ajax({
			type: "post",
			url: "search_result",
			data: param={"query":query, "start":start},
			success: function(result){
				var jsonObj = JSON.parse(result);
				var title = "";
				var titleurl = "";
				var director = "";
				var actor = "";
				var directorurl = "";
				console.log(jsonObj);
				$(".list").remove();
				for(var i in jsonObj.items){
					title = jsonObj.items[i].title.replace(/<b>|<\/b>/g, "");
					director = jsonObj.items[i].director.replace(/\|/g, "");
					actor = jsonObj.items[i].actor.replace(/\|/g, ", ");
					titleurl = encodeURI(title);
					directorurl = encodeURI(director);
					actorurl = encodeURI(actor);
					imageurl = encodeURI(jsonObj.items[i].image);
					$("#result").append(
							"<a href='/movie/write?title=" + titleurl 
							+ "&director=" + directorurl
							+ "&image=" + imageurl 
							+ "&actor=" + actorurl + "'>"
							+ "<div class='list'>"
							+ title
							+ director
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
<h2>영화 검색</h2>
검색어를 입력하세요 : <input id="query">
<input type="button" id="button1" value="확인">
<div id="result">

</div>
<input type="button" id="previous" value="이전">
<input type="button" id="next" value="다음">
</body>
</html>