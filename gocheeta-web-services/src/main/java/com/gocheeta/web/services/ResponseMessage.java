package com.gocheeta.web.services;
/**
 *
 * @author Dilshan
 */
public class ResponseMessage {
   private String message;

    public ResponseMessage(String message, int status) {
        this.message = message;
    }
    
    public ResponseMessage() {
        this.message = "";
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }   
}
