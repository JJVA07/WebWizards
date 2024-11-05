<%@page import="com.example.webapphr1_2023.Beans.Employee" %>
<%@page import="java.util.ArrayList" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<jsp:useBean id="listaEmpleados" type="ArrayList<Employee>" scope="request"/>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="../includes/bootstrap_header.jsp"/>
        <title>Lista empleados</title>
    </head>
    <body>
        <div class='container'>
            <h1 class='mb-3'>Lista de empleados</h1>
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="<%= request.getContextPath()%>">Home</a></li>
                    <li class="breadcrumb-item active">Empleados</li>
                </ol>
            </nav>
            <a href="<%= request.getContextPath()%>/EmployeeServlet?action=agregar" class="btn btn-primary mb-4">
                Agregar nuevo empleado</a>
            <table class="table">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>Employee</th>
                        <th>Email</th>
                        <th>Job</th>
                        <th>Salary</th>
                        <th>Commision</th>
                        <th>Manager</th>
                        <th>Department</th>
                        <th></th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        int i = 1;
                        for (Employee e : listaEmpleados) {
                    %>
                    <tr>
                        <td><%= i%>
                        </td>
                        <td><%= e.getFirstName() + " " + e.getLastName()%>
                        </td>
                        <td><%= e.getEmail()%>
                        </td>
                        <td><%= e.getJob().getJobTitle()%>
                        </td>
                        <td><%= e.getSalary()%>
                        </td>
                        <td><%= e.getCommissionPct() == null ? "Sin comisión" : e.getCommissionPct()%>
                        </td>
                        <td><%= e.getManager() == null ? "-- Sin jefe --" : e.getManager().getFullName() %>
                        </td>
                        <td><%= e.getDepartment().getDepartmentId() == 0 ? "-- Sin depa --" : e.getDepartment().getDepartmentName()%>
                        </td>
                        <td>
                            <a class="btn btn-primary"
                               href="<%=request.getContextPath()%>/EmployeeServlet?action=editar&id=<%=e.getEmployeeId()%>">
                                <i class="bi bi-pencil-square"></i>
                            </a>
                        </td>
                        <td>
                            <a class="btn btn-danger"
                               href="<%=request.getContextPath()%>/EmployeeServlet?action=borrar&id=<%=e.getEmployeeId()%>">
                                <i class="bi bi-trash3"></i>
                            </a>
                        </td>
                    </tr>
                    <%
                            i++;
                        }
                    %>
                </tbody>
            </table>
        </div>
        <jsp:include page="../includes/bootstrap_footer.jsp"/>
    </body>
</html>
