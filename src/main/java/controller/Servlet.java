package controller;

import model.AccessLevel;
import model.Employee;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@WebServlet(name = "Servlet", urlPatterns = {""})
public class Servlet extends HttpServlet {
    public static Integer getId(HttpServletRequest request) {
        String url = request.getPathInfo();
        Pattern pattern = Pattern.compile("([\\d]{1,8})");
        Matcher matcher = pattern.matcher(url);
        if (matcher.find()) {
            if (matcher.group(0) != null) {
                return Integer.valueOf(matcher.group(1));
            }
        }
        return null;
    }

    public static Integer getOperation(HttpServletRequest request){
        String url = request.getPathInfo();
        if(url==null){
            url = "/";
        }
        Pattern pattern = Pattern.compile("^(\\/)$|^(\\/)([\\d]{1,8})$|^(\\/)([\\d]{1,8})(\\/edit)$|^(\\/new)$");
        Matcher matcher = pattern.matcher(url);

        /*
            group 0 = full match
            1 = /entity
            2 = /entity/id
            3 = /entity/id/edit
            4 = /entity/new
         */

        if(matcher.find()){
            if(matcher.group(1) != null){
                return 1;
            }else if (matcher.group(3) != null){
                return 2;
            }else if(matcher.group(5) != null){
                return 3;
            }else if(matcher.group(7) != null){
                return 4;
            }
        }
        return -1;
    }

    public static Boolean isAllowed(HttpServletRequest request, AccessLevel accessLevel){
        Employee sessionEmployee = (Employee) request.getSession().getAttribute("sessionEmployee");
        Servlet.resetSessionTime(request);
        if(sessionEmployee != null){
            if(sessionEmployee.getAccessLevel().equals(accessLevel) || sessionEmployee.getAccessLevel().equals(AccessLevel.MANAGER)){
                return true;
            }
        }
        return false;
    }

    public static Boolean isUser(HttpServletRequest request){
        Employee sessionEmployee = (Employee) request.getSession().getAttribute("sessionEmployee");
        Servlet.resetSessionTime(request);
        if(sessionEmployee != null){
            if( sessionEmployee.getAccessLevel().equals(AccessLevel.USER)){
                return true;
            }
        }
        return false;
    }

    public static Boolean isLogged(HttpServletRequest request){
        Employee sessionEmployee = (Employee) request.getSession().getAttribute("sessionEmployee");
        return sessionEmployee != null;
    }

    public static void resetSessionTime(HttpServletRequest request){
        Employee emp = (Employee) request.getSession().getAttribute("sessionEmployee");
        if(emp.getAccessLevel() == AccessLevel.MANAGER){
            request.getSession().setMaxInactiveInterval(1800);
        }else{
            request.getSession().setMaxInactiveInterval(86400);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.sendRedirect("/auth/login");
    }
}
