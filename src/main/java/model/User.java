package model;

public class User {
    private int id;
    private String fullname;
    private String username;
    private String email;
    private String phone;
    private String country;
    private String password;
    
    
    public User() {}
    
    public User(int id, String fullname, String username, String email, String phone, String country, String password) {
        this.id = id;
        this.fullname = fullname;
        this.username = username;
        this.email = email;
        this.phone = phone;
        this.country = country;
        this.password = password;
       
    }

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    
    public String getName() { return fullname; }
    public void setName(String name) { this.fullname = name; }
    
    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }
    
    public String getPhone() { return phone; }
    public void setPhone(String phone) { this.phone = phone; }
    
    public String getPassword() { return password; }
    public void setPassword(String password) { this.password = password; }

	public String getUsername() {return username;}
    public void setUsername(String username) {this.username = username;}

	public String getCountry() {return country;}
    public void setCountry(String country) {this.country = country;}
    

}
