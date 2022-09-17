package com.gocheeta.web.services;

/**
 *
 * @author Dilshan
 */
public class Driver extends User {

    private int driverId;
    private String firstName;
    private String lastName;
    private String mobile;
    private int branchId;
    private String branch;
    private boolean availability;

    public Driver() {
        this.driverId = 0;
        this.firstName = "";
        this.lastName = "";
        this.mobile = "";
        this.branch = "";
        this.branchId = 1;
        this.availability = false;
    }

    public String getBranch() {
        return branch;
    }

    public void setBranch(String branch) {
        this.branch = branch;
    }

    
    public int getDriverId() {
        return driverId;
    }

    public void setDriverId(int driverId) {
        this.driverId = driverId;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public int getBranchId() {
        return branchId;
    }

    public void setBranchId(int branchId) {
        this.branchId = branchId;
    }

    public boolean isAvailability() {
        return availability;
    }

    public void setAvailability(boolean availability) {
        this.availability = availability;
    }

}
