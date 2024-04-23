<!DOCTYPE html>
<html>
<head>
    <title>Window Alert</title>
</head>
<body>
    <%-- Your JSP code here --%>
<%
	String msg = request.getParameter("msg");
%>
    <script>
        window.onload = function() {
            alert(<%=msg%>);
        };
    </script>
</body>
</html>
