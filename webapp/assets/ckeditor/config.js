/**
 * @license Copyright (c) 2003-2017, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see LICENSE.md or http://ckeditor.com/license
 */

CKEDITOR.editorConfig = function( config ) {
	// Define changes to default configuration here. For example:
	config.uiColor = '#AADC6E';
	config.enterMode = CKEDITOR.ENTER_BR;
    config.startupFocus = false;
    if(isIE()){
        config.filebrowserBrowseUrl = '${pageContext.request.contextPath }/post/upload';
    }else{
        config.filebrowserBrowseUrl = '${pageContext.request.contextPath }/post/upload';
    }
    config.filebrowserImageUploadUrl = '${pageContext.request.contextPath }/post/upload';
    config.filebrowserUploadUrl = '${pageContext.request.contextPath }/post/upload';
    config.filebrowserWindowWidth = '10';
    config.filebrowserWindowHeight = '10';
    config.selectMultiple = true;
    
    config.toolbar = [
                      ['Font', 'FontSize'],
                      ['BGColor', 'TextColor' ],
                      ['Bold', 'Italic', 'Strike', 'Superscript', 'Subscript', 'Underline', 'RemoveFormat'],   
                      ['BidiLtr', 'BidiRtl'],
                      '/',
                      ['Image', 'SpecialChar', 'Smiley'],
                      ['JustifyLeft', 'JustifyCenter', 'JustifyRight', 'JustifyBlock'],
                      ['Blockquote', 'NumberedList', 'BulletedList'],
                      ['Link', 'Unlink'],
                      ['Source'],
                      ['Undo', 'Redo']
              ];
    
};

CKEDITOR.on( 'dialogDefinition', function( ev ){
    // Take the dialog name and its definition from the event data.
    var dialogName = ev.data.name;
    var dialogDefinition = ev.data.definition;
    // Check if the definition is from the dialog we're
    // interested in (the 'image' dialog). This dialog name found using DevTools plugin
    if ( dialogName == 'image' ){
        // Remove the 'Link' and 'Advanced' tabs from the 'Image' dialog.
        dialogDefinition.removeContents( 'Link' );    //링크 탭 제거
        dialogDefinition.removeContents( 'advanced' );  //상세정보 탭 제거

        // Get a reference to the 'Image Info' tab.
        var infoTab = dialogDefinition.getContents( 'info' );  //info탭을 제거하면 이미지 업로드가 안된다.
        // Remove unnecessary widgets/elements from the 'Image Info' tab.
        infoTab.remove( 'txtHSpace'); //info 탭 내에 불필요한 엘레멘트들 제거
        infoTab.remove( 'txtVSpace');
        infoTab.remove( 'txtBorder');
        infoTab.remove( 'txtWidth');
        infoTab.remove( 'txtHeight');
        infoTab.remove( 'ratioLock');
    }
});

