package com.example.webapphr1_2023.Controllers;

import com.example.webapphr1_2023.Beans.Job;
import com.example.webapphr1_2023.Daos.DaoBase;
import com.example.webapphr1_2023.Daos.DepartmentDao;
import com.example.webapphr1_2023.Daos.EmployeeDao;
import com.example.webapphr1_2023.Daos.JobDao;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "JobServlet", value = "/JobServlet")
public class JobServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        String action = request.getParameter("action") == null ? "lista" : request.getParameter("action");
        JobDao jobDao = new JobDao();
        EmployeeDao employeeDao = new EmployeeDao();
        DepartmentDao departmentDao = new DepartmentDao();

        if (action.equalsIgnoreCase("crear")) {
            String jobId = request.getParameter("jobId");
            String jobTitle = request.getParameter("jobTitle");
            int minSalary = Integer.parseInt(request.getParameter("minSalary"));
            int maxSalary = Integer.parseInt(request.getParameter("maxSalary"));

            Job bJob = jobDao.obtenerTrabajo(jobId);
            if (bJob == null) {
                jobDao.crearTrabajo(jobId, jobTitle, minSalary, maxSalary);
            } else {
                jobDao.actualizarTrabajo(jobId, jobTitle, minSalary, maxSalary);
            }
        }

        response.sendRedirect(request.getContextPath() + "/JobServlet");


    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String action = request.getParameter("action") == null ? "lista" : request.getParameter("action");
        JobDao jobDao = new JobDao();
        RequestDispatcher view;

        switch (action) {
            case "lista":
                ArrayList<Job> listaTrabajos = jobDao.obtenerListaTrabajos();
                request.setAttribute("lista", listaTrabajos);
                view = request.getRequestDispatcher("jobs/listaTrabajos.jsp");
                view.forward(request, response);
                break;
            case "formCrear":
                view = request.getRequestDispatcher("jobs/nuevoTrabajo.jsp");
                view.forward(request, response);
                break;
            case "editar":
                String jobId = request.getParameter("id");
                Job bJob = jobDao.obtenerTrabajo(jobId);
                if (bJob == null) {
                    response.sendRedirect(request.getContextPath() + "/JobServlet");
                } else {
                    request.setAttribute("trabajo", bJob);
                    view = request.getRequestDispatcher("jobs/editarTrabajo.jsp");
                    view.forward(request, response);
                }
                break;
            case "borrar":
                String jobID = request.getParameter("id");
                if (jobDao.obtenerTrabajo(jobID) != null) {
                    jobDao.borrarTrabajo(jobID);
                }
                response.sendRedirect(request.getContextPath() + "/JobServlet");
                break;

        }


    }
}
