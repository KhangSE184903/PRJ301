<%-- 
    Document   : bookForm
    Created on : Feb 27, 2025, 1:49:51 PM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="MainController" method="post">
            <input type="hidden" name="action" value="add" />
            Book ID <input type="text" name="txtBookID" />
            Title <input type="text" name="txtTitle" />
            Author <input type="text" name="txtAuthor" />
            Publish Year <input type="number" name="txtPublishYear" />
            Price <input type="number" name="txtPrice" />
            Quantity <input type="number" name="txtQuantity" />
            <input type="submit" value="Save" />
            <input type="reset" value="Reset" />       
        </form>
    </body>
</html>