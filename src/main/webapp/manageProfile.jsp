<%@ include file="patronnav.jsp"%>
<%@ page import="org.model.Patron" %>
<%@ page import="org.service.PatronService" %>
<%@ page import="java.util.List" %>
<%
    // Get patronId from the URL parameter
    int patronId = Integer.parseInt((String)session.getAttribute("patronId"));
    PatronService patronService = new PatronService();
    Patron patron = patronService.getPatronById(patronId);
%>
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
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Manage Profile</title>
  <style>
    .container-l{
      background-image: url('libs.png'); 
      height: 93vh;
    }
    .registration-form {
      background-color: white;
      padding: 20px;
      border-radius: 10px;
      box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
      margin: 20px auto;
      max-width: 600px;
    }
    .form-title {
      text-align: center;
      margin-bottom: 20px;
    }
  </style>
</head>
<body>
  <div class="container-l pt-5">
    <div class="registration-form pt-5">
      <h2 class="form-title">Manage Profile</h2>
      <form action="manageProfile" method="get">
        <input type="hidden" name="patronId" value="<%= patronId %>">
        <div class="form-row">
          <div class="form-group col-md-12">
            <label for="name">Name</label>
            <input type="text" class="form-control" id="name" name="name" value="<%= patron.getName() %>">
          </div>
          <div class="form-group col-md-12">
            <label for="university">University</label>
            <input type="text" class="form-control" id="university" name="university" value="<%= patron.getUniversity() %>">
          </div>
          <div class="form-group col-md-12">
            <label for="studentId">Student ID</label>
            <input type="text" class="form-control" id="studentId" name="studentId" value="<%= patron.getStudentId() %>">
          </div>
        </div>
        <div class="form-row">
          <div class="form-group col-md-12">
            <label for="inputEmail4">Email</label>
            <input type="email" class="form-control" id="email" name="email" value="<%= patron.getEmail() %>">
          </div>
          <div class="form-group col-md-12">
            <label for="inputPassword4">Password</label>
            <input type="password" class="form-control" id="password" name="password" value="<%= patron.getPassword() %>">
          </div>
        </div>
        <div class="form-group">
          <label for="inputAddress">Address</label>
          <textarea class="form-control" id="address" name="address"><%= patron.getAddress() %></textarea>
        </div>
        <div class="form-group">
          <div class="form-check">
            <input class="form-check-input" type="checkbox" id="gridCheck">
            <label class="form-check-label" for="gridCheck">
              Check me out
            </label>
          </div>
        </div>
        <button type="submit" class="btn btn-primary mt-3" value="update">Update</button>
      </form>
    </div>
  </div>
</body>
</html>
