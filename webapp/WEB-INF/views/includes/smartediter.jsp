<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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
	
	<div id="editer">
		<form action="${pageContext.request.contextPath}/diary/${authUser.nickname}/insert" method="post">
			
			<!-- <textarea name="ir1" id="ir1" rows="10" cols="100" style="width: 1000px; height: px; display: none;" name="content"></textarea> -->
			<textarea name="ir1" id="ir1" rows="10" cols="100" style="width:100%; height:412px; min-width:610px; display:none;"></textarea>
			<p>
				<input type="button" onclick="submitContents(this);" value="서버로 내용 전송" style="color:black;" />
				<input type="button" onclick="setDefaultFont();" value="기본 폰트 지정하기 (궁서_24)" />
			</p>
		</form>
	</div>


</div>


<script type="text/javascript">
	var oEditors = [];

	// 추가 글꼴 목록
	//var aAdditionalFontSet = [["MS UI Gothic", "MS UI Gothic"], ["Comic Sans MS", "Comic Sans MS"],["TEST","TEST"]];

	nhn.husky.EZCreator
			.createInIFrame({
				oAppRef : oEditors,
				elPlaceHolder : "ir1",
				sSkinURI : "${pageContext.request.contextPath}/assets/se/SmartEditor2Skin.html",
				htParams : {
					bUseToolbar : true, // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
					bUseVerticalResizer : true, // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
					bUseModeChanger : true, // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
					//aAdditionalFontList : aAdditionalFontSet,		// 추가 글꼴 목록
					fOnBeforeUnload : function() {
						//alert("완료!");
					}
				}, //boolean
				fOnAppLoad : function() {
					//예제 코드
					//oEditors.getById["ir1"].exec("PASTE_HTML", ["로딩이 완료된 후에 본문에 삽입되는 text입니다."]);
				},
				fCreator : "createSEditor2"
			});

	function pasteHTML() {
		var sHTML = "<span style='color:#FF0000;'>이미지도 같은 방식으로 삽입합니다.<\/span>";
		oEditors.getById["ir1"].exec("PASTE_HTML", [ sHTML ]);
	}

	function showHTML() {
		var sHTML = oEditors.getById["ir1"].getIR();
		alert(sHTML);
	}

	function submitContents(elClickedObj) {
		oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []); // 에디터의 내용이 textarea에 적용됩니다.

		// 에디터의 내용에 대한 값 검증은 이곳에서 document.getElementById("ir1").value를 이용해서 처리하면 됩니다.

		try {
			elClickedObj.form.submit();
		} catch (e) {
		}
	}

	function setDefaultFont() {
		var sDefaultFont = '나눔고딕';
		var nFontSize = 24;
		oEditors.getById["ir1"].setDefaultFont(sDefaultFont, nFontSize);
	}
</script>