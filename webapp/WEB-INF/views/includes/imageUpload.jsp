<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="${pageContext.request.contextPath }/assets/js/min/jquery-1.10.2.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/assets/ckeditor/ckeditor.js"></script>
<script src="${pageContext.request.contextPath}/assets/ckeditor/config.js"></script>

</head>
<body>
		   <script>
           
           window.parent.CKEDITOR.tools.callFunction('${CKEditorFuncNum}', '${pageContext.request.contextPath}'+'${file_path}','전송');
           </script>

</body>
</html>