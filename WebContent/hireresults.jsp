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
	if(currentSession.getAttribute("AvailableCars") != null){
		listCars = (ArrayList<Car>)currentSession.getAttribute("AvailableCars");
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
			out.println("<li class=dropdown><a class=dropdown-toggle data-toggle=dropdown role=button aria-expanded=false>My Account <span class=caret></span></a><ul class='dropdown-menu'><li><a>My Details</a></li>"+"<li><a href=WebController?code=5>Invoices</a></li>"+"<li><a href>Change Password</a></li>"+
					"</ul></li>");
		}
		else{
			
		}
	%>
        <li><a href="WebController?code=1">All Cars</a></li>
        <li><a href="WebController?code=2">Available Cars</a></li> 
        <li><a href="WebController?code=3">Unavailable Cars</a></li> 
      </ul>
      <div class=navbar-right>
      <%
      	if(currentSession.getAttribute("CurrentUser") != null){
			out.println("<a href=WebController?code=4><button type=button class='btn btn-default navbar-btn'>Logout</button></a>");
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
	<div class="col-sm-10 col-sm-offset-1 table-responsive">
		<table class="table table-striped">
			<thead>
				<th>Registration Number</th>
				<th>Make</th>
				<th>Model</th>
				<th>Fuel type</th>
				<th>Engine size</th>
				<th>Group name</th>
				<th>Daily rate</th>
				<th></th>
			</thead>
				<%
					if(listCars == null){
						out.println("<tr align=center><td colspan=7>No results at this time</td></tr>");
					}
					else{
					 out.println("<tbody>");
						for(Car c : listCars){
							out.println("<tr>");
							out.println("<td>"+c.getRegistrationNumber()+"</td>");
							out.println("<td>"+c.getMake()+"</td>");
							out.println("<td>"+c.getModel()+"</td>");
							out.println("<td>"+c.getFuelType()+"</td>");
							out.println("<td>"+c.getEngineSize()+"</td>");
							out.println("<td>"+c.getGroupName()+"</td>");
							out.println("<td>£"+c.getDailyRate()+"</td>");
							//out.println("<td><form method=post action=WebController><input type=hidden value="+c.getRegistrationNumber()+" name=desiredVehicleReg><input type=submit value=Hire></form></td>");
							out.println("</tr>");
						}
					  out.println("</tbody>");
					}
				%>
		</table>
	</div>
</div>
</body>
</html>