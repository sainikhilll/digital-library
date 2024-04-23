<%@ include file="patronnav.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="org.model.Transaction" %>
<%@ page import="org.service.TransactionService" %>
<%@ page import="java.util.List" %>
<%@ page import="javax.servlet.http.HttpSession" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Transaction Details</title>
    <style>
        .card {
            display: flex;
            flex-direction: row;
            border: 1px solid #ccc;
            margin-bottom: 10px;
            padding: 10px;
            width: 100%;
            height: 200px; /* Fixed height for each card */
        }

        .image {
            flex: 30%;
            margin-right: 10px;
            overflow: hidden; /* Prevent image overflow */
        }

        .image img {
            max-width: 100%;
            max-height: 100%; /* Make sure image fits within the card */
            object-fit: cover; /* Maintain aspect ratio and cover the container */
        }

        .details {
            flex: 50%;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
        }

        .buttons {
            flex: 20%;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
        }
    </style>
</head>
<body>
<%
        String param = request.getParameter("message");
        if(param != null && !param.isEmpty()) {
    %>
    <script>
        alert("<%=param%>");
    </script>
    <%
        }
    %>
<%
    TransactionService transactionService = new TransactionService();
    
    int patronId = Integer.parseInt((String) session.getAttribute("patronId"));
    // Assuming transactions is a List<Transaction> obtained from the database
    List<Transaction> transactions = transactionService.getAllTransactions(patronId);

    for (Transaction transaction : transactions) {
%>

<div class="row">
<div class="col-md-2"></div>
	<div class="col-md-8">
    <div class="card">
        <div class="image">
            <img src="<%= transaction.getImage() %>" alt="Book Image">
        </div>
        <div class="details">
            <p><b>Title:</b> <%= transaction.getTitle() %></p>
            <p><b>Author:</b> <%= transaction.getAuthor() %></p>
            <p><b>Borrow Date:</b> <%= transaction.getBorrowDate() %></p>
            <p><b>Due Date:</b> <%= transaction.getDueDate() %></p>
            <p><b>Status:</b> <%= transaction.getStatus() %></p>
        </div>
        <div class="buttons">
            <% if(!transaction.getStatus().equals("Returned")) { %>
                <a href="extend?transactionId=<%= transaction.getTransactionId() %>&dueDate=<%= transaction.getDueDate() %>" class="btn btn-primary">Extend</a>
                <a href="return?transactionId=<%= transaction.getTransactionId() %>" class="btn btn-primary">Return</a>
            <% } %>
            
        </div>
    </div>
    </div>
    </div>

<% } %>

</body>
</html>
