package com.gocheeta.web.services;

/**
 *
 * @author Dilshan
 */
public class VehicleCategory {
    private int vehicleCategoryId;
    private String type;
    private double firstKm;
    private double perKm;
    private String imagePath;
    private int passengerSeats;
    
    public VehicleCategory(){
        this.vehicleCategoryId = 0;
        this.type = "";
        this.firstKm = 0.00;
        this.perKm = 0.00;
        this.imagePath = "";
        this.passengerSeats = 0;
    }
    
    public VehicleCategory(int vehicleCategoryId, String type, double firstKm, double perKm, 
            String imagePath, int passengerSeats){
        this.vehicleCategoryId = vehicleCategoryId;
        this.type = type;
        this.firstKm = firstKm;
        this.perKm = perKm;
        this.imagePath = imagePath;
        this.passengerSeats = passengerSeats;
    }

    public int getVehicleCategoryId() {
        return vehicleCategoryId;
    }

    public void setVehicleCategoryId(int vehicleCategoryId) {
        this.vehicleCategoryId = vehicleCategoryId;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public double getFirstKm() {
        return firstKm;
    }

    public void setFirstKm(double firstKm) {
        this.firstKm = firstKm;
    }

    public double getPerKm() {
        return perKm;
    }

    public void setPerKm(double perKm) {
        this.perKm = perKm;
    }

    public String getImagePath() {
        return imagePath;
    }

    public void setImagePath(String imagePath) {
        this.imagePath = imagePath;
    }

    public int getPassengerSeats() {
        return passengerSeats;
    }

    public void setPassengerSeats(int passengerSeats) {
        this.passengerSeats = passengerSeats;
    }
    
    
    
}
