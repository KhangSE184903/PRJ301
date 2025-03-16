<%-- 
    Document   : login
    Created on : Mar 9, 2025, 5:22:22 PM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Login</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background: #f4f4f4;
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
            }

            .login-container {
                background: white;
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
                width: 350px;
                text-align: center;
            }

            h2 {
                text-align: center;
                margin-bottom: 20px;
            }

            .form-group {
                display: flex;
                flex-direction: column; 
                align-items: flex-start; 
                margin-bottom: 15px;
            }

            label {
                font-weight: bold;
                margin-bottom: 5px; 
                padding-left: 10px;
            }

            input {
                width: 100%;
                padding: 10px;
                border: 1px solid #ccc;
                border-radius: 5px;
                font-size: 16px;
                box-sizing: border-box;
            }

            button {
                width: 100%;
                padding: 10px;
                background: #007bff;
                color: white;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                font-size: 16px;
                margin-top: 15px;
            }

            button:hover {
                background: #0056b3;
            }
            .error-message {
                color: red;
                text-align: center;
                font-size: 14px;
                margin-bottom: 10px;
            }
        </style>
    </head>
    <body>
        <div class="login-container">
            <h2>Login</h2>
            <form action="LoginController" method="post">
                <input type="hidden" name="action" value="login" />
                <div class="form-group">
                    <label for="txtUsername">Username</label>
                    <input type="text" name="txtUsername" required /> <br/>
                </div>
                <div class="form-group">
                    <label for="txtUsername">Password</label>
                    <input type="password" name="txtPassword" required /> <br/>
                </div>
                <div class="error-message">
                    <%= request.getAttribute("message") != null ? request.getAttribute("message") : ""%>
                </div>
                <button type="submit" value="Login" />Login</button>
            </form>
        </div>
        
    </body>
</html>
