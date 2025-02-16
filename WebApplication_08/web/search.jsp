<%-- 
    Document   : search
    Created on : Feb 16, 2025, 4:47:48 PM
    Author     : PC
--%>

<%@page import="dto.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            UserDTO user = (UserDTO)request.getAttribute("user");
        %>
        Welcome <b> <%=user.getFullName() %>  </b>
        <form action="#">   
            Search Value <input type="text" name="txtSearchValue" />
            <input type="submit" value="login" />
        </form>
    </body>
</html>
