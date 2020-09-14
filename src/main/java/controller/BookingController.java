package controller;

import model.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.*;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.List;

@WebServlet(name = "BookingController", urlPatterns = {"/bookings/*"})
public class BookingController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if(!Servlet.isLogged(req)){
            resp.sendRedirect("/auth/login");
        }else{

            Integer operation = Servlet.getOperation(req);
            if(operation == 1){
                List<Booking> bookingList = Booking.findAll();
                req.setAttribute("bookingList", bookingList);
                req.getRequestDispatcher("/WEB-INF/booking/findAll.jsp").forward(req, resp);
            }else if(operation == 2){
                Booking booking = Booking.find(Servlet.getId(req));
                req.setAttribute("booking", booking);
                List<Check> checks = Check.findAll(booking.getId());
                if(checks!=null){
                    for(Check check : checks){
                        if(check.getStatus()){
                            req.setAttribute("checkin", check);
                        }else{
                            req.setAttribute("checkout", check);
                        }
                    }
                }
                req.getRequestDispatcher("/WEB-INF/booking/find.jsp").forward(req, resp);
            }else if(operation == 3){
                Booking booking = Booking.find(Servlet.getId(req));
                req.setAttribute("booking", booking);
                req.setAttribute("roomList", Room.findAll());
                req.setAttribute("guestList", Guest.findAll());
                req.setAttribute("roomTypeList", RoomType.findAll());
                req.getRequestDispatcher("/WEB-INF/booking/form.jsp").forward(req, resp);
            }else if(operation == 4){
                req.setAttribute("roomList", Room.findAll());
                req.setAttribute("guestList", Guest.findAll());
                req.setAttribute("roomTypeList", RoomType.findAll());
                req.getRequestDispatcher("/WEB-INF/booking/form.jsp").forward(req, resp);
            }else{
                req.getRequestDispatcher("404.jsp").forward(req, resp);
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Integer operation = Servlet.getOperation(req);
        if(operation == 1){
            Booking booking = new Booking(req);
            booking.save();
            resp.sendRedirect("/bookings/" + booking.getId());
        }else{
            req.getRequestDispatcher("404.jsp").forward(req, resp);
        }
    }

    @Override
    protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Integer operation = Servlet.getOperation(req);
        if(operation == 2){
            BufferedReader br = new BufferedReader(new InputStreamReader(req.getInputStream()));
            String data = br.readLine();
            Booking booking = new Booking(data.split("&"));
            booking.setId(Servlet.getId(req));
            booking.update();
        }else{
            req.getRequestDispatcher("404.jsp").forward(req, resp);
        }
    }

    @Override
    protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Integer operation = Servlet.getOperation(req);
        if (operation == 2) {
            Booking.delete(Servlet.getId(req));
            resp.sendRedirect("/bookings/");
        }else{
            req.getRequestDispatcher("404.jsp").forward(req, resp);
        }
    }
}
