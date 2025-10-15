package model;

public class Seat {
    private int seatId;
    private String seatNumber;
    private String status;
    private int busId;
    private double price;


    public Seat(int int1) {
		// TODO Auto-generated constructor stub
	}
	public int getSeatId() { return seatId; }
    public void setSeatId(int seatId) { this.seatId = seatId; }

    public String getSeatNumber() { return seatNumber; }
    public void setSeatNumber(String seatNumber) { this.seatNumber = seatNumber; }

    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }

    public int getBusId() { return busId; }
    public void setBusId(int busId) { this.busId = busId; }
    
    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

}