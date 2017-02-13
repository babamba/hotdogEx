/**
 * @license Copyright (c) 2003-2017, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see LICENSE.md or http://ckeditor.com/license
 */

 
CKEDITOR.editorConfig = function( config ) {
	config.language = 'ko';
	config.uiColor = '#f2f2f2';
	config.height = 300;
	config.toolbarCanCollapse = true;
	
	config.enterMode =CKEDITOR.ENTER_BR;		//엔터키 입력시 br 태그 변경
	config.shiftEnterMode = CKEDITOR.ENTER_P;	//엔터키 입력시 p 태그로 변경
	config.image2_alignClasses = [ 'align-left', 'align-center', 'align-right' ];
	config.stylesSet = 'my_styles';
	config.stylesSet = '${pageContext.request.contextPath}/assets/ckeditor/styles.js';
	config.image2_alignClasses = [ 'image-left', 'image-center', 'image-right' ];
	config.image2_captionedClass = 'image-captioned';
	config.removeButtons ='';
	config.font_names = "굴림;돋움;바탕;궁서;굴림체;돋움체;바탕체;궁서체;나눔고딕;나눔명조;"+
	'Arial;Comic Sans MS;Courier New;Lucida Sans Unicode;monospace;sans-serif;serif;Tahoma;Times New Roman;Verdana';
	config.removeDialogTabs = 'image:advanced;link:advanced';
	config.tabIndex = 1;	// 에디트 안에서 탭 사용하기
	config.tabSpaces = 4;	// 탭 칸수
	config.allowedContent = true;

	/*config.extraPlugins = 
		'widget',
		'uploadimage';
	*/
};

