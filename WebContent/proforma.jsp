<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %><%@ page import="java.io.IOException,java.io.PrintWriter,java.sql.*,java.sql.Connection,java.io.IOException,java.sql.PreparedStatement,
java.sql.ResultSet,javax.servlet.ServletException,javax.servlet.annotation.WebServlet,javax.servlet.http.HttpServlet,
javax.servlet.http.HttpServletRequest,javax.servlet.http.HttpServletResponse,java.util.Date"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
	<html lang="en">
	<head>
	
	  <title>Proforma</title>
	  		<jsp:include page="cdn.jsp" />
	  		<script src="times.js"></script>
	      
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
			
		<c:if test="${not empty nullError}">
    		<p><font color="FF0000"><c:out value="${sessionScope.nullError}"/></font></p>
    		<c:remove var="nullError" scope="session" />
		</c:if>
		
		<c:if test="${not empty dateError}">
    		<p><font color="FF0000"><c:out value="${sessionScope.dateError}"/></font></p>
    		<c:remove var="dateError" scope="session" />
		</c:if>
		
		<c:if test="${not empty loginFirst}">
    		<p><font color="FF0000"><c:out value="${sessionScope.loginFirst}"/></font></p>
    		<c:remove var="loginFirst" scope="session" />
		</c:if>
		
		<c:if test="${not empty noRecord}">
    		<p><font color="FF0000"><c:out value="${sessionScope.noRecord}"/></font></p>
    		<c:remove var="noRecord" scope="session" />
		</c:if>
		
		<%
		
		 // Register JDBC driver
	  	  Class.forName("com.mysql.jdbc.Driver");
	  	  
	  	  // Open a connection
	  	  Connection con = DriverManager.getConnection("jdbc:mysql://node9334-jobcard.p4d.click/Fixed","root","XDEbyt28426");
	  	  
	  	  // Execute SQL query
  	  
  	  	  PreparedStatement ps = con.prepareStatement("select * from contractorDetails");
  	  
  	  //java.sql.Statement stmt = con.createStatement();
  	  
  	  ResultSet rs = (ResultSet) ps.executeQuery();
		%>
			<div class="row">
			<div class="col-md-6 col-md-offset-3">
				<div class="panel panel-login">
					<div class="panel-heading">
						<div class="row">
							<div class="col-xs-12">
								<center><label>Proforma Category</label></center>
							</div>
						</div>
						<hr>
					</div>
					<div class="panel-body">
						<div class="row">
							<div class="col-lg-12">
								<form id="login-form" action="Proforma" method="post" style="display: block;">
								<label>Contractor</label>
									<div class="form-group">
										<div id="mySelect">
				      						<select style="width: 200px;" name="contractor">
				      						
						      					<option selected disabled>Contractor</option>	
						      					<% while(rs.next()){ %>
						      					
						      						<option><%= rs.getString(2)%></option>	
						      					
						      					<%}%>
											</select> 
										</div>
									</div>
									<div class="form-group">
									<label>From</label>
										<input type="date" name="datefrom"  class="form-control" placeholder="start date">
									</div>
									
									<div class="form-group">
									<label>To</label>
										<input type="date" name="dateto" class="form-control" placeholder="last date">
									</div>
									
									<div class="form-group">
										<div class="row">
											<div class="col-sm-6 col-sm-offset-3">
												<input type="submit" name="login-submit" id="login-submit" tabindex="4" class="form-control btn btn-login" value="Print Proforma">
											</div>
										</div>
									</div>
									<div class="form-group">
										<div class="row">
											<div class="col-lg-12">
												
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