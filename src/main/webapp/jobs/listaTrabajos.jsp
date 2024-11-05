<%@ page import="com.example.webapphr1_2023.Beans.Job" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:useBean type="java.util.ArrayList<com.example.webapphr1_2023.Beans.Job>" scope="request" id="lista"/>

<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="../includes/bootstrap_header.jsp"/>
        <title>Listar Trabajos</title>
    </head>
    <body>
        <div class='container'>

            <h1 class='mb-3'>Lista de trabajos en hr</h1>
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="<%= request.getContextPath()%>">Home</a></li>
                    <li class="breadcrumb-item active">Trabajos</li>
                </ol>
            </nav>
            <a class="btn btn-primary mb-3" href="<%=request.getContextPath()%>/JobServlet?action=formCrear">Crear
                Trabajo</a>
            <table class="table">
                <tr>
                    <th>Job ID</th>
                    <th>Job Name</th>
                    <th>Min Salary</th>
                    <th>Max Salary</th>
                    <th></th>
                    <th></th>
                </tr>
                <%
                    for (Job job : lista) {
                %>
                <tr>
                    <td><%=job.getJobId()%>
                    </td>
                    <td><%=job.getJobTitle()%>
                    </td>
                    <td><%=job.getMinSalary()%>
                    </td>
                    <td><%=job.getMaxSalary()%>
                    </td>
                    <td>
                        <a class="btn btn-primary"
                           href="<%=request.getContextPath()%>/JobServlet?action=editar&id=<%=job.getJobId()%>">
                            <i class="bi bi-pencil-square"></i>
                        </a>
                    </td>
                    <td>
                        <a class="btn btn-danger"
                           href="<%=request.getContextPath()%>/JobServlet?action=borrar&id=<%=job.getJobId()%>">
                            <i class="bi bi-trash3"></i>
                        </a>
                    </td>
                </tr>
                <%
                    }
                %>
            </table>
        </div>
        <jsp:include page="../includes/bootstrap_footer.jsp"/>
    </body>
</html>


