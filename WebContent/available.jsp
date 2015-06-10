<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*"
		 import="hire.car.a2b.*" %>
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
<body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>
<%
	HttpSession currentSession = request.getSession(false);
	ArrayList<Car> listCars = null;
	String title = "Results";
	if(currentSession.getAttribute("AvailableCars") != null){
		listCars = (ArrayList<Car>)currentSession.getAttribute("AvailableCars");
		title = "Cars available today";
	}
	else if(currentSession.getAttribute("UnavailableCars") != null){
		listCars = (ArrayList<Car>)currentSession.getAttribute("UnavailableCars");
		title = "Cars currently on hire";
	}
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
			out.println("<ui><a href=account.jsp>My Account</a>"+"<li>Invoices</li>"+"<li>Change Password</li>"+
						"</ui>");
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
      		out.println("<button type=button class='btn btn-default navbar-btn'>Login</button>");
      		out.println("<a href=#><button type=button class='btn btn-default navbar-btn'>Register</button>");
      	}
      %>
      </div>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>
<div class="row">
	<div class="col-sm-8">
		<table class="table-striped ">
			<thead>
				<th><% out.println(title); %></th>
			</thead>
			<tbody>
				<%
					if(listCars == null){
						out.println("No Cars at this time");
					}
					else{
						for(Car c : listCars){
							out.println("<tr>");
							out.println("<tb>"+c.getRegistrationNumber()+"</tb>");
							out.println("<tb>"+c.getMake()+"</tb>");
							out.println("<tb>"+c.getModel()+"</tb>");
							out.println("<tb>"+c.getFuelType()+"</tb>");
							out.println("<tb>"+c.getEngineSize()+"</tb>");
							out.println("<tb>"+c.getGroupName()+"</tb>");
							out.println("<tb>"+c.getDailyRate()+"</tb>");
							out.println("</tr>");
						}
					}
				%>
			</tbody>
		</table>
	</div>
</div>
</body>
</html>