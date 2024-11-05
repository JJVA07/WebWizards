package com.example.webapphr1_2023.Daos;

import com.example.webapphr1_2023.Beans.Department;
import com.example.webapphr1_2023.Beans.Employee;
import com.example.webapphr1_2023.Beans.Job;

import java.sql.*;
import java.util.ArrayList;

public class EmployeeDao extends DaoBase{


    public ArrayList<Employee> listarEmpleados() {

        ArrayList<Employee> listaEmpleados = new ArrayList<>();

        String sql = "select * from employees e\n" +
                "inner join jobs j on e.job_id = j.job_id\n" +
                "left join employees m on e.manager_id = m.employee_id\n" +
                "left join departments d on e.department_id = d.department_id order by e.employee_id";

        try (Connection conn = getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()) {
                Employee employee = fetchEmployeeData(rs);
                listaEmpleados.add(employee);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return listaEmpleados;
    }

    public Employee obtenerEmpleado(int employeeId) {

        Employee employee = null;

        String sql = "select * from employees e\n" +
                "inner join jobs j on e.job_id = j.job_id\n" +
                "left join employees m on e.manager_id = m.employee_id\n" +
                "left join departments d on e.department_id = d.department_id\n" +
                "where e.employee_id = ?";

        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, employeeId);

            try (ResultSet rs = pstmt.executeQuery()) {

                if (rs.next()) {
                    employee = fetchEmployeeData(rs);
                }
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return employee;
    }

    public void guardarEmpleado(Employee employee) {

        String sql = "INSERT INTO employees (first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            setEmployeeData(employee, pstmt);

            pstmt.executeUpdate();

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    public void actualizarEmpleado(Employee employee) {

            String sql = "UPDATE employees "
                + "SET first_name = ?, "
                + "last_name = ?, "
                + "email = ?, "
                + "phone_number = ?, "
                + "hire_date = ?, "
                + "job_id = ?, "
                + "salary = ?, "
                + "commission_pct = ?, "
                + "manager_id = ?, "
                + "department_id = ? "
                + "WHERE employee_id = ?";

        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            setEmployeeData(employee, pstmt);
            pstmt.setInt(11, employee.getEmployeeId());

            pstmt.executeUpdate();

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }


    public void borrarEmpleado(int employeeId) {

        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement("DELETE FROM employees WHERE employee_id = ?")) {

            pstmt.setInt(1, employeeId);
            pstmt.executeUpdate();

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }


    private Employee fetchEmployeeData(ResultSet rs) throws SQLException {
        Employee employee = new Employee();
        employee.setEmployeeId(rs.getInt(1));
        employee.setFirstName(rs.getString(2));
        employee.setLastName(rs.getString(3));
        employee.setEmail(rs.getString(4));
        employee.setPhoneNumber(rs.getString(5));
        employee.setHireDate(rs.getString(6));

        Job job = new Job();
        job.setJobId(rs.getString("e.job_id"));
        job.setJobTitle(rs.getString("job_title"));
        employee.setJob(job);

        employee.setSalary(rs.getBigDecimal(8));
        employee.setCommissionPct(rs.getBigDecimal(9));

        Employee manager = null;
        if(rs.getInt("m.employee_id") != 0){
            manager = new Employee();
            manager.setEmployeeId(rs.getInt("m.employee_id"));
            manager.setFirstName(rs.getString("m.first_name"));
            manager.setLastName(rs.getString("m.last_name"));
            employee.setManager(manager);
        }

        Department department = new Department();
        department.setDepartmentId(rs.getInt(11));
        department.setDepartmentName(rs.getString("department_name"));
        employee.setDepartment(department);

        return employee;
    }

    private void setEmployeeData(Employee employee, PreparedStatement pstmt) throws SQLException {
        pstmt.setString(1, employee.getFirstName());
        pstmt.setString(2, employee.getLastName());
        pstmt.setString(3, employee.getEmail());
        pstmt.setString(4, employee.getPhoneNumber());
        pstmt.setString(5, employee.getHireDate());
        pstmt.setString(6, employee.getJob().getJobId());
        pstmt.setBigDecimal(7, employee.getSalary());
        if (employee.getCommissionPct() == null) {
            pstmt.setNull(8, Types.DECIMAL);
        } else {
            pstmt.setBigDecimal(8, employee.getCommissionPct());
        }
        if (employee.getManager().getEmployeeId() == 0) {
            pstmt.setNull(9, Types.INTEGER);
        } else {
            pstmt.setInt(9, employee.getManager().getEmployeeId());
        }

        if (employee.getDepartment().getDepartmentId() == 0) {
            pstmt.setNull(10, Types.INTEGER);
        } else {
            pstmt.setInt(10, employee.getDepartment().getDepartmentId());
        }
    }

}
