package model;

import dao.GenericDAO;

import javax.persistence.*;
import javax.servlet.http.HttpServletRequest;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

@Entity
@NamedNativeQuery(name = "authenticate", query = "SELECT * FROM Employee WHERE login = :login AND password = :password", resultClass = Employee.class)
public class Employee{
    @Id
    @GeneratedValue(strategy= GenerationType.IDENTITY)
    private Integer id;
    private String name;
    private String surname;
    private String email;
    private String address;
    private String shift;
    private int salary;
    @Enumerated(EnumType.STRING)
    private AccessLevel accessLevel;
    private String login;
    private String password;
    private static GenericDAO DAO = new GenericDAO(Employee.class);

    public Employee(String name, String surname,  String email, String address, String shift,
                    int salary, AccessLevel accessLevel, String login, String password) {
        this.name = name;
        this.surname = surname;
        this.email = email;
        this.address = address;
        this.shift = shift;
        this.salary = salary;
        this.accessLevel = accessLevel;
        this.login = login;
        this.password = password;
    }

    public Employee() {
    }

    public Employee(HttpServletRequest request) {
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
        if(request.getParameter("email").isEmpty()){
            this.email = null;
        }else {
            this.email = request.getParameter("email");
        }
        if(request.getParameter("address").isEmpty()){
            this.address = null;
        }else {
            this.address = request.getParameter("address");
        }
        if(request.getParameter("shift").isEmpty()){
            this.shift = null;
        }else {
            this.shift = request.getParameter("shift");
        }
        if(request.getParameter("salary").toString().isEmpty()){
            this.salary = 0;
        }else {
            this.salary = Integer.parseInt(request.getParameter("salary"));
        }
        if(request.getParameter("access_level").isEmpty()){
            this.accessLevel = null;
        }else{
            this.accessLevel = AccessLevel.valueOf(request.getParameter("access_level"));
        }

        if(request.getParameter("login").isEmpty()){
            this.login = null;
        }else{
            this.login = request.getParameter("login");
        }

        if(request.getParameter("password").isEmpty()){
            this.password = null;
        }else{
            this.password = request.getParameter("password");
        }
    }

    public Employee(String[] data){
        for(String x : data){
            String[] add = x.split("=");
            if(add.length == 1){
                continue;
            }
            if(add[0].equals("name")){
                this.name = add[1];
            }
            if(add[0].equals("surname")){
                this.name = add[1];
            }
            if(add[0].equals("email")){
                this.name = add[1];
            }
            if(add[0].equals("address")){
                this.name = add[1];
            }
            if(add[0].equals("shift")){
                this.name = add[1];
            }
            if(add[0].equals("salary")){
                this.name = add[1];
            }
            if(add[0].equals("access_level")){
                this.accessLevel = AccessLevel.valueOf(add[1]);
            }
            if(add[0].equals("login")){
                this.login = add[1];
            }
            if(add[0].equals("password")){
                this.password = add[1];
            }
        }
    }

    public Integer getId() {
        return id;
    }

    public Employee setId(Integer id) {
        this.id = id;
        return this;
    }

    public String getName() {
        return name;
    }

    public Employee setName(String name) {
        this.name = name;
        return this;
    }

    public String getSurname() {
        return surname;
    }

    public Employee setSurname(String surname) {
        this.surname = surname;
        return this;
    }

    public String getEmail() {
        return email;
    }

    public Employee setEmail(String email) {
        this.email = email;
        return this;
    }

    public String getAddress() {
        return address;
    }

    public Employee setAddress(String address) {
        this.address = address;
        return this;
    }

    public String getShift() {
        return shift;
    }

    public Employee setShift(String shift) {
        this.shift = shift;
        return this;
    }

    public Integer getSalary() {
        return salary;
    }

    public Employee setSalary(int salary) {
        this.salary= salary;
        return this;
    }

    public AccessLevel getAccessLevel() {
        return accessLevel;
    }

    public Employee setAccessLevel(AccessLevel accessLevel) {
        this.accessLevel = accessLevel;
        return this;
    }

    public String getLogin() {
        return login;
    }

    public Employee setLogin(String login) {
        this.login = login;
        return this;
    }

    public String getPassword() {
        return password;
    }

    public Employee setPassword(String password) {
        this.password = password;
        return this;
    }

    public static Employee save(Employee employee){
        return (Employee) DAO.save(employee);
    }

    public static Employee find(Integer id){
        return (Employee) DAO.find(id);
    }

    public static List<Employee> findAll(){
        return DAO.findAll();
    }

    public static void update(Employee employee){
        DAO.update(employee);
    }

    public static void delete(Integer id){
        DAO.delete(id);
    }

    public Employee save(){
        return (Employee) DAO.save(this);
    }

    public void update(){
        DAO.update(this);
    }

    public static Boolean authenticate(HttpServletRequest request){
        HashMap<String, Object> params = new HashMap<>();
        params.put("login", request.getParameter("login"));
        params.put("password", request.getParameter("password"));

        if(Employee.findAll().isEmpty()){
            Employee employee = new Employee("", "", "", "", "",0,AccessLevel.MANAGER, "admin", "admin");
            employee.save();
        }

        Employee employee = (Employee) DAO.executeNamedQuery("authenticate",params);

        if(employee != null) {
            if (employee.id != null) {
                request.getSession().setAttribute("sessionEmployee", employee);
                return true;
            }
        }
        return false;
    }

    @Override
    public String toString() {
        return "Employee{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", surname='" + surname + '\'' +
                ", email='" + email + '\'' +
                ", address='" + address + '\'' +
                ", shift='" + shift + '\'' +
                ", salary='" + salary + '\'' +
                ", accessLevel=" + accessLevel +
                ", login='" + login + '\'' +
                ", password='" + password + '\'' +
                '}';
    }
}
