<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page import="java.util.ArrayList" %>
<%@page import="com.example.webapphr1_2023.Beans.Employee" %>
<%@page import="com.example.webapphr1_2023.Beans.Job" %>
<%@page import="com.example.webapphr1_2023.Beans.Department" %>
<jsp:useBean id="listaTrabajos" type="ArrayList<Job>" scope="request" />
<jsp:useBean id="listaJefes" type="ArrayList<Employee>" scope="request" />
<jsp:useBean id="listaDepartamentos" type="ArrayList<Department>" scope="request" />
<jsp:useBean id="empleado" type="Employee" scope="request"/>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="../includes/bootstrap_header.jsp"/>
        <title>Editar empleado</title>
    </head>
    <body>
        <div class='container mb-4'>
            <div class="row justify-content-center">
                <h1 class='mb-3'>Editar usuario</h1>
                <hr>
                <form method="POST" action="EmployeeServlet?action=actualizar" class="col-md-6 col-lg-6">
                    <input type="hidden" name="employee_id" value="<%= empleado.getEmployeeId()%>"/>
                    <div class="mb-3">
                        <label for="first_name">First Name</label>
                        <input type="text" class="form-control form-control-sm" name="first_name" id="first_name"
                               value="<%= empleado.getFirstName() == null ? "" : empleado.getFirstName()%>">
                    </div>
                    <div class="mb-3">
                        <label for="last_name">Last Name</label>
                        <input type="text" class="form-control form-control-sm" name="last_name" id="last_name"
                               value="<%= empleado.getLastName() == null ? "" : empleado.getLastName()%>">
                    </div>
                    <div class="mb-3">
                        <label for="email">Email</label>
                        <input type="text" class="form-control form-control-sm" name="email" id="email"
                               value="<%= empleado.getEmail() == null ? "" : empleado.getEmail()%>">
                    </div>
                    <div class="mb-3">
                        <label for="phone">Phone number</label>
                        <input type="text" class="form-control form-control-sm" name="phone" id="phone"
                               value="<%= empleado.getPhoneNumber() == null ? "" : empleado.getPhoneNumber()%>">
                    </div>
                    <div class="mb-3">
                        <label for="hire_date">Hire date</label>
                        <input type="text" class="form-control form-control-sm" name="hire_date" id="hire_date"
                               value="<%= empleado.getHireDate() == null ? "" : empleado.getHireDate()%>">
                    </div>
                    <div class="mb-3">
                        <label for="job_id">Job</label>
                        <select name="job_id" class="form-select" id="job_id">
                            <% for(Job job: listaTrabajos){ %>
                            <option value="<%=job.getJobId()%>"  <%=job.getJobId().equals(empleado.getJob().getJobId())?"selected":""%>   > <%=job.getJobTitle()%> </option>
                            <% } %>
                        </select>
                    </div>
                    <div class="mb-3">
                        <label for="salary">Salary</label>
                        <input type="text" class="form-control form-control-sm" name="salary" id="salary"
                               value="<%= empleado.getSalary().equals("0.0") ? "" : empleado.getSalary()%>">
                    </div>
                    <div class="mb-3">
                        <label for="commission">Commision PCT</label>
                        <input type="text" class="form-control form-control-sm" name="commission" id="commission"
                               value="<%= empleado.getCommissionPct() == null ? "" : empleado.getCommissionPct()%>">
                    </div>
                    <div class="mb-3">
                        <label for="manager_id">Manager</label>
                        <select name="manager_id" class="form-select" id="manager_id">
                            <option value="0">-- Sin jefe --</option>
                            <% for(Employee manager: listaJefes){ %>
                            <option value="<%=manager.getEmployeeId()%>" <%=manager.getEmployeeId() == empleado.getManager().getEmployeeId()?"selected":""%>  > <%=manager.getFullName()%> </option>
                            <% } %>
                        </select>
                    </div>
                    <div class="mb-3">
                        <label for="department_id">Department</label>
                        <select name="department_id" class="form-select" id="department_id">
                            <option value="0">-- Sin departamento --</option>
                            <% for(Department department: listaDepartamentos){ %>
                            <option value="<%=department.getDepartmentId()%>" <%=department.getDepartmentId() == empleado.getDepartment().getDepartmentId()?"selected":""%>   > <%=department.getDepartmentName()%> </option>
                            <% } %>
                        </select>
                    </div>
                    <a href="<%= request.getContextPath()%>/EmployeeServlet" class="btn btn-danger">Cancelar</a>
                    <input type="submit" value="Actualizar" class="btn btn-primary"/>
                </form>
            </div>
        </div>
        <jsp:include page="../includes/bootstrap_footer.jsp"/>
    </body>
</html>
