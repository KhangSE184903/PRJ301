<%-- 
    Document   : projectForm
    Created on : Mar 10, 2025, 10:18:11 AM
    Author     : PC
--%>

<%@page import="dto.ProjectDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Create Project</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background: #f4f4f4;
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
            }
            .form-container {
                background: white;
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
                width: 400px;
            }
            h2 {
                text-align: center;
            }
            input, select {
                width: 100%;
                padding: 10px;
                margin: 10px 0;
                border: 1px solid #ccc;
                border-radius: 5px;
                font-size: 16px;
                box-sizing: border-box;
            }
            select {
                appearance: none;  
                background-color: white;
            }
            button {
                width: 100%;
                padding: 10px;
                background: #28a745;
                color: white;
                border: none;
                border-radius: 5px;
                cursor: pointer;
            }
            button:hover {
                background: #218838;
            }
        </style>
    </head>
    <body>
        <%
            ProjectDTO project = new ProjectDTO();
            try {
                    project = (ProjectDTO)request.getAttribute("project");
                } catch (Exception e) {
                }
                if(project==null){
                    project = new ProjectDTO();
                }
                
                String txtProjectID_error = request.getAttribute("txtProjectID_error") + "";
                txtProjectID_error = txtProjectID_error.equals("null")?"":txtProjectID_error;
                
                String txtProjectName_error = request.getAttribute("txtProjectName_error") + "";
                txtProjectName_error = txtProjectName_error.equals("null") ? "" : txtProjectName_error;
                
                String txtDescription_error = request.getAttribute("txtDescription_error") + "";
                txtDescription_error = txtDescription_error.equals("null")?"":txtDescription_error;
        %>
        <div class="form-container">
            <h2>Create a New Project</h2>
            <form action="LoginController" method="post">
                <input type="hidden" name="action" value="add" />
                Project ID: <input type="text" name="txtProjectID" value="<%=project.getProjectId()%>" required /> <span style="color: red "><%=txtProjectID_error%></span> <br/>
                Project Name: <input type="text" name="txtProjectName" value="<%=project.getProjectName()%>" required /> <span style="color: red "><%=txtProjectName_error%></span> <br/>
                Description: <input type="text" name="txtDescription" value="<%=project.getDescription()%>" required /> <span style="color: red "><%=txtDescription_error%></span> <br/>
                Status: 
                <select name="txtStatus" value="<%=project.getStatus()%>" required>
                    <option value="Ideation">Ideation</option>
                    <option value="Development">Development</option>
                    <option value="Launch">Launch</option>
                    <option value="Scaling">Scaling</option>
                </select> <br/>
                Estimated Launch: 
                <input type="date" name="txtEstimatedLaunch" value="<%=project.getEstimatedLaunch()%>" required min="<%= java.time.LocalDate.now()%>" /> <br/>
                <button type="submit" value="Save" />Create Project</button>
            </form>
        </div>
    </body>
</html>
