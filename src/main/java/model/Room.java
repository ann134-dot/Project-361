package model;

import dao.GenericDAO;

import javax.persistence.*;
import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;

@Entity
public class Room {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    @ManyToOne
    private RoomType roomType;
    @ManyToOne
    private Hotel hotel;
    private Integer number;
    private Integer clean;
    private static GenericDAO DAO = new GenericDAO(Room.class);

    public Room(RoomType roomType, Hotel hotel, Integer number, Integer clean) {
        this.roomType = roomType;
        this.hotel = hotel;
        this.number = number;
        this.clean = clean;
    }

    public Room() {
    }

    public Room(String[] data) {
        for (String x : data) {
            String[] add = x.split("=");
            if (add.length == 1) {
                continue;
            }
            if(add[0].equals("id_hotel")){
                this.hotel = Hotel.find(Integer.valueOf(add[1]));
            }
            if (add[0].equals("id_hotel")) {
                this.roomType = RoomType.find(Integer.valueOf(add[1]));
            }
            if (add[0].equals("number")) {
                this.number = Integer.valueOf(add[1]);
            }
            if (add[0].equals("clean")) {
                this.clean = Integer.valueOf(add[1]);
            }
        }
    }

    public Room(HttpServletRequest request) {
        if (request.getParameter("id_room_type").isEmpty()) {
            this.roomType = null;
        } else {
            this.roomType = RoomType.find(Integer.valueOf(request.getParameter("id_room_type")));
        }
        if(request.getParameter("id_hotel").isEmpty()){
            this.hotel = null;
        }else{
            this.hotel = Hotel.find(Integer.valueOf(request.getParameter("id_hotel")));
        }
        if (request.getParameter("number").isEmpty()) {
            this.number = null;
        } else {
            this.number = Integer.valueOf(request.getParameter("number"));
        }
        if (request.getParameter("clean").isEmpty()) {
            this.clean = null;
        } else {
            this.clean = Integer.valueOf(request.getParameter("clean"));
        }
    }

    public Integer getId() {
        return id;
    }

    public Room setId(Integer id) {
        this.id = id;
        return this;
    }

    public RoomType getRoomType() {
        return roomType;
    }

    public String getAvailability() {

        if (DAO.findAll("WHERE id = " + this.getId() + " AND id IN (SELECT room FROM Booking  WHERE id IN (SELECT booking FROM Checks WHERE status = 1) AND id NOT IN (SELECT booking FROM Checks WHERE status = 0))") != null) {
            if (!DAO.findAll("WHERE id = " + this.getId() + " AND id IN (SELECT room FROM Booking  WHERE id IN (SELECT booking FROM Checks WHERE status = 1) AND id NOT IN (SELECT booking FROM Checks WHERE status = 0))").isEmpty()) {
                return "Occupied";
            }
        }
        if(DAO.findAll("WHERE id = " + this.getId() + " AND id IN (SELECT room FROM Booking WHERE id NOT IN (SELECT booking FROM Checks ))") != null) {
            if (!DAO.findAll("WHERE id = " + this.getId() + " AND id IN (SELECT room FROM Booking WHERE id NOT IN (SELECT booking FROM Checks ))").isEmpty()) {
                return "Booked";
            }
        }
        return "Available";
    }

    public Room setRoomType(RoomType roomType) {
        this.roomType = roomType;
        return this;
    }

    public Hotel getHotel() {
        return hotel;
    }

    public Room setHotel(Hotel hotel) {
        this.hotel = hotel;
        return this;
    }

    public Integer getNumber() {
        return number;
    }

    public Room setNumber(Integer number) {
        this.number = number;
        return this;
    }

    public Integer getClean() {
        return clean;
    }

    public Room setClean(Integer clean) {
        this.clean = clean;
        return this;
    }
    public static Room save(Room room) {
        return (Room) DAO.save(room);
    }

    public static Room find(Integer id) {
        return (Room) DAO.find(id);
    }

    public static List<Room> findAll() {
        return DAO.findAll();
    }

    public static Integer countAll(String args) {
        return DAO.countAll("id", args);
    }

    public static List<Room> findAll(String args) {
        return DAO.findAll(args);
    }

    public static void update(Room room) {
        DAO.update(room);
    }

    public static void delete(Integer id) {
        DAO.delete(id);
    }

    public Room save() {
        return (Room) DAO.save(this);
    }

    public void update() {
        DAO.update(this);
    }

    @Override
    public String toString() {
        return "Room{" +
                "id=" + id +
                ", roomType=" + roomType +
                ", hotel=" + hotel +
                ", number=" + number +
                '}';
    }

    public String toJSON() {
        return "{" +
                "\"id\":\"" + id + "\"" +
                ", \"hotel\":\"" + hotel + "\"" +
                ", \"number\":\"" + number + "\"" +
                "}";
    }
}
