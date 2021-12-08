package model;

import dao.GenericDAO;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.servlet.http.HttpServletRequest;
import java.time.LocalDate;
import java.util.List;

@Entity
public class Guest{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    private String login;
    private String password;
    private String name;
    private String surname;
    private String address;
    private String documentType;
    private String document;
    private LocalDate birthDate;
    private String email;
    private String phoneNumber;
    private String homeNumber;
    private static GenericDAO DAO = new GenericDAO(Guest.class);

    public Guest(String login, String password, String name, String surname, String address, String documentType, String document, LocalDate birthDate, String email, String phoneNumber, String homeNumber) {
        this.login = login;
        this.password = password;
        this.name = name;
        this.surname = surname;
        this.address = address;
        this.documentType = documentType;
        this.document = document;
        this.birthDate = birthDate;
        this.email = email;
        this.phoneNumber = phoneNumber;
        this.homeNumber = homeNumber;
    }

    public Guest() {
    }

    public Guest(String[] data){
        for(String x : data){
            String[] add = x.split("=");
            if(add.length == 1){
                continue;
            }
            if(add[0].equals("login")){
                this.login = add[1];
            }
            if(add[0].equals("password")){
                this.password = add[1];
            }
            if(add[0].equals("name")){
                this.name = add[1];
            }
            if(add[0].equals("surname")){
                this.name = add[1];
            }
            if(add[0].equals("address")){
                this.name = add[1];
            }
            if(add[0].equals("documentType")){
                this.documentType = add[1];
            }
            if(add[0].equals("document")){
                this.document = add[1];
            }
            if(add[0].equals("birth_date")){
                this.birthDate = LocalDate.parse(add[1]);
            }
            if(add[0].equals("email")){
                this.email = add[1];
            }
            if(add[0].equals("phone_number")){
                this.phoneNumber = add[1];
            }
            if(add[0].equals("home_number")){
                this.homeNumber = add[1];
            }
        }
    }

    public Guest(HttpServletRequest request) {
        if(request.getParameter("login").isEmpty()){
            this.login = null;
        }else {
            this.login = request.getParameter("login");
        }

        if(request.getParameter("password").isEmpty()){
            this.password = null;
        }else {
            this.password = request.getParameter("password");
        }

        if(request.getParameter("name").isEmpty()){
            this.name = null;
        }else {
            this.name = request.getParameter("name");
        }
        if(request.getParameter("surname").isEmpty()){
            this.surname = null;
        }else {
            this.surname = request.getParameter("surname");
        }
        if(request.getParameter("address").isEmpty()){
            this.address = null;
        }else {
            this.address = request.getParameter("address");
        }

        if(request.getParameter("document_type").isEmpty()){
            this.documentType = null;
        }else {
            this.documentType = request.getParameter("document_type");
        }

        if(request.getParameter("document").isEmpty()){
            this.document = null;
        }else{
            this.document = request.getParameter("document");
        }

        if(request.getParameter("birth_date").isEmpty()){
            this.birthDate = null;
        }else{
            this.birthDate = LocalDate.parse(request.getParameter("birth_date"));
        }

        if(request.getParameter("email").isEmpty()){
            this.email = null;
        }else {
            this.email = request.getParameter("email");
        }

        if(request.getParameter("phone_number").isEmpty()){
            this.phoneNumber = null;
        }else{
            this.phoneNumber = request.getParameter("phone_number");
        }

        if(request.getParameter("home_number").isEmpty()){
            this.homeNumber = null;
        }else {
            this.homeNumber = request.getParameter("home_number");
        }

    }

    public String getLogin() {
        return login;
    }

    public Guest setLogin(String login) {
        this.login = login;
        return this;
    }

    public String getPassword() {
        return password;
    }

    public Guest setPassword(String password) {
        this.password = password;
        return this;
    }

    public Integer getId() {
        return id;
    }

    public Guest setId(Integer id) {
        this.id = id;
        return this;
    }

    public String getName() {
        return name;
    }

    public Guest setName(String name) {
        this.name = name;
        return this;
    }
    public String getSurname() {
        return surname;
    }

    public Guest setSurname(String surname) {
        this.surname = surname;
        return this;
    }
    public String getAddress() {
        return address;
    }

    public Guest setAddress(String address) {
        this.address = address;
        return this;
    }

    public String getDocumentType() {
        return documentType;
    }

    public Guest setDocumentType(String documentType) {
        this.documentType = documentType;
        return this;
    }

    public String getDocument() {
        return document;
    }

    public Guest setDocument(String document) {
        this.document = document;
        return this;
    }

    public LocalDate getBirthDate() {
        return birthDate;
    }

    public Guest setBirthDate(LocalDate birthDate) {
        this.birthDate = birthDate;
        return this;
    }

    public String getEmail() {
        return email;
    }

    public Guest setEmail(String email) {
        this.email = email;
        return this;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public Guest setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
        return this;
    }

    public String getHomeNumber() {
        return homeNumber;
    }

    public Guest setHomeNumber(String homeNumber) {
        this.homeNumber = homeNumber;
        return this;
    }

    public static Guest save(Guest guest){
        return (Guest) DAO.save(guest);
    }

    public static Guest find(Integer id){
        return (Guest) DAO.find(id);
    }

    public static List<Guest> findAll(){
        return DAO.findAll();
    }

    public static void update(Guest guest){
        DAO.update(guest);
    }

    public static void delete(Integer id){
        DAO.delete(id);
    }

    public Guest save(){
        return (Guest) DAO.save(this);
    }

    public void update(){
        DAO.update(this);
    }

    @Override
    public String toString() {
        return "Guest{" +
                "login='" + login + '\'' +
                ", password='" + password + '\'' +
                ", id=" + id +
                ", name='" + name + '\'' +
                ", surname='" + surname + '\'' +
                ", address'" + address + '\'' +
                ", documentType='" + documentType + '\'' +
                ", document='" + document + '\'' +
                ", birthDate=" + birthDate +
                ", email='" + email + '\'' +
                ", phoneNumber='" + phoneNumber + '\'' +
                ", homeNumber='" + homeNumber + '\'' +
                '}';
    }
}
