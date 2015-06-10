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
	HttpSession currentSession = request.getSession();
	ArrayList<Invoice> listInvoices = null;
	if(currentSession.getAttribute("CustomerInvoices") != null){
		listInvoices = (ArrayList<Invoice>)currentSession.getAttribute("CustomerInvoices");
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
	<div class="col-sm-10 col-sm-offset-1">
		<table class="table table-striped">
			<thead>
				<th>ID</th>
				<th>Vehicle Details</th>
				<th>Duration</th>
				<th>Cost</th>

			</thead>
				<%
					if(listInvoices == null){
						out.println("<tr align=center><td colspan=7>You have no invoices</td></tr>");
					}
					else{
					 out.println("<tbody>");
						for(Invoice c : listInvoices){
							out.println("<tr>");
							out.println("<td>"+c.getInvoiceId()+"</td>");
							out.println("<td><div><p>Registration : "+ c.getCarHired().getRegistrationNumber() +"</p><p>Make: " + c.getCarHired().getMake()
											+"<p>Model: " + c.getCarHired().getModel()+"</p><p>Fuel type: " + c.getCarHired().getFuelType() +"</p>"+
											"<p>Engine size: "+ c.getCarHired().getEngineSize() +"</p></div></td>");
							out.println("<td><div><p>Hire Start: "+ c.getDateOut() +"</p><p>Hire End: " + c.getDateIn()
									+"<p>Num of Days: " + c.getNumberOfDays()+"</p></div>");
							out.println("<td><div><p>Daily Cost: £"+ c.getCostPerDay() +"</p><p>Total Cost: " + c.getTotalCost()+"</p></div>");
						}
					  out.println("</tbody>");
					}
				%>
		</table>
	</div>
</div>
</body>
</html>