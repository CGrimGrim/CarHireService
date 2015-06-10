<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Hire</title>
	<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
<title>Insert title here</title>
</head>
<body style="background-image: url(resources/CarBackgroundImage.jpg); background-size: 100%; background-repeat: no-repeat">
<%
	HttpSession currentSession = request.getSession(false);
%>
<nav class="navbar navbar-default">
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="home.jsp"><span class="glyphicon glyphicon-road"></span> A2B </a>
  
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
       	<%
		if(currentSession.getAttribute("CurrentUser") != null){
			out.println("<li><a href=account.jsp>My Account</a></li>");
		}
		else{
			
		}
	%>
        <li><a href="#">All Cars</a></li>
        <li><a href="#">Available Cars</a></li> 
        <li><a href="#">Unavailable Cars</a></li> 
      </ul>
      <div class=navbar-right>
      <%
      	if(currentSession.getAttribute("CurrentUser") != null){
			out.println("<button type=button class='btn btn-default navbar-btn' onClick=login.jsp>Logout</button>");
      	}
      	else{
      		out.println("<a href=login.jsp><button type=button class='btn btn-default navbar-btn'>Login/Register</button></a>");
      	}
      %>	
      </div>
      
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>
<div class="row">
	<div class="col-sm-6">
	</div>
	<div class="col-sm-6">	
		<form class="col-sm-8 col-sm-offset-2">
		<div class="panel panel-default" style="opacity: 0.85;">
		<div class="panel-heading"> <h4 class="text-left">Hire a Car</h4> </div>
		<div class="panel-body">
			<div class="form-group">
				<label>Start Date</label>
				<input type="date" class="form-control" name="hireStartDate">
			</div>
			<div class="form-group">
				<label>End Date</label>
				<input type="date" class="form-control" name="hireEndDate">
			</div>
			<div class="form-group">
				<label>Car Category</label>
				<select class="form-control" name="carCategory">
						<option value=1>A</option>
						<option value=2>B</option>
						<option value=3>C</option>
						<option value=4>D</option>
						<option value=5>Any</option>
				</select>
			</div>
			<div class="form-group">
				<input type="submit" class="btn btn-default btn-block" value="submit">
			</div>
			</div>
			 </div>
		</form>
		</div>
 </div>

</body>
</html>