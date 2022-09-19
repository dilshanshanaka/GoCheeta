
package com.gocheeta.web.services;

/**
 *
 * @author Dilshan
 */
public class Vehicle {
    private int vehicleId;
    private String make;
    private String model;
    private String regNo;
    private boolean availability;
    private int branchId;
    private String branch;
    private int vehicleCategoryId;
    
    
    public Vehicle(){
        this.vehicleId = 0;
        this.make = "";
        this.model = "";
        this.regNo = "";
        this.branch = "";
        this.branchId = 1;
        this.availability = false;
        this.vehicleCategoryId = 1;
    }
    
    public Vehicle(int id, String make, String model, String regNo, 
            String branch, int branchId, boolean availability){
        this.vehicleId = 0;
        this.make = "";
        this.model = "";
        this.regNo = "";
        this.branch = "";
        this.branchId = 1;
        this.availability = false;
        this.vehicleCategoryId = 1;
    }

    public int getVehicleId() {
        return vehicleId;
    }

    public void setVehicleId(int vehicleId) {
        this.vehicleId = vehicleId;
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

    public boolean isAvailability() {
        return availability;
    }

    public void setAvailability(boolean availability) {
        this.availability = availability;
    }

    public int getBranchId() {
        return branchId;
    }

    public void setBranchId(int branchId) {
        this.branchId = branchId;
    }

    public String getBranch() {
        return branch;
    }

    public void setBranch(String branch) {
        this.branch = branch;
    }

    public int getVehicleCategoryId() {
        return vehicleCategoryId;
    }

    public void setVehicleCategoryId(int vehicleCategoryId) {
        this.vehicleCategoryId = vehicleCategoryId;
    }
    
    
    
    
}
