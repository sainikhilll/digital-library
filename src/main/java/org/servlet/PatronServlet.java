package org.servlet;



import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.db.DBConfig;
import org.model.Patron;



@WebServlet("/patron")
public class PatronServlet extends HttpServlet{
    Connection connection = DBConfig.getCon();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        PrintWriter out = response.getWriter();
        Patron patron = new Patron();
  
        
        patron.setName(request.getParameter("name"));
        patron.setUniversity(request.getParameter("university"));
        patron.setStudentId(Integer.parseInt(request.getParameter("studentId")));
        patron.setEmail(request.getParameter("email"));
        patron.setPassword(request.getParameter("password"));
        patron.setAddress(request.getParameter("address"));
        try {
            Statement statment = connection.createStatement();
            ResultSet rs = statment.executeQuery("select * from Patron where email='"+patron.getEmail()+"'");
            if(rs.next()) {
                response.sendRedirect("message.jsp?msg=Account exsists with given email, Please Login to continue");;
            }else {
                Statement sta = connection.createStatement();
                String query = "INSERT INTO Patron (name, email, password, studentId, address, university) VALUES ('" +
                        patron.getName() + "', '" +
                        patron.getEmail() + "', '" +
                        patron.getPassword() + "', " +
                        patron.getStudentId() + ", '" +
                        patron.getAddress() + "', '" +
                        patron.getUniversity() + "')";
                sta.executeUpdate(query);
                response.sendRedirect("login.jsp");
            }
        } catch (SQLException e) {

            response.sendRedirect("message.jsp?msg= Failed to create account, try again");
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        try {
            Statement statment = connection.createStatement();
            ResultSet rs = statment.executeQuery("select * from Patron where email='"+email+"' and password='"+password+"'");
            if(rs.next()) {
                HttpSession session = request.getSession();
                session.setAttribute("patronId", rs.getString("patronId"));
                session.setAttribute("role", "patron");
                response.sendRedirect("books.jsp");
            }else{
                response.sendRedirect("message.jsp?msg=Invalid Credentials! Please try again with valid credentials");
            }
        } catch (SQLException e) {
            
            e.printStackTrace();
        }
    }

}
