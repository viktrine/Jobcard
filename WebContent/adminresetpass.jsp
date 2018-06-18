<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
	<html lang="en">
	<head>
	  	<title>Admin reset</title>

		<jsp:include page="cdn.jsp" />
	      
	</head>
	
	<body>
	<div class="container">
	
	<%
		if (request.getSession(false).getAttribute("adminLog") == null)
		{
			request.getSession(true).setAttribute("loginFirst", "Please login to proceed");
			response.sendRedirect("/jobcard/adminlogin.jsp");
			return;
		}
	%>
		<jsp:include page="menuadmin.jsp" />
		
		<c:if test="${not empty pinError}">
    		<p><font color="FF0000">Give an integer PIN</font></p>
    		<c:remove var="pinError" scope="session" />
		</c:if>
		
		<c:if test="${not empty randPass}">
    		<p><font color="FF0000"><c:out value="${sessionScope.randPass}"/></font></p>
    		<c:remove var="randPass" scope="session" />
		</c:if>
		
		<c:if test="${not empty nullError}">
    		<p><font color="FF0000"><c:out value="${sessionScope.nullError}"/></font></p>
    		<c:remove var="nullError" scope="session" />
		</c:if>
		
		<c:if test="${not empty EmailError}">
    		<p><font color="FF0000"><c:out value="${sessionScope.EmailError}"/></font></p>
    		<c:remove var="EmailError" scope="session" />
		</c:if>
		
		<c:if test="${not empty updateSucess}">
    		<p><font color="000000">New Pass: <c:out value="${sessionScope.updateSucess}"/></font></p>
    		<c:remove var="updateSucess" scope="session" />
		</c:if>
		
		<c:if test="${not empty ResetError}">
    		<p><font color="FF0000"><c:out value="${sessionScope.ResetError}"/></font></p>
    		<c:remove var="ResetError" scope="session" />
		</c:if>
		
		<c:if test="${not empty databaseConnectionError}">
    		<p><font color="FF0000"><c:out value="${sessionScope.databaseConnectionError}"/></font></p>
    		<c:remove var="databaseConnectionError" scope="session" />
		</c:if>
		
    	<div class="row">
			<div class="col-md-6 col-md-offset-3">
				<div class="panel panel-login">
					<div class="panel-heading">
						<div class="row">
							<div class="col-xs-12">
								<center><label>Admin Password Recovery</label></center>
							</div>
						</div>
						<hr>
					</div>
					<div class="panel-body">
						<div class="row">
							<div class="col-lg-12">
								<form id="login-form" action="AdminPassrecovery" method="post" style="display: block;">
									<div class="form-group">
										<input type="email" name="useremail" tabindex="1" class="form-control" placeholder="email">
									</div>
									<div class="form-group">
										<input type="password" name="pin" tabindex="2" class="form-control" placeholder="Password recovery pin">
									</div>
									
									<div class="form-group">
										<div class="row">
											<div class="col-sm-6 col-sm-offset-3">
												<input type="submit" name="login-submit" id="login-submit" tabindex="4" class="form-control btn btn-login" value="Reset">
											</div>
										</div>
									</div>
									
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		</div>
	</body>
	
</html>