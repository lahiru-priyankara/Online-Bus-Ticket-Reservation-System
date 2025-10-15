package model;

public class Ticket {
    private int ticketId;
    private String fullname;
    private String email;
    private String seatNumbers;
    private double totalPrice;
    private int busId;
	
    public int getTicketId() {
		return ticketId;
	}
	public void setTicketId(int ticketId) {
		this.ticketId = ticketId;
	}
	public String getFullname() {
		return fullname;
	}
	public void setFullname(String fullname) {
		this.fullname = fullname;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getSeatNumbers() {
		return seatNumbers;
	}
	public void setSeatNumbers(String seatNumbers) {
		this.seatNumbers = seatNumbers;
	}
	public double getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(double totalPrice) {
		this.totalPrice = totalPrice;
	}
	public int getBusId() {
		return busId;
	}
	public void setBusId(int busId) {
		this.busId = busId;
	}

    
}
