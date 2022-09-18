package com.gocheeta.web.services;

/**
 *
 * @author Dilshan
 */
public class Branch {

    private int branchId;
    private String city;
    private String address_line_one;
    private String address_line_two;
    private String type;

    public Branch() {
        this.branchId = 0;
        this.city = "";
        this.address_line_one = "";
        this.address_line_two = "";
        this.type = "";
    }

    public Branch(int branchId, String city, String addressLineOne,
            String addressLineTwo, String type) {
        this.branchId = 0;
        this.city = "";
        this.address_line_one = "";
        this.address_line_two = "";
        this.type = "";
    }

    public int getBranchId() {
        return branchId;
    }

    public void setBranchId(int branchId) {
        this.branchId = branchId;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getAddress_line_one() {
        return address_line_one;
    }

    public void setAddress_line_one(String address_line_one) {
        this.address_line_one = address_line_one;
    }

    public String getAddress_line_two() {
        return address_line_two;
    }

    public void setAddress_line_two(String address_line_two) {
        this.address_line_two = address_line_two;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }
    
    
}
