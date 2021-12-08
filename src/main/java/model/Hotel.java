package model;

import dao.GenericDAO;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Entity
public class Hotel {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    private String city;
    private String name;
    private String address;
    private static GenericDAO DAO = new GenericDAO(Hotel.class);

    public Hotel(String city, String name, String address){
        this.city = city;
        this.name = name;
        this.address = address;
    }
    public Hotel(){

    }
    public Hotel(String[] data){
        for(String x : data){
            String[] add = x.split("=");
            if(add.length == 1){
                continue;
            }
            if(add[0].equals("name")){
                this.name = add[1];
            }
            if(add[0].equals("city")){
                this.city = add[1].replaceAll("[\\n\\t]", "");
            }

            if(add[0].equals("address")){
                this.address = add[1];
            }
        }
    }
    public Hotel(HttpServletRequest request){
        if(request.getParameter("name").isEmpty()){
            this.name = null;
        }else{
            this.name = request.getParameter("name");
        }

        if(request.getParameter("city").isEmpty()){
            this.city = null;
        }else{
            this.city = request.getParameter("city");
        }

        if(request.getParameter("address").isEmpty()){
            this.address = null;
        }else{
            this.address = request.getParameter("address");
        }
    }
    public Integer getId() {
        return id;
    }

    public Hotel setId(Integer id) {
        this.id = id;
        return this;
    }

    public String getName() {
        return name;
    }

    public Hotel setName(String name) {
        this.name = name;
        return this;
    }

    public String getAddress() {
        return address;
    }

    public Hotel setAddress(String address) {
        this.address = address;
        return this;
    }

    public String getCity() {
        return city;
    }

    public Hotel setCity(String city) {
        this.city = city;
        return this;
    }

    public static Hotel save(Hotel hotel){
        return (Hotel) DAO.save(hotel);
    }

    public static Hotel find(Integer id){
        return (Hotel) DAO.find(id);
    }

    public static List<Hotel> findAll(){
        return DAO.findAll();
    }

    public static List<Hotel> findAll(String args){
        return DAO.findAll(args);
    }

    public static void update(Hotel hotel){
        DAO.update(hotel);
    }

    public static void delete(Integer id){
        DAO.delete(id);
    }

    public Hotel save(){
        return (Hotel) DAO.save(this);
    }

    public void update(){
        DAO.update(this);
    }

    @Override
    public String toString() {
        return String.valueOf(id);
    }


}
