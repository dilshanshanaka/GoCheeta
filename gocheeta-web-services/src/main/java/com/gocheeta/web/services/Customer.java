package com.gocheeta.web.services;

/**
 *
 * @author Dilshan
 */
public class Customer extends User{

    private int customerId;
    private String firstName;
    private String lastName;
    private String mobile;

    public Customer() {
        this.customerId = 0;
        this.firstName = "";
        this.lastName = "";
        this.mobile = "";
    }

    public Customer(int customerId, String firstName, String lastName, String mobile) {
        this.customerId = customerId;
        this.firstName = firstName;
        this.lastName = lastName;
        this.mobile = mobile;
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

    public int getCustomerId() {
        return customerId;
    }

    public void setCustomerId(int customerId) {
        this.customerId = customerId;
    }
    
    

}
