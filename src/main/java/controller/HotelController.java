package controller;

import model.AccessLevel;
import model.Hotel;

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

@WebServlet(name = "HotelController", urlPatterns = {"/hotels/*"})
public class HotelController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if(!Servlet.isLogged(req)){
            resp.sendRedirect("/auth/login");
        }else{

            Integer operation = Servlet.getOperation(req);
            if(operation == 1) {
                List<Hotel> hotelList = Hotel.findAll();
                req.setAttribute("hotelList", hotelList);
                req.setAttribute("allowed", Servlet.isAllowed(req, AccessLevel.MANAGER));
                req.getRequestDispatcher("/WEB-INF/hotel/findAll.jsp").forward(req, resp);
            }else if(operation == 2){
                Hotel hotel = Hotel.find(Servlet.getId(req));
                req.setAttribute("hotel", hotel);
                req.setAttribute("allowed", Servlet.isAllowed(req, AccessLevel.MANAGER));
                req.getRequestDispatcher("/WEB-INF/hotel/find.jsp").forward(req, resp);
            }else if(operation == 3){
                if(Servlet.isAllowed(req, AccessLevel.MANAGER)){
                    Integer id = Servlet.getId(req);
                    Hotel hotel = Hotel.find(id);
                    req.setAttribute("hotel", hotel);
                    req.getRequestDispatcher("/WEB-INF/hotel/form.jsp").forward(req, resp);
                }else{
                    req.getRequestDispatcher("/WEB-INF/dashboard.jsp").forward(req, resp);
                }
            }else if(operation == 4){
                if(Servlet.isAllowed(req, AccessLevel.MANAGER)){
                    req.getRequestDispatcher("/WEB-INF/hotel/form.jsp").forward(req, resp);
                }else{
                    req.getRequestDispatcher("/WEB-INF/dashboard.jsp").forward(req, resp);
                }
            }else {
                req.getRequestDispatcher("/WEB-INF/404.jsp").forward(req, resp);
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Integer operation = Servlet.getOperation(req);
        if(operation == 1 ){
            Hotel hotel = new Hotel(req);
            hotel = hotel.save();
            resp.sendRedirect("/hotel/" + hotel.getId());
        }else{
            req.getRequestDispatcher("/WEB-INF/404.jsp").forward(req, resp);
        }
    }

    @Override
    protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Integer operation = Servlet.getOperation(req);
        if(operation == 2){
            BufferedReader br = new BufferedReader(new InputStreamReader(req.getInputStream()));
            String data = br.readLine();
            Hotel hotel = new Hotel(URLDecoder.decode(data,  StandardCharsets.UTF_8.toString()).split("&"));
            hotel.setId(Servlet.getId(req));
            hotel.update();
        }else {
            req.getRequestDispatcher("/WEB-INF/404.jsp").forward(req, resp);
        }
    }

    @Override
    protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Integer operation = Servlet.getOperation(req);
        if(operation == 2){
            Hotel.delete(Servlet.getId(req));
        }else{
            req.getRequestDispatcher("/WEB-INF/404.jsp").forward(req, resp);
        }
    }
}
