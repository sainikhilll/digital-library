package org.servlet;






import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.db.DBConfig;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;


@WebServlet(name = "manageTransactionServlet", urlPatterns = {"/return", "/extend"})
public class ReturnServlet extends HttpServlet {
    Connection con = DBConfig.getCon();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int transactionId = Integer.parseInt(req.getParameter("transactionId"));
        String path = req.getServletPath();
        if(path.equals("/return")) {
        try {
            Statement statement = con.createStatement();
            String sql = "UPDATE transactions SET status = 'Returned' WHERE transactionId="+transactionId+";";
            statement.executeUpdate(sql);
            resp.sendRedirect("transactions.jsp?message= Returned book successfully ");
        } catch (SQLException e) {
            resp.sendRedirect("transactions.jsp?message= Failed to Return book successfully");
            e.printStackTrace();
        }
        }
        if(path.equals("/extend")) {
            try {
                Statement statement = con.createStatement();
            	String dueDate=req.getParameter("dueDate");
            	DateTimeFormatter formatter = DateTimeFormatter.ofPattern("MM/dd/yyyy");

                LocalDate date = LocalDate.parse(dueDate, formatter);

                LocalDate newDueDate = date.plusDays(30);
                DateTimeFormatter outputFormatter = DateTimeFormatter.ofPattern("MM/dd/yyyy");

                String sql = "UPDATE transactions SET status = 'Extended', dueDate ='"+newDueDate.format(outputFormatter)+"' WHERE transactionId ='"+transactionId+"';";
                statement.executeUpdate(sql);
               
                resp.sendRedirect("transactions.jsp?message= Extended book successfully ");
            } catch (SQLException e) {
                resp.sendRedirect("transactions.jsp?message= Failed to Extend book successfully");
                e.printStackTrace();
            }
            }
    }
}
