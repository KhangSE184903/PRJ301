/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.ProjectDAO;
import dao.UserDAO;
import dto.ProjectDTO;
import dto.UserDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author PC
 */
@WebServlet(name = "LoginController", urlPatterns = {"/LoginController"})
public class LoginController extends HttpServlet {
    public ProjectDAO projectDAO = new ProjectDAO();
    
    private static final String LOGIN_PAGE = "login.jsp";
    
    public UserDTO getUser(String strUserName){
        UserDAO udao = new UserDAO();
        UserDTO user = udao.readById(strUserName);
        return user;
    }
    
    public boolean isValidLogin(String strUserName, String strPassword){
        UserDTO user = getUser(strUserName);
        return user != null && user.getPassword().equals(strPassword);
    }
    
    public void search(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String searchTerm = request.getParameter("searchTerm");
        if (searchTerm == null) {
            searchTerm = "";
        }
        List<ProjectDTO> projects = projectDAO.searchByName(searchTerm);
        request.setAttribute("projects", projects);
        request.setAttribute("searchTerm", searchTerm);
    }
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = LOGIN_PAGE;
        try {
            String action = request.getParameter("action");
            if(action==null){
                url = LOGIN_PAGE;
            }else{
                if(action.equals("login")){
                    String strUserName = request.getParameter("txtUsername");
                    String strPassword = request.getParameter("txtPassword");
                    if(isValidLogin(strUserName, strPassword)){
                        url = "viewstartupprojects.jsp";
                        UserDTO user = getUser(strUserName);
                        request.getSession().setAttribute("user", user);
                        
                        url = "viewstartupprojects.jsp";
                        search(request, response);
                    }else{
                        request.setAttribute("message", "Incorrect Username or Password");
                        url = "login.jsp";
                    }
                }else if(action.equals("logout")) {
                    request.getSession().invalidate();
                    url = "login.jsp";
                }else if(action.equals("search")) {
                    url = "viewstartupprojects.jsp";
                    search(request, response);
                }else if (action.equals("update")) {
                    int projectId = Integer.parseInt(request.getParameter("projectId"));
                    String newStatus = request.getParameter("newStatus");
                    UserDTO user = (UserDTO) request.getSession().getAttribute("user");
                    String username = user != null ? user.getUserName() : "unknown";

                    if (projectDAO.updateStatus(projectId, newStatus)) {
                        request.setAttribute("message", "Update successful");
                        search(request, response);
                        url = "viewstartupprojects.jsp";
                    } else {
                        request.setAttribute("error", "Fail to update");
                        url = "viewstartupprojects.jsp";
                    }
                } else if (action.equals("add")) {
                    try {
                        boolean checkError = false;
                        int projectID = Integer.parseInt(request.getParameter("txtProjectID"));
                        String projectName = request.getParameter("txtProjectName");
                        String description = request.getParameter("txtDescription");
                        String status = request.getParameter("txtStatus");
                        LocalDate estimatedLaunch = LocalDate.parse(request.getParameter("txtEstimatedLaunch"));
                        
                        if (request.getParameter("txtProjectID")==null || request.getParameter("txtProjectID").trim().isEmpty()){
                            checkError = true;
                            request.setAttribute("txtProjectID_error", "Project ID cannot be empty");
                        }
                        
                        if (projectName==null || projectName.trim().isEmpty()){
                            checkError = true;
                            request.setAttribute("txtProjectName_error", "Project Name cannot be empty");
                        }
                        
                        if (description==null || description.trim().isEmpty()){
                            checkError = true;
                            request.setAttribute("txtDescription_error", "Description cannot be empty");
                        }
                        
                        
                        ProjectDTO project = new ProjectDTO(projectID, projectName, description, status, estimatedLaunch);
                        if(!checkError){
                        projectDAO.create(project);
                        
                        url = "viewstartupprojects.jsp";
                        search(request, response);
                        }else{
                            request.setAttribute("project", project);
                            url = "projectForm.jsp";
                        }
                    } catch (Exception e) {
                    }
                    
                }
            }
        } catch (Exception e){
            log("Error in LoginController: " + e.toString());
        }finally{
            RequestDispatcher rd = request.getRequestDispatcher(url);
            rd.forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
