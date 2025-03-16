<%-- 
    Document   : viewstartupprojects
    Created on : Mar 10, 2025, 12:11:10 AM
    Author     : PC
--%>

<%@page import="dto.ProjectDTO"%>
<%@page import="java.util.List"%>
<%@page import="dto.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <style>
            body {
                font-family: Arial, sans-serif;
                background: #f4f4f4;
                text-align: center;
                margin: 20px;
            }
            .container {
                background: white;
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
                width: 80%;
                margin: auto;
            }
            h2 {
                color: #333;
            }
            .top-section {
                display: flex;
                justify-content: space-between;
                align-items: center;
                margin-bottom: 20px;
            }
            .search-bar {
                display: flex;
                align-items: center;
            }
            input[type="text"] {
                padding: 8px;
                border: 1px solid #ccc;
                border-radius: 5px;
                width: 200px;
            }
            input[type="submit"], .add-btn {
                padding: 8px 15px;
                background: #007bff;
                color: white;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                font-size: 14px;
                margin-left: 5px;
                text-decoration: none;
            }
            input[type="submit"]:hover, .add-btn:hover {
                background: #0056b3;
            }
            table {
                width: 100%;
                border-collapse: collapse;
                margin-top: 20px;
            }
            table, th, td {
                border: 1px solid #ddd;
            }
            th, td {
                padding: 10px;
                text-align: center;
            }
            th {
                background: #007bff;
                color: white;
            }
            tr:nth-child(even) {
                background: #f2f2f2;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <%
                if (session.getAttribute("user") != null) {
                    UserDTO user = (UserDTO) session.getAttribute("user");
            %>
            <h2>WELCOME <b> <%=user.getName()%></b></h2>

            <form action="LoginController">
                <input type="hidden" name="action" value="logout"/>
                <input type="submit" value="Logout"/>
            </form>

            <hr/>

            <div class="top-section">
                <%
                    String searchTerm = request.getAttribute("searchTerm") + "";
                    searchTerm = searchTerm.equals("null") ? "" : searchTerm;
                    if (session.getAttribute("user") != null) {
                        UserDTO usera = (UserDTO) session.getAttribute("user");
                        if (usera.getRole().equals("Founder")) {
                %>
                <div class="search-bar">
                    <form action="LoginController">
                        <input type="hidden" name="action" value="search"/>
                        <input type="text" name="searchTerm" value="<%=searchTerm%>" placeholder="Search Projects..."/>
                        <input type="submit" value="Search"/>
                    </form>
                </div>
                <% }
            } %>

                <% if (session.getAttribute("user") != null) {
                        UserDTO usera = (UserDTO) session.getAttribute("user");
                        if (usera.getRole().equals("Founder")) {
                %>
                <a href="projectForm.jsp" class="add-btn">+ Add Project</a>
                <% }
            } %>
            </div>

            <%
                if (request.getAttribute("projects") != null) {
                    List<ProjectDTO> projects = (List<ProjectDTO>) request.getAttribute("projects");
            %>
            <table>
                <tr>
                    <th>Project ID</th>
                    <th>Project Name</th>
                    <th>Description</th>
                    <th>Status</th>
                    <th>Estimated Launch</th>
                        <%
                            if (session.getAttribute("user") != null) {
                                UserDTO user1 = (UserDTO) session.getAttribute("user");
                                if (user1.getRole().equals("Founder")) {
                        %>
                    <th>Update</th>
                        <% }
                } %>
                </tr>
                <%
                    for (ProjectDTO b : projects) {
                %>
                <tr>
                    <td><%=b.getProjectId()%></td>
                    <td><%=b.getProjectName()%></td>
                    <td><%=b.getDescription()%></td>
                    <td><%=b.getStatus()%></td>
                    <td><%=b.getEstimatedLaunch()%></td>
                    <%
                        if (session.getAttribute("user") != null) {
                            UserDTO user1 = (UserDTO) session.getAttribute("user");
                            if (user1.getRole().equals("Founder")) {
                    %>
                    <td>
                        <form action="LoginController" method="post">
                            <input type="hidden" name="action" value="update">
                            <input type="hidden" name="projectId" value="<%= b.getProjectId()%>">
                            <select name="newStatus">
                                <option value="Ideation" <%= "Ideation".equals(b.getStatus()) ? "selected" : ""%>>Ideation</option>
                                <option value="Development" <%= "Development".equals(b.getStatus()) ? "selected" : ""%>>Development</option>
                                <option value="Launch" <%= "Launch".equals(b.getStatus()) ? "selected" : ""%>>Launch</option>
                                <option value="Scaling" <%= "Scaling".equals(b.getStatus()) ? "selected" : ""%>>Scaling</option>
                            </select>
                            <input type="submit" value="Update">
                        </form>
                    </td>
                    <% }
                } %>
                </tr>
                <% } %>
            </table>
            <% } %>

            <%
                String message = (String) request.getAttribute("message");
                String error = (String) request.getAttribute("error");
                if (message != null) {
            %>
            <p style="color: green;"><%= message%></p>
            <% } else if (error != null) {%>
            <p style="color: red;"><%= error%></p>
            <% } %>

            <% } else { %>
            <p>You do not have permission to access this content.</p>
            <% }%>
        </div>
    </body>
</html>
