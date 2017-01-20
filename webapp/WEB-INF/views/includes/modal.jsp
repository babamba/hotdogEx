<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>



 <!--*******************   Modal   **********************-->
    
    <!-- Info Modal -->
    <div class="modal fade" id="info" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="false">
	   <div class="modal-dialog">
		  <div class="modal-content">
            <div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					<i class="material-icons">clear</i>
				</button>
				<h4 class="modal-title">Info</h4>
			</div>
            <div class="modal-body">
				<p>Hot Dog Info</p>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-success btn-simple">More</button>
				<button type="button" class="btn btn-danger btn-simple" data-dismiss="modal">Close</button>
			</div>
		  </div>
	   </div>
    </div>
    <!--  End Modal -->
    
    
    <!-- Downloads Modal -->
    <div class="modal fade" id="downloads" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="false">
	   <div class="modal-dialog">
		  <div class="modal-content">
            <div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					<i class="material-icons">clear</i>
				</button>
				<h4 class="modal-title">Download</h4>
			</div>
            <div class="modal-body">
                <p> App Download view</p>
			</div>
            
              
			<div class="modal-footer">
				<button type="button" class="btn btn-success btn-simple">Link</button>
				<button type="button" class="btn btn-danger btn-simple" data-dismiss="modal">Close</button>
			</div>
		  </div>
	   </div>
    </div>
    <!--  End Modal -->
    
    
    <!-- Sign in Modal -->
    <div class="modal fade" id="signIn" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="false">
	   <div class="modal-dialog">
		  <div class="modal-content">
            <div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					<i class="material-icons">clear</i>
				</button>
				<h4 class="modal-title">Sign in</h4>
			</div>
			
			<form action="${pageContext.request.contextPath}/user/login">
            <div class="modal-body">
				
				
	               <div class="form-group label-floating">
                        <label class="control-label">Email</label>
                        <input type="email" name="email" class="form-control">
	               </div>

                   <div class="form-group label-floating">
                        <label class="control-label">password</label>
                        <input type="password" name="pass_word" class="form-control">
                        <c:if test="${param.result eq 'fail'}">
						<p>로그인이 실패 했습니다.</p>
					</c:if>
	               </div>
             
			</div>
            
           
				<div class="modal-footer">
					<input type="submit" class="btn btn-success btn-simple" value="submit">Enter</button>
					<button type="button" class="btn btn-danger btn-simple" data-dismiss="modal">Close</button>
				</div>
			</form>
               
		  </div>
	   </div>
    </div>
    <!--  End Modal -->
    
  
    
    
    <!-- Logout Modal -->
    <form action="${pageContext.request.contextPath}/user/login">
    <div class="modal fade" id="logout" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="false">
	   <div class="modal-dialog">
		  <div class="modal-content">
            <div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					<i class="material-icons">clear</i>
				</button>
				<h4 class="modal-title">로그아웃 하시겠습니까?</h4>
				
			</div>
            <div class="modal-body">
				<p>Hot Dog Info</p>
			</div>

			<div class="modal-footer">
				<input type="submit" class="btn btn-success btn-simple" value="Log-out" formaction="${pageContext.request.contextPath}/user/logout"></input>
				<button type="button" class="btn btn-danger btn-simple" data-dismiss="modal">Close</button>
			</div>
		  </div>
	   </div>
    </div>
    </form>
    
        <!-- Search Modal -->
    
    <div class="modal fade" id="search" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="false">
      <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
               <i class="material-icons">clear</i>
            </button>
            <h4 class="modal-title">Search</h4>
         </div>
            <div class="modal-body">
              <div class="form-group label-floating">
                        <label class="control-label">i am looking for</label>
                        <input type="email" class="form-control">
                  </div>
       	  </div>     
         <div class="modal-footer">
                <button type="button" class="btn btn-success btn-simple">Search</button>
         </div>
        </div>
      </div>
    </div>


	 <!--  access terms Modal -->
    <div class="modal fade" id="accessTerms" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="false">
	   <div class="modal-dialog">
		  <div class="modal-content">
            <div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					<i class="material-icons">clear</i>
				</button>
				<h4 class="modal-title">이용 약관</h4>
			</div>
				<div class="modal-body">
	            	<div class="checkbox">
						<label>
							<a>약관내용1</a><br>
							<a>약관내용 2</a>
							
							<input type="checkbox" id="accessCheck" name="optionsCheckboxes">
							약관에 동의합니다.
						</label>
					</div>
	               
	               <button id="joinNext" class="btn btn-primary" data-toggle="modal" data-target="#join">Next</button>
				   <button type="button" class="btn btn-danger btn-simple" data-dismiss="modal">Close</button>
				</div>
		  </div>
	   </div>
    </div>
    
     <!-- join Modal -->
    <div class="modal fade" id="join" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="false">
	   <div class="modal-dialog">
		  <div class="modal-content">
            <div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					<i class="material-icons">clear</i>
				</button>
				<h4 class="modal-title">회원 가입</h4>
			</div>
			
			<form action="${pageContext.request.contextPath}/user/join">
			<div id="joinform">
	            	<div class="modal-body">
		               <div class="form-group label-floating">
		                        <label class="control-label">email</label>
		                        <input id="inputEmail" type="email" class="form-control" name="email">
		               </div>
		               <div class="form-group label-floating">
		                        <label class="control-label">password</label>
		                        <input id="inputPassword" type="password" class="form-control" name="pass_word">
		               </div>
		               <div class="form-group label-floating">
		                        <label class="control-label">password</label>
		                        <input id="inputPassword2" type="password" class="form-control">
		               </div>
		               
		               <div class="form-group label-floating">
		                        <label class="control-label">nickname</label>
		                        <input id="inputnickname" type="text" class="form-control" name="nickname">
		               </div>
		               
		               <div class="form-group label-floating">
		                        <label class="control-label">Code</label>
		                        <input id="inputCode" type="text" class="form-control" name="code">
		               </div>
		               
		               <button type="button" id="inputNickCheck" class="btn btn-warning btn-simple" >Nickname Check</button>
		               <button type="button" id="sendMailButton" class="btn btn-success btn-simple">Send Mail</button>		              
					   <button type="button" id="inputCodeCheck" class="btn btn-warning btn-simple" >Code Check</button>
					   <input type="submit" id="joinButton" class="btn btn-warning btn-simple" value="Join" data-toggle="modal" >
					   <button type="button" class="btn btn-danger btn-simple" data-dismiss="modal">Close</button>
					</div>
			</div>
			</form>
			
		  </div>
	   </div>
    </div>
    

    
    <!-- Code Check Modal -->
    <div class="modal fade" id="CodeCheckModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="false">
	   <div class="modal-dialog">
		  <div class="modal-content">
            <div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					<i class="material-icons">clear</i>
				</button>
				<h4 class="modal-title">Code Check</h4>
			</div>
			
			<div id="check">
				<form>
	            	<div class="modal-body">
	            	
		               <div class="form-group label-floating">
		                        <label class="control-label">Input Your Code..</label>
		                        <input id="inputCode" type="text" class="form-control" name="code">
		               </div>
		               
		               <button type="button" id="inputCodeCheck" class="btn btn-warning btn-simple" >Check</button>
		               <button id="checkNext" type="button"  class="btn btn-success btn-simple" data-toggle="modal" data-target="#nickCheckModal" >NEXT</button>
					   <button type="button" class="btn btn-danger btn-simple" data-dismiss="modal">Close</button>
					</div>
				</form>
			</div>
			
		  </div>
	   </div>
    </div>
    
    <!-- nickname Check Modal -->
    <div class="modal fade" id="nickCheckModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="false">
	   <div class="modal-dialog">
		  <div class="modal-content">
            <div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					<i class="material-icons">clear</i>
				</button>
				<h4 class="modal-title">NickName Check</h4>
			</div>
			
			<div id="check">
				<form>
	            	<div class="modal-body">
	            	
		               <div class="form-group label-floating">
		                        <label class="control-label">Input Your NickName..</label>
		                        <input id="inputNickName" type="text" class="form-control" name="code">
		               </div>
		               
		               <button type="button" id="inputNickCheck" class="btn btn-warning btn-simple" >Check</button>
		               <button id="NickCheckNext" type="button"  class="btn btn-success btn-simple" data-toggle="modal" data-target="#nickCheck" >NEXT</button>
					   <button type="button" class="btn btn-danger btn-simple" data-dismiss="modal">Close</button>
					</div>
				</form>
			</div>
			
		  </div>
	   </div>
    </div>
    

    
    
    
    <!--  End Modal -->