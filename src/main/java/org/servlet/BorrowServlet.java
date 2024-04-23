package org.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.db.DBConfig;

@WebServlet("/borrow")
public class BorrowServlet extends HttpServlet{
	
	Connection connection = DBConfig.getCon();
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		
		int bookId=Integer.parseInt(request.getParameter("bookId"));
		
		HttpSession session = request.getSession();
		
		int patronId = Integer.parseInt((String) session.getAttribute("patronId"));
	 	Date today = new java.util.Date();
	    SimpleDateFormat sdf = new java.text.SimpleDateFormat("MM/dd/yyyy");
	    java.util.Calendar cal = java.util.Calendar.getInstance();
	    cal.setTime(today);
	    cal.add(java.util.Calendar.DATE, 30);
	    java.util.Date dueDateS = cal.getTime();
	    
	    String borrowDate = sdf.format(today);
	    String dueDate = sdf.format(dueDateS);
	    
	  
	    try{
	    	Statement statement = connection.createStatement();
	    	String insertDataSQL = "INSERT INTO transactions (borrowDate, dueDate, bookId, patronId, status) " +
                     "VALUES ('" + borrowDate + "', '" + dueDate + "', " + bookId + ", " + patronId + ", 'Borrowed')";
	    	statement.executeUpdate(insertDataSQL);
	    	//generateAlert("Booked borrowed successfully, View in Transactions",response);
	    	response.sendRedirect("books.jsp?message=Borrowed book successfully");
	    }catch(SQLException e) {
	    	generateAlert("Borrow book failed",response);
	    	response.sendRedirect("books.jsp?message=Failed to borrow the book");
	    	e.printStackTrace();
	    }
		
		
	}
	
	public void generateAlert(String message, HttpServletResponse response) throws IOException {
		PrintWriter out = response.getWriter();
	        
	        // Write the HTML content with JavaScript alert
	        out.println("<!DOCTYPE html>");
	        out.println("<html>");
	        out.println("<head>");
	        out.println("<title>Window Alert</title>");
	        out.println("</head>");
	        out.println("<body>");
	        
	        // JavaScript code to generate window alert
	        out.println("<script>");
	        out.println("window.onload = function() {");
	        out.println("alert('"+message+"');");
	        out.println("};");
	        out.println("</script>");
	        
	        out.println("</body>");
	        out.println("</html>");
	}
	
}