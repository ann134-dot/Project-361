package controller;

import model.AccessLevel;
import model.RoomType;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.List;

@WebServlet(name = "RoomTypeController", urlPatterns = {"/roomTypes/*"})
public class RoomTypeController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if (!Servlet.isLogged(req)) {
            resp.sendRedirect("/auth/login");
        } else {

            Integer operation = Servlet.getOperation(req);
            if (operation == 1) {
                List<RoomType> roomTypeList = RoomType.findAll();
                req.setAttribute("roomTypeList", roomTypeList);
                req.getRequestDispatcher("/WEB-INF/roomType/findAll.jsp").forward(req, resp);
            } else if (operation == 2) {
                RoomType roomType = RoomType.find(Servlet.getId(req));
                req.setAttribute("roomType", roomType);
                req.getRequestDispatcher("/WEB-INF/roomType/find.jsp").forward(req, resp);
            } else if (operation == 3) {
                Integer id = Servlet.getId(req);
                RoomType roomType = RoomType.find(id);
                req.setAttribute("roomType", roomType);
                req.getRequestDispatcher("/WEB-INF/roomType/form.jsp").forward(req, resp);
            } else if (operation == 4) {
                req.getRequestDispatcher("/WEB-INF/roomType/form.jsp").forward(req, resp);
            } else {
                req.getRequestDispatcher("404.jsp").forward(req, resp);
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if (!Servlet.isLogged(req)) {
            resp.sendRedirect("/auth/login");
        } else if (!Servlet.isAllowed(req, AccessLevel.OWNER)) {
            resp.sendRedirect("/dashboard");
        } else {
            Integer operation = Servlet.getOperation(req);
            if (operation == 1) {
                RoomType roomType = new RoomType(req);
                roomType = roomType.save();
                resp.sendRedirect("/roomTypes/" + roomType.getId());
            } else {
                req.getRequestDispatcher("404.jsp").forward(req, resp);
            }
        }
    }

    @Override
    protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if (!Servlet.isLogged(req)) {
            resp.sendRedirect("/auth/login");
        } else if (!Servlet.isAllowed(req, AccessLevel.OWNER)) {
            resp.sendRedirect("/dashboard");
        } else {
            Integer operation = Servlet.getOperation(req);
            if (operation == 2) {
                BufferedReader br = new BufferedReader(new InputStreamReader(req.getInputStream()));
                String data = br.readLine();
                RoomType roomType = new RoomType(data.split("&"));
                roomType.setId(Servlet.getId(req));
                roomType.update();
            } else {
                req.getRequestDispatcher("404.jsp").forward(req, resp);
            }
        }
    }

    @Override
    protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if (!Servlet.isLogged(req)) {
            resp.sendRedirect("/auth/login");
        } else if (!Servlet.isAllowed(req, AccessLevel.OWNER)) {
            resp.sendRedirect("/dashboard");
        } else {
            Integer operation = Servlet.getOperation(req);
            if (operation == 2) {
                RoomType.delete(Servlet.getId(req));
            } else {
                req.getRequestDispatcher("404.jsp").forward(req, resp);
            }
        }
    }
}
