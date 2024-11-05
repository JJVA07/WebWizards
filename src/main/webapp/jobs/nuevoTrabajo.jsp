<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="../includes/bootstrap_header.jsp" />
        <title>Crear un nuevo trabajo</title>
    </head>
    <body>
        <div class='container'>
            <h1 class='mb-3'>Crear un nuevo trabajo</h1>
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="<%= request.getContextPath()%>">Home</a></li>
                    <li class="breadcrumb-item active">Trabajos</li>
                </ol>
            </nav>

            <form method="POST" action="<%=request.getContextPath()%>/JobServlet?action=crear" class="col-md-6 col-lg-6">
                <div class="mb-3">
                    <label for="jobId">Job ID</label>
                    <input type="text" class="form-control" id="jobId" name="jobId">
                </div>
                <div class="mb-3">
                    <label for="jobTitle">Job Title</label>
                    <input type="text" class="form-control" id="jobTitle" name="jobTitle">
                </div>
                <div class="mb-3">
                    <label for="minSalary">Min Salary</label>
                    <input type="text" class="form-control" id="minSalary" name="minSalary">
                </div>
                <div class="mb-3">
                    <label for="maxSalary">Max Salary</label>
                    <input type="text" class="form-control" id="maxSalary" name="maxSalary">
                </div>
                <a href="<%=request.getContextPath()%>/JobServlet" class="btn btn-danger">Regresar</a>
                <button type="submit" class="btn btn-primary">Submit</button>
            </form>
        </div>
        <jsp:include page="../includes/bootstrap_footer.jsp" />
    </body>
</html>


