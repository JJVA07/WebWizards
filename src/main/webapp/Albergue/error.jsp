<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Error</title>
</head>
<body>
<h1>Ocurrió un error</h1>
<p><%= request.getParameter("message") %></p>
</body>
</html>
