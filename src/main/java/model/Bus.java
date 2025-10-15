package model;

public class Bus {
    private int busId;
    private String name;
    private String type;
    private int routeId;
    private String departureTime;
    private String arivelTime;
    private int seatCount;
    private double price;
    
    public Bus() {}

    public Bus(int busId, String name, String type, int routeId, String departureTime, String arivelTime, int seatCount, double price) {
        this.busId = busId;
        this.name = name;
        this.type = type;
        this.routeId = routeId;
        this.departureTime = departureTime;
        this.arivelTime = arivelTime;
        this.seatCount = seatCount;
        this.price = price;
    }

    
    public int getBusId() { return busId; }
    public void setBusId(int busId) { this.busId = busId; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public String getType() { return type; }
    public void setType(String type) { this.type = type; }

    public int getRouteId() { return routeId; }
    public void setRouteId(int routeId) { this.routeId = routeId; }

    public String getDepartureTime() { return departureTime; }
    public void setDepartureTime(String departureTime) { this.departureTime = departureTime; }
    
    
    
    public String getArivelTime() {
		return arivelTime;
	}

	public void setArivelTime(String arivelTime) {
		this.arivelTime = arivelTime;
	}

	public int getSeatCount() { return seatCount; }
    public void setSeatCount(int seatCount) { this.seatCount = seatCount; }
    
    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }
}
