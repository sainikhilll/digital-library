package org.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.db.DBConfig;
import org.model.Patron;


@WebServlet("/manageProfile")
public class ManageProfile extends HttpServlet {
	
	Connection con = DBConfig.getCon();
	 @Override
	 protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	       
	try {
		Statement statement = con.createStatement();
		Patron patron = new Patron();
		
		 
        patron.setName(request.getParameter("name"));
        patron.setUniversity(request.getParameter("university"));
        patron.setStudentId(Integer.parseInt(request.getParameter("studentId")));
        patron.setEmail(request.getParameter("email"));
        patron.setPassword(request.getParameter("password"));
        patron.setAddress(request.getParameter("address"));
        
        String query = "UPDATE patron SET " +
                "name='" + patron.getName() + "', " +
                "university='" + patron.getUniversity() + "', " +
                "studentId=" + patron.getStudentId() + ", " +
                "email='" + patron.getEmail() + "', " +
                "password='" + patron.getPassword() + "', " +
                "address='" + patron.getAddress() + "' " +
                "WHERE patronId=" + patron.getPatronId();
        statement.executeUpdate(query);
        response.sendRedirect("manageProfile.jsp?message= Updated Profile Successfully ");
		
	}catch(SQLException e){
		response.sendRedirect("manageProfile.jsp?message= Failed to update profile, Try Again ");
		e.printStackTrace();
	}
	
	 }
}
