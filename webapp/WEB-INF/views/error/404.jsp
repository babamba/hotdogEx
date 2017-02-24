<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html >
<head>
  <meta charset="UTF-8">
  <title>Page not found 404</title>
  <link href='https://fonts.googleapis.com/css?family=Varela+Round' rel='stylesheet' type='text/css'>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">

  <link rel='stylesheet prefetch' href='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css'>

      <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/error.css">

  
</head>

<body>
  <div class="container">
  <div class="boo-wrapper">
    <div class="boo">
      <div class="face"></div>
    </div>
    <div class="shadow"></div>

    <h1>HOT DOG 404 ERROR</h1>
    <h6>HOT DOG <span>404</span> Not Found</h6>
    <br/>
    <p>
     	 페이지를 찾을 수가 없어요!
     </p>
     <p style="font-size:13px;">
      <br />
      <br />
        존재하지 않는 주소를 입력하셨거나
        <br />
    요청하신 페이지의 주소가 변경, 삭제되어  <br />
    찾을 수 없습니다.
  	 </p>
  </div>
</div>
  
  
</body>
</html>
