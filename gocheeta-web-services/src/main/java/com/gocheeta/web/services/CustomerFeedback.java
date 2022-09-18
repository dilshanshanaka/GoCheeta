/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.gocheeta.web.services;

/**
 *
 * @author Dilshan
 */
public class CustomerFeedback {
    private int feedbackId;
    private int bookingId;
    private int stars;
    private String feedback;
    
    public CustomerFeedback(){
        this.feedbackId = 0;
        this.bookingId = 0;
        this.stars = 0;
        this.feedback = "Not available";
    }
    
    public CustomerFeedback(int feedbackId, int bookingId, int stars, String feedback){
        this.feedbackId = feedbackId;
        this.bookingId = bookingId;
        this.stars = stars;
        this.feedback = feedback;
    }

    public int getFeedbackId() {
        return feedbackId;
    }

    public void setFeedbackId(int feedbackId) {
        this.feedbackId = feedbackId;
    }

    public int getBookingId() {
        return bookingId;
    }

    public void setBookingId(int bookingId) {
        this.bookingId = bookingId;
    }

    public int getStars() {
        return stars;
    }

    public void setStars(int stars) {
        this.stars = stars;
    }

    public String getFeedback() {
        return feedback;
    }

    public void setFeedback(String feedback) {
        this.feedback = feedback;
    }
    
}
