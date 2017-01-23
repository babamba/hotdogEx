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
            <th>title</th>
            <th class="text-right">공개 설정</th>
            <th class="text-right">Actions</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td class="text-center">1</td>
            <td>${post.title }post title</td>
            <td>${post.regdate }post regdate</td>
            <td class="text-right">${post.publish} publish </td>
            <td class="td-actions text-right">
                <button type="button" rel="tooltip" title="View Profile" class="btn btn-info btn-simple btn-xs">
                    <i class="fa fa-user"></i>
                </button>
                <button type="button" rel="tooltip" title="Edit Profile" class="btn btn-success btn-simple btn-xs">
                    <i class="fa fa-edit"></i>
                </button>
                <button type="button" rel="tooltip" title="Remove" class="btn btn-danger btn-simple btn-xs">
                    <i class="fa fa-times"></i>
                </button>
            </td>
        </tr>


    </tbody>
</table>
</div>

