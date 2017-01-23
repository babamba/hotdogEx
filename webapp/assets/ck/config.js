/**
 * @license Copyright (c) 2003-2017, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see LICENSE.md or http://ckeditor.com/license
 */

CKEDITOR.editorConfig = function( config ) {
	// Define changes to default configuration here. For example:
	// config.language = 'fr';
	// config.uiColor = '#AADC6E';
	
	
	config.toolbar = [ { name: 'document', groups: [ 'mode', 'document', 'doctools' ], items: [ 'Source', 'Preview' ] }, { name: 'clipboard', groups: [ 'clipboard', 'undo' ], items: [ 'Cut', 'Copy', 'Paste', 'PasteText', 'PasteFromWord', '-', 'Undo', 'Redo' ] }, { name: 'insert', items: [ 'Image', 'Flash', 'Table', 'HorizontalRule', 'Smiley', 'SpecialChar', 'PageBreak', 'Iframe' ] }, '/', { name: 'basicstyles', groups: [ 'basicstyles', 'cleanup' ], items: [ 'Bold', 'Italic', 'Underline', 'Strike' ] }, { name: 'paragraph', groups: [ 'list', 'indent', 'blocks', 'align', 'bidi' ], items: [ 'NumberedList', 'BulletedList', '-', 'Outdent', 'Indent', '-', 'Blockquote', '-', 'JustifyLeft', 'JustifyCenter', 'JustifyRight', 'JustifyBlock' ] }, { name: 'links', items: [ 'Link', 'Unlink', 'Anchor' ] }, '/', { name: 'styles', items: [ 'Styles', 'Format', 'Font', 'FontSize' ] }, { name: 'colors', items: [ 'TextColor', 'BGColor' ] } ]; config.enterMode = CKEDITOR.ENTER_P; config.shiftEnterMode = CKEDITOR.ENTER_P; //함수안에 아래 내용 포함 config.font_names = '돋움; Nanum Gothic Coding; 맑은 고딕; 바탕; 궁서; Quattrocento Sans;' + CKEDITOR.config.font_names; // Image Upload Url Setting.... config.filebrowserImageUploadUrl = '/ctrlFolder/CKEditorUpFile/FileUpload.jsp';

	
};
