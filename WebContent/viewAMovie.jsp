<%@page import="dao.BroadcastDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="pojos.Broadcast"%>
<%@page import="pojos.Movie"%>
<%@page import="pojos.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View a movie</title>
<%


	User user = (User) request.getSession().getAttribute("user"); 
	Movie movie =(Movie) request.getSession().getAttribute("selectedMovie");
	
%>
		<style>
		.one{
			border: 1px solid darkslategray;
			font-size: 150%;
		}
		</style>

</head>
<body>

<br><br>
			<div class="one">
				<strong><%= movie.getTitle() %></strong>
				<br><br>
				<img src="getPic?title=<%=movie.getTitle()%>" height="250" width="250">
				<br><br>
				<p><%= movie.getDescription() %></p>
				<br>
				<p>Duration: <%=movie.getDuration() %></p>
				Rating: <%=movie.getRating() %>
				<br>
				<form action="rateMovie" method="post">
					<input type="hidden" name="movieIdToBeRated" value="<%= movie.getId() %>">
					<select name="ratingSelect">
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
						<option value="5">5</option>
						<option value="6">6</option>
						<option value="7">7</option>
						<option value="8">8</option>
						<option value="9">9</option>
						<option value="10">10</option>
					</select>
					<input type="submit" value="rateMovie">
				</form>
				<br>
				
				<br>
				<form action="reserveInterim" method="post">
					<select name="broadcastSelect">
						<% //TODO make it to show Cinema Name and Movie Name
						//and make it to redirect to servlet
						for(Broadcast broadcast : (ArrayList<Broadcast>)BroadcastDao.getInstance().getAllBroadcastsForAMovie(movie)) { %>
							<option value="<%= broadcast.getId() %>"><%="Cinema_id: "+  broadcast.getCinemaId() + ", Broadast_id: " + broadcast.getId() + ", Movie_id: "+ broadcast.getMovieId() %></option>
						<%} %>
					</select>
					<input type="submit" value="Choose Broadcast to book seats for">
				</form>
				<br>
				
			</div>
		<br><br>

</body>
</html>