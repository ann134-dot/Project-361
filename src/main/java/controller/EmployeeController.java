package controller;

import model.AccessLevel;
import model.Employee;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URLDecoder;
import java.nio.charset.StandardCharsets;
import java.util.List;
// asdauhdoisu
@WebServlet(name = "EmployeeController", urlPatterns = {"/employee/*"})
public class EmployeeController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if(!Servlet.isLogged(req)){
            resp.sendRedirect("/auth/login");
        }else{
            Integer operation = Servlet.getOperation(req);
            if(Servlet.isAllowed(req, AccessLevel.MANAGER)){
                if (operation == 1) {
                    List<Employee> employeeList = Employee.findAll();
                    req.setAttribute("employeeList", employeeList);
                    req.getRequestDispatcher("/WEB-INF/employee/findAll.jsp").forward(req, resp);
                }else if (operation == 2){
                    Employee employee = Employee.find(Servlet.getId(req));
                    req.setAttribute("employee", employee);
                    req.setAttribute("sessionEmployee",(Employee) req.getSession().getAttribute("sessionEmployee"));
                    req.getRequestDispatcher("/WEB-INF/employee/find.jsp").forward(req, resp);
                }else if (operation == 3){
                    Employee employee = Employee.find(Servlet.getId(req));
                    req.setAttribute("employee", employee);
                    req.setAttribute("accessLevelList", AccessLevel.values());
                    req.getRequestDispatcher("/WEB-INF/employee/form.jsp").forward(req, resp);
                }else if(operation == 4){
                    req.setAttribute("accessLevelList", AccessLevel.values());
                    req.getRequestDispatcher("/WEB-INF/employee/form.jsp").forward(req, resp);
                }else{
                    req.getRequestDispatcher("/WEB-INF/404.jsp").forward(req, resp);
                }
            }else {
                req.getRequestDispatcher("/WEB-INF/dashboard.jsp").forward(req, resp);
            }
        }
    }
    //here

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int x = 0;
        Integer operation = Servlet.getOperation(req);
        if(operation == 1){
            Employee employee = new Employee(req);
            employee.save();
            resp.sendRedirect("/employee/" + employee.getId());
        }else{
            req.getRequestDispatcher("/WEB-INF/404.jsp").forward(req, resp);
        }
    }

    @Override
    protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Integer operation = Servlet.getOperation(req);
        if (operation == 2) {
            BufferedReader br = new BufferedReader(new InputStreamReader(req.getInputStream()));
            String data = br.readLine();
            Employee employee = new Employee(URLDecoder.decode(data,  StandardCharsets.UTF_8.toString()).split("&"));
            employee.setId(Servlet.getId(req));
            employee.update();
            Employee employeeSession = (Employee) req.getSession().getAttribute("sessionEmployee");
            if(employee.getId().equals(employeeSession.getId())){
                req.getSession().setAttribute("sessionEmployee", employee);
            }
        }else {
            req.getRequestDispatcher("/WEB-INF/404.jsp").forward(req, resp);
        }
    }

    @Override
    protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Integer operation = Servlet.getOperation(req);
        if (operation == 2) {
            Employee.delete(Servlet.getId(req));
            Employee employeeSession = (Employee) req.getSession().getAttribute("sessionEmployee");
            if(Servlet.getId(req).equals(employeeSession.getId())){
                req.getRequestDispatcher("/auth/logout").forward(req, resp);
            }
        }else {
            req.getRequestDispatcher("/WEB-INF/404.jsp").forward(req, resp);
        }
    }
}
