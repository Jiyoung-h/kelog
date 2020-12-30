<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<input id="bookName" value="" type="text">
    <button id="search">검색</button>
    <p></p>

        $(document).ready(function () {
            $("#search").click(function () {
                $.ajax({
                    method: "GET",
                    url: "https://dapi.kakao.com/v3/search/book?target=title",
                    data: { query: $("#bookName").val() },
                    headers: { Authorization: "KakaoAK 4843d1117b75ed09579c8dbc3255710a" }
                })
                    .done(function (msg) {
                        console.log(msg.documents[0].title);
                        console.log(msg.documents[0].thumbnail);
                        $("p").append("<strong>" + msg.documents[0].title + "</strong>");
                        $("p").append("<img src='" + msg.documents[0].thumbnail + "'/>");
                    });
            });
        });
    </script>
</body>
</html>