<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


	
<div class="banner-bg" id="top">
<table class="table" id="post_list">
    <thead>
        <tr>
            <th class="text-center">#</th>
            <th>title</th>
            <th>date</th>
            <th>content</th>
            <th class="text-right">공개 설정</th>
            <th class="text-right">Actions</th>
        </tr>
    </thead>
    <tbody class="post_ajax" data-id="${no}">
          
    </tbody>
</table>
</div>