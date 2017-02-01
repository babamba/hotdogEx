/**
 * @license Copyright (c) 2003-2017, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see LICENSE.md or http://ckeditor.com/license
 */

/*CKEDITOR.editorConfig = function( config ) {
	// Define changes to default configuration here. For example:
	config.language = 'ko';
	config.uiColor = '#AADC6E';

};*/
$(function(){

CKEDITOR.editorConfig = function( config ) {
	// Define changes to default configuration here. For example:
	config.language = 'ko';
	config.uiColor = '#AADC6E';
	filebrowserImageUploadUrl: '${pageContext.request.contextPath }/post/upload';
};
         
});