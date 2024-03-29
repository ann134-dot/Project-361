package controller;

import model.*;

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

@WebServlet(name = "GuestController", urlPatterns = {"/guests/*"})
public class GuestController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if(!Servlet.isLogged(req)){
            if(Servlet.getOperation(req) == 4) {
                req.getRequestDispatcher("/WEB-INF/guest/form.jsp").forward(req, resp);
            } else {
                resp.sendRedirect("/auth/login");
            }
        }else{
            Integer operation = Servlet.getOperation(req);
            if(operation == 1){
                if(Servlet.isUser(req) ){
                    req.getRequestDispatcher("/WEB-INF/404.jsp").forward(req, resp);
                }
                List<Guest> guestList = Guest.findAll();
                req.setAttribute("guestList", guestList);
                req.getRequestDispatcher("/WEB-INF/guest/findAll.jsp").forward(req, resp);
            }else if(operation == 2){
                Guest guest = Guest.find(Servlet.getId(req));
                List<Booking> bookingList = Booking.findAllGuest(guest.getId());
                req.setAttribute("bookingList", bookingList);
                req.setAttribute("guest", guest);
                req.getRequestDispatcher("/WEB-INF/guest/find.jsp").forward(req, resp);
            }else if(operation == 3){
                if(Servlet.isUser(req) ){
                    req.getRequestDispatcher("/WEB-INF/404.jsp").forward(req, resp);
                }
                Guest guest = Guest.find(Servlet.getId(req));
                req.setAttribute("guest", guest);
                req.getRequestDispatcher("/WEB-INF/guest/form.jsp").forward(req, resp);
            }else if(operation == 4){
                if(Servlet.isUser(req) ){
                    req.getRequestDispatcher("/WEB-INF/404.jsp").forward(req, resp);
                }
                req.getRequestDispatcher("/WEB-INF/guest/form.jsp").forward(req, resp);
            }else {
                req.getRequestDispatcher("/WEB-INF/404.jsp").forward(req, resp);
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Integer operation = Servlet.getOperation(req);
        if(operation == 1){
            Guest guest = new Guest(req);
            guest = guest.save();
            Employee employee = new Employee(guest.getName(), "noSurName", guest.getEmail(),  "noAdress", "none", 0, AccessLevel.USER, guest.getLogin(), guest.getPassword(), Hotel.find(1), guest.getId());
            employee.save();
            resp.sendRedirect("/guests/" + guest.getId());
        }else {
            req.getRequestDispatcher("/WEB-INF/404.jsp").forward(req, resp);
        }
    }

    @Override
    protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Integer operation = Servlet.getOperation(req);
        if(operation == 2){
            BufferedReader br = new BufferedReader(new InputStreamReader(req.getInputStream()));
            String data = br.readLine();
            Guest guest = new Guest(URLDecoder.decode(data,  StandardCharsets.UTF_8.toString()).split("&"));
            guest.setId(Servlet.getId(req));
            guest.update();
        }else{
            req.getRequestDispatcher("/WEB-INF/404.jsp").forward(req, resp);
        }
    }

    @Override
    protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Integer operation = Servlet.getOperation(req);
        if (operation == 2) {
            Guest.delete(Servlet.getId(req));
            resp.sendRedirect("/guests/");
        }else {
            req.getRequestDispatcher("/WEB-INF/404.jsp").forward(req, resp);
        }
    }
}
