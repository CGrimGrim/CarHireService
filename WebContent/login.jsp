<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ page import="hire.car.a2b.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Hire</title>
	<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
<title>Insert title here</title>
</head>
<body >
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>
		<h1 class="text-center"><span class="glyphicon glyphicon-road"></span> A2B</h1>
		<div class="col-md-8 col-md-offset-2">
		<ul class="nav nav-tab nav-justified">
			<li class="active"> <a href=#login data-toggle="tab">Login</a></li>
			<li> <a href=#register data-toggle="tab">Register</a></li>
		</ul>
		<%
			HttpSession currentSession = request.getSession(true);
		    Customer currentUser = (Customer)currentSession.getAttribute("CurrentUser");
		   	if(currentUser != null){
		   		if(!currentUser.isAuthenticated()){
		   			out.println("<div class='alert alert-danger text-center' role=alert>Login Failed: Username and/or Password is incorrect</div>");
		   		}
		   		else{
		   			response.sendRedirect("home.jsp");
		   		}
		   	}
		   	
		   	
			if(request.getParameter("code") != null){
		   		if(request.getParameter("username").equals("")){
		   			out.println("<div class='alert alert-warning text-center' role=alert>Oops! looks like you didnt enter your Username</div>");
		   		}
		   		else if(request.getParameter("password").equals("")){
		   			out.println("<div class='alert alert-warning text-center' role=alert>Oops! looks like you didnt enter your Password</div>");
		   		   	
		   		}
		   		
		   	}
		%>
		</div><br>
		<div class="tab-content">
		<!--  Login Control -->
		<br><br><div class="col-sm-12 col-sm-offset-2 tab-pane fade active in" id="login">
			<form class="form-horizontal" action="http://localhost:8080/A2BCarHire/WebController" method="post">
				<div class="form-group">
					    <label for="inputEmail3" class="col-sm-2 control-label">Username</label>
					    <div class="col-sm-4">
					      <input name="username" type="text" class="form-control" id="inputEmail3" placeholder="username">
					    </div>
					  </div>
					  <div class="form-group">
					    <label for="inputPassword3" class="col-sm-2 control-label">Password</label>
					    <div class="col-sm-4">
					      <input name="password" type="password" class="form-control" id="inputPassword3" placeholder="password">
					    </div>
					  </div>
					  <div class="form-group">
					    <div class="col-sm-offset-2 col-sm-4">
					      <div class="checkbox">
					        <label>
					          <input type="checkbox"> Remember me
					        </label>
					      </div>
					    </div>
					  </div>
					  <div class="form-group">
					    <div class="col-sm-offset-2 col-sm-8">
					      <button type="submit" class="btn btn-primary col-sm-4">Sign in</button>
					    </div>
					  </div>
				<input type=hidden name=code value=1>
			</form>
		</div>
		
		<!--  Register Control  -->
		<div class="col-sm-12 text-justified tab-pane fade" id=register>
			<div class="row"><br>
				<div class="col-sm-10 col-sm-offset-2">
					<form class="form-horizontal">
					 <div class="col-sm-4">
						<div class="form-group">
						<label class="col-sm-6 form-label">Username</label>
						<input type=text name=username class="form-control">
						</div>
						<div class="form-group">
						<label class="col-sm-6 form-label">Password</label>
						<input type=password name=password class="form-control">
						</div>
						<div class="form-group">
						<label class="col-sm-10 form-label">Confirm Password</label>
						<input type=password name=confpassword class="form-control">
						</div>
						<div class="form-group">
						<label class="col-sm-6 form-label">Name</label>
						<input type=text name=name class="form-control">
						</div>
						<div class="form-group">
						<label class="col-sm-10 form-label">Date of Birth (dd/mm/yyyy)</label>
						<input type=date name=dob class="form-control">
						</div>
					</div>
					<div class="col-sm-4 col-sm-offset-2">
						<div class="form-group">
						<label class="col-sm-8 form-label">Address line 1</label>
						<input type=text name=addressline1 class="form-control">
						</div>
						<div class="form-group">
						<label class="col-sm-8 form-label">Address line 2</label>
						<input type=text name=addressline2 class="form-control">
						</div>
						
						<div class="form-group">
						<label class="col-sm-6 form-label ">City/Town</label>
						<input type=text name=city class="form-control">
						</div>
						<div class="form-group">
						<label class="col-sm-6 form-label">Postcode</label>
						<input type=text name=postcode class="form-control">
						</div>
						<div class="form-group">
						<label class="col-sm-10 form-label">Driving licence Number</label>
						<input type=text name=dlnumber class="form-control">
						</div>
					</div><br>
					<div class="col-sm-6 col-sm-offset-2">
						<input type=submit class="btn btn-primary btn-block" value="Register">
					</div>
					<input type=hidden name=code value=2>
					</form>
				</div>
			</div>
		</div>	
	</div>
	</div>
</body>
</html>