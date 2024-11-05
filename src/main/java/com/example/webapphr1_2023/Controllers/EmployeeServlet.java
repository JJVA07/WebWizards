package com.example.webapphr1_2023.Controllers;

import com.example.webapphr1_2023.Beans.Department;
import com.example.webapphr1_2023.Beans.Employee;
import com.example.webapphr1_2023.Beans.Job;
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
import java.math.BigDecimal;

@WebServlet(name = "EmployeeServlet", urlPatterns = {"/EmployeeServlet"})
public class EmployeeServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action") == null ? "lista" : request.getParameter("action");

        RequestDispatcher view;
        EmployeeDao employeeDao = new EmployeeDao();
        JobDao jobDao = new JobDao();
        DepartmentDao departmentDao = new DepartmentDao();

        switch (action) {
            case "lista":
                request.setAttribute("listaEmpleados", employeeDao.listarEmpleados());
                view = request.getRequestDispatcher("employees/lista.jsp");
                view.forward(request, response);
                break;
            case "agregar":
                request.setAttribute("listaTrabajos",jobDao.obtenerListaTrabajos());
                request.setAttribute("listaJefes",employeeDao.listarEmpleados());
                request.setAttribute("listaDepartamentos",departmentDao.lista());
                view = request.getRequestDispatcher("employees/formularioNuevo.jsp");
                view.forward(request, response);
                break;
            case "editar":
                if (request.getParameter("id") != null) {
                    String employeeIdString = request.getParameter("id");
                    int employeeId = 0;
                    try {
                        employeeId = Integer.parseInt(employeeIdString);
                    } catch (NumberFormatException ex) {
                        response.sendRedirect("EmployeeServlet");

                    }

                    Employee emp = employeeDao.obtenerEmpleado(employeeId);

                    if (emp != null) {
                        request.setAttribute("empleado", emp);
                        request.setAttribute("listaTrabajos",jobDao.obtenerListaTrabajos());
                        request.setAttribute("listaJefes",employeeDao.listarEmpleados());
                        request.setAttribute("listaDepartamentos",departmentDao.lista());
                        view = request.getRequestDispatcher("employees/formularioEditar.jsp");
                        view.forward(request, response);
                    } else {
                        response.sendRedirect("EmployeeServlet");
                    }

                } else {
                    response.sendRedirect("EmployeeServlet");
                }

                break;
            case "borrar":
                if (request.getParameter("id") != null) {
                    String employeeIdString = request.getParameter("id");
                    int employeeId = 0;
                    try {
                        employeeId = Integer.parseInt(employeeIdString);
                    } catch (NumberFormatException ex) {
                        response.sendRedirect("EmployeeServlet");
                    }

                    Employee emp = employeeDao.obtenerEmpleado(employeeId);

                    if (emp != null) {
                        employeeDao.borrarEmpleado(employeeId);
                    }
                }

                response.sendRedirect("EmployeeServlet");
                break;
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        String action = request.getParameter("action") == null ? "lista" : request.getParameter("action");

        EmployeeDao employeeDao = new EmployeeDao();

        Employee employee = new Employee();
        employee.setFirstName(request.getParameter("first_name"));
        employee.setLastName(request.getParameter("last_name"));
        employee.setEmail(request.getParameter("email"));
        employee.setPhoneNumber(request.getParameter("phone"));
        employee.setHireDate(request.getParameter("hire_date"));

        Job job = new Job();
        job.setJobId(request.getParameter("job_id"));
        employee.setJob(job);

        employee.setSalary(new BigDecimal(request.getParameter("salary")));
        employee.setCommissionPct(request.getParameter("commission").equals("") ? null : new BigDecimal(request.getParameter("commission")));

        Employee manager = new Employee();
        manager.setEmployeeId(Integer.parseInt(request.getParameter("manager_id")));
        employee.setManager(manager);

        Department department = new Department();
        department.setDepartmentId(Integer.parseInt(request.getParameter("department_id")));
        employee.setDepartment(department);

        switch (action) {
            case "guardar":
                employeeDao.guardarEmpleado(employee);

                response.sendRedirect("EmployeeServlet");
                break;
            case "actualizar":
                employee.setEmployeeId(Integer.parseInt(request.getParameter("employee_id"))); //no olvidar que para actualizar se debe enviar el ID

                employeeDao.actualizarEmpleado(employee);

                response.sendRedirect("EmployeeServlet");

                break;
        }
    }

}
