package com.gocheeta.web.services;

/**
 *
 * @author Dilshan
 */
public class Distance {
    private int distanceId;
    private String pickup;
    private String destination;
    private double distance;
    private int branchId;
    
    
    public Distance(){
        this.distanceId = 0;
        this.pickup = "";
        this.destination = "";
        this.distance = 0.0;
        this.branchId = 0;
    }
    
    public Distance(int distanceId, String pickup, String destination, 
            double distance, int branchId){
        this.distanceId = distanceId;
        this.pickup = pickup;
        this.destination = destination;
        this.distance = distance;
        this.branchId = branchId;
    }

    public int getDistanceId() {
        return distanceId;
    }

    public void setDistanceId(int distanceId) {
        this.distanceId = distanceId;
    }

    public String getPickup() {
        return pickup;
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

    public double getDistance() {
        return distance;
    }

    public void setDistance(double distance) {
        this.distance = distance;
    }

    public int getBranchId() {
        return branchId;
    }

    public void setBranchId(int branchId) {
        this.branchId = branchId;
    }

}
