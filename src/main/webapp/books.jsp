<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="org.service.BookService" %>
<%@ page import="org.model.Book" %>
<%@ include file="patronnav.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Books</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
 <%
        String param = request.getParameter("message");
        if(param != null && !param.isEmpty()) {
    %>
    <script>
        alert('<%=param%>');
    </script>
    <%
        }
    %>
    <div class="container">
        <div class="row">
            <% 
                BookService bookService = new BookService();
                List<Book> books = bookService.getAllBooks(); // Fetch books from the database
                if (books != null) {
                    for (Book book : books) {
            %>
            <div class="col-md-3">
                <div class="card mb-4 h-100">
                    <img src="<%= book.getImage() %>" class="card-img-top img-fluid" alt="<%= book.getTitle() %>">
                    <div class="card-body d-flex flex-column">
                        <h5 class="card-title"><%= book.getTitle() %></h5>
                        <p class="card-text">Author: <%= book.getAuthor() %></p>
                        <p class="card-text">Language: <%= book.getLanguage() %></p>
                        <p class="card-text">Pages: <%= book.getPages() %></p>
                        <button class="btn btn-primary mt-auto view-details" data-target="#<%= book.getBookId() %>Modal">Details</button>
                    </div>
                </div>
            </div>
            <% 
                    }
                }
            %>
        </div>
    </div>

    <% 
        if (books != null) {
            for (Book book : books) {
    %>
    <div class="modal fade" id="<%= book.getBookId() %>Modal" tabindex="-1" role="dialog" aria-labelledby="<%= book.getBookId() %>ModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="<%= book.getBookId() %>ModalLabel"><%= book.getTitle() %> Summary</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <%= book.getSummary() %>
                </div>
                <div class="fw-bold fs-6">Terms and Conditions:</div>
                <%
    // Get today's date
    java.util.Date today = new java.util.Date();
    java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("MM/dd/yyyy");
    String todayDate = sdf.format(today);

    // Calculate the due date (30 days from today)
    java.util.Calendar cal = java.util.Calendar.getInstance();
    cal.setTime(today);
    cal.add(java.util.Calendar.DATE, 30);
    java.util.Date dueDate = cal.getTime();
    String dueDateString = sdf.format(dueDate);
%>
                <div>
                	<ul>
                		<li>Borrowing is for 60 days starting today, you can extend.</li>
                		<li>Current Due date: <%= dueDateString %></li>
                	</ul>
                </div>
                <div class="modal-footer">
                    <a href="borrow?bookId=<%= book.getBookId() %>" class="btn btn-primary">Borrow</a>
                    <button type="button" class="btn btn-secondary close-modal" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
    <% 
            }
        }
    %>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <script>
        $(document).ready(function(){
            $('.view-details').on('click', function(){
                var target = $(this).data('target');
                $(target).modal('show');
            });

            $('.close-modal').on('click', function(){
                $(this).closest('.modal').modal('hide');
            });
        });
    </script>
</body>
</html>
