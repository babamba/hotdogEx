<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="banner-bg" id="top">


	<%-- ckediter 
	<div id="editor">
		 <form action="${pageContext.request.contextPath}/diary/${authUser.nickname}/insert">
            <textarea name="title">
            
            </textarea>
            
            <textarea name="content" id="editor1" rows="10" cols="80">
                 	펫의 일상을 적어보세요.
            </textarea>
            
            
        <input type="submit" class="btn btn-default" value="posting">
            <script>
                // Replace the <textarea id="editor1"> with a CKEditor
                // instance, using default configuration.
                CKEDITOR.replace( 'editor1',{language:'korean'} );
            </script>

        </form>
		<button class="btn btn-primary">Primary</button>
		<button class="btn btn-info">Info</button>
	</div> --%>
	
	<div id="smartediter">
		<form:form modelAttribute="postVo" action="${pageContext.request.contextPath}/post/${authUser.nickname}/insert" method="post" enctype="multipart/form-data">
			<span>제목:</span>
			<form:input path="title" name="title" />
			<textarea name="content" id="content" rows="10" cols="100" class="smarteditor2"></textarea>
			
			<input class="btn btn-default" type="submit" value="서버로 내용 전송" style="color:white;" />
	
		</form:form>
	</div>


</div>
<script>
	
</script>

<script type="text/javascript">
	var oEditors = [];

	// 추가 글꼴 목록
	//var aAdditionalFontSet = [["MS UI Gothic", "MS UI Gothic"], ["Comic Sans MS", "Comic Sans MS"],["TEST","TEST"]];

	nhn.husky.EZCreator
			.createInIFrame({
				oAppRef : oEditors,
				elPlaceHolder : "content",
				sSkinURI : "${pageContext.request.contextPath}/assets/se2/SmartEditor2Skin.html",
				htParams : {
					bUseToolbar : true, // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
					bUseVerticalResizer : false, // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
					bUseModeChanger : true, // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
					//aAdditionalFontList : aAdditionalFontSet,		// 추가 글꼴 목록
					fOnBeforeUnload : function() {
						//alert("완료!");
					}
				}, //boolean
				fOnAppLoad : function() {
					//예제 코드
					//oEditors.getById["content"].exec("PASTE_HTML", ["로딩이 완료된 후에 본문에 삽입되는 text입니다."]);
				},
				fCreator : "createSEditor2"
			});

	$(function() {
		$("textarea.smarteditor2").each(function() {
			var textareaId = $(this).attr("id");
			se2_init(textareaId);
		});

		$("[type=submit]").click(function() {
			se2_syncData();
		});

	});
	
	function setDefaultFont() {
		var sDefaultFont = '나눔고딕';
		var nFontSize = 24;
		oEditors.getById["content"].setDefaultFont(sDefaultFont, nFontSize);
	}
	
	function se2_syncData() {
		$("textarea.smarteditor2").each(function() {
			var textareaId = $(this).attr("id");
			oEditors.getById[textareaId].exec("UPDATE_CONTENTS_FIELD", []);
		});
	}
	
</script>