<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html >
<head>
  <meta charset="UTF-8">
  <title>Server error 500</title>
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
	<h1>오잉?</h1>
  	<h6>HOT DOG 500 Error</h6>
    <br/>
     <p>
     	 서비스 이용이 원활하지 않습니다.
     </p>
     
     <p style="font-size:14px;"><br /><br />
	    서비스 이용에 불편을 끼쳐 드려 죄송합니다.
	   <br />
	   	잠시 후 해당 서비스를 이용해주시기 바랍니다.
  </div>
</div>
  
  
</body>
</html>
