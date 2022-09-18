package com.gocheeta.web.services;

/**
 *
 * @author Dilshan
 */
public class Booking {

    private int bookingId;
    private int branchId;
    private String pickup;
    private String destination;
    private float fare;
    private int customerId;
    private int vehicleCategoryId;
    private int vehicleId;
    private int driverId;
    private String status;
    private String customerName;
    private String driverName;
    private String city;
    private String customerMobile;
    private String driverMobile;
    private String make;
    private String model;
    private String regNo;
    private String type;
        
    public Booking() {
        this.bookingId = 0;
        this.branchId = 0;
        this.pickup = "";
        this.destination = "";
        this.fare = (float) 0.00;
        this.customerId = 0;
        this.vehicleCategoryId = 0;
        this.vehicleId = 0;
        this.driverId = 0;
        this.status = "";
        this.customerName = "";
        this.customerMobile ="";
        this.driverName = "";
        this.driverMobile = "";
        this.city ="";
        this.make ="";
        this.model ="";
        this.regNo = "";
    }

    public Booking(int bookingId, int branchId, String pickup, String destination,
            float fare, int customerId, int vehicleCategoryId, int vehicleId, String driverName,
            int driverId, String status, String customerName, String customerMobile, 
            String driverMobile, String city, String make, String model, String regNo) {
        this.bookingId = bookingId;
        this.branchId = branchId;
        this.pickup = pickup;
        this.destination = destination;
        this.fare = fare;
        this.customerId = customerId;
        this.vehicleCategoryId = vehicleCategoryId;
        this.vehicleId = vehicleId;
        this.driverId = driverId;
        this.status = status;
        this.customerName = customerName;
        this.customerMobile = customerMobile;
        this.driverName = driverName;
        this.driverMobile = driverMobile;
        this.city = city;
        this.make = make;
        this.model = model;
        this.regNo = regNo;
    }

    public int getBookingId() {
        return bookingId;
    }

    public void setBookingId(int bookingId) {
        this.bookingId = bookingId;
    }

    public int getBranchId() {
        return branchId;
    }

    public void setBranchId(int branchId) {
        this.branchId = branchId;
    }

    public String getPickup() {
        return pickup;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public void setPickup(String pickup) {
        this.pickup = pickup;
    }

    public String getDestination() {
        return destination;
    }

    public void setDestination(String destination) {
        this.destination = destination;
    }

    public float getFare() {
        return fare;
    }

    public void setFare(float fare) {
        this.fare = fare;
    }

    public int getCustomerId() {
        return customerId;
    }

    public void setCustomerId(int customerId) {
        this.customerId = customerId;
    }

    public int getVehicleCategoryId() {
        return vehicleCategoryId;
    }

    public void setVehicleCategoryId(int vehicleCategoryId) {
        this.vehicleCategoryId = vehicleCategoryId;
    }

    public int getVehicleId() {
        return vehicleId;
    }

    public void setVehicleId(int vehicleId) {
        this.vehicleId = vehicleId;
    }

    public int getDriverId() {
        return driverId;
    }

    public void setDriverId(int driverId) {
        this.driverId = driverId;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getDriverName() {
        return driverName;
    }

    public void setDriverName(String driverName) {
        this.driverName = driverName;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getCustomerMobile() {
        return customerMobile;
    }

    public void setCustomerMobile(String customerMobile) {
        this.customerMobile = customerMobile;
    }

    public String getDriverMobile() {
        return driverMobile;
    }

    public void setDriverMobile(String driverMobile) {
        this.driverMobile = driverMobile;
    }

    public String getMake() {
        return make;
    }

    public void setMake(String make) {
        this.make = make;
    }

    public String getModel() {
        return model;
    }

    public void setModel(String model) {
        this.model = model;
    }

    public String getRegNo() {
        return regNo;
    }

    public void setRegNo(String regNo) {
        this.regNo = regNo;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    
}
