<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!-- Navigation -->

	
	<c:choose>
	
	<c:when test="${empty authUser}">
    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
        <div class="container col-md-12">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
               <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
				<span class="sr-only">Toggle navigation</span>
				<i class="icon-menu"></i> Menu
			</button>
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <img src="${pageContext.request.contextPath}/assets/img/hotdog_logo.png"/>
                
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse">
             <!-- Button trigger modal -->
                <div class="top_button col-sm-0 pull-right">
                        <button class="btn btn-danger" data-toggle="modal" data-target="#info">Info</button>
                        <button class="btn btn-success" data-toggle="modal" data-target="#signIn">sign in</button>
                        <button class="btn btn-primary" data-toggle="modal" data-target="#accessTerms">join test</button>
                        <button class="btn btn-primary" data-toggle="modal" data-target="#search">Search</button>
                 </div>
            </div>   
        </div>
        <!-- /.container -->
    </nav>
    </c:when>
   	  <c:otherwise>
	     <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
	        <div class="container col-md-12">
	            <!-- Brand and toggle get grouped for better mobile display -->
	            <div class="navbar-header">
	               <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span>
					<i class="icon-menu"></i> Menu
				</button>
	                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
	                    <span class="sr-only">Toggle navigation</span>
	                    <span class="icon-bar"></span>
	                    <span class="icon-bar"></span>
	                    <span class="icon-bar"></span>
	                </button>
	                <img src="${pageContext.request.contextPath}/assets/img/hotdog_logo.png"/>
	                
	            </div>
	            <!-- Collect the nav links, forms, and other content for toggling -->
	            
	            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse">
	             <!-- Button trigger modal -->
	                <div class="top_button col-sm-0 pull-right">
	                        <button class="btn btn-danger" data-toggle="modal" data-target="#info">Info</button>
	                        <button class="btn btn-info" data-toggle="modal" data-target="#downloads">DownLoad</button>
	                        <button class="btn btn-success" data-toggle="modal" data-target="#logout">Log-out</button>
	                        <button class="btn btn-primary" data-toggle="modal" data-target="#search">Search</button>
	                 </div>
	            </div>   
	        </div>
        <!-- /.container -->
    </nav>

    </c:otherwise>
    
    
    </c:choose>
    
    