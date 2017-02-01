<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>




<div class="banner-bg" id="top">
	<form action="${pageContext.request.contextPath }/post/${authUser.nickname}/insert" method="post">
	 	<textarea class="form-control" name="title" placeholder="제목을 입력하세요." rows="1" style="font-size:20px"></textarea>
	 	<textarea id="summernote"  name=content>
	 	
	 	
	 	</textarea>
	 	
	 	
		<input type="submit" class="btn btn-default">	
	</form>
	
</div>


<script>


/* $('#summernote').summernote({
	onImageUpload : function(files, editor, welEditable) {
        sendFile(files[0], editor, welEditable);  
    },
	height : 700, // set editor height
	minHeight : 100, // set minimum height of editor
	maxHeight : null, // set maximum height of editor
	lang : 'ko-KR', // default: 'en-US'
	
	
	 
});

function sendFile(files, editor, welEditable) {
    data = new FormData();
    
    data.append("file", files);
    
    alert("file upload" + files);
    
    $.ajax({
        data : data,
        type : "POST",
        url : "${pageContext.request.contextPath }/post/upload",
        contentType : false,
        processData : false,
        success : function(data) {
        	console.log(data);
            editor.insertImage(welEditable, data);
        }
    });
}  */

/* $(function(){
	$('#summernote').summernote({
		height : 700, // set editor height
		minHeight : 100, // set minimum height of editor
		maxHeight : null, // set maximum height of editor
		lang : 'ko-KR', // default: 'en-US'
		onImageUpload : function(files, editor, welEditable) {
	        sendFile(files[0], editor, welEditable);  
		callbacks:{
			
		    }
		}
	});
	
	function sendFile(files, editor, welEditable) {
	    data = new FormData();
	    
	    data.append("file", files);
	    
	    alert("file upload" + files);
	    
	    $.ajax({
	        data : data,
	        type : "POST",
	        url : "${pageContext.request.contextPath }/post/upload",
	        contentType : false,
	        processData : false,
	        success : function(data) {
	        	console.log(data);
	        	
	        	var image = $('<img>').attr('src',  + data.data);
	        	$("#summernote").summernote("insertNode", image[0]);
	        	
	            editor.insertImage(welEditable, data.data);
	        }, error: function(jqXHR, textStatus, errorThrown){
	        	console.log(textStatus+ "" + errorThrown)
	        }
	    });
	}
}) */
 

	$(document).ready(function(){
		$('#summernote').summernote({
		height: 300, 
		height : 700, // set editor height
		minHeight : 100, // set minimum height of editor
		maxHeight : null, // set maximum height of editor
		lang : 'ko-KR', // default: 'en-US'
		callbacks : {
		onImageUpload : function(files, deitor, welEditable){
			console.log(files);
			
			data = new FormData();
			data.append("file", files[0]);
			
			var $note = $(this);
			
			$.ajax({
		        data : data,
		        type : "POST",
		        url : "${pageContext.request.contextPath }/post/upload",
		        contentType : false,
		        processData : false,
		        success : function(data) {
		        	console.log(data.data);
		        	$note.summernote(data.data)
		    	  	  }
				});
			
			}
			}
		
		})
	})
		





</script>