
package com.gocheeta.web.services;

/**
 *
 * @author Dilshan
 */
public class AuthResponse extends ResponseMessage{
    private int userId;
    private String role;
    
    public AuthResponse(){
        this.userId = 0;
        this.role = "";
    }
    
    public AuthResponse(int userId, String role){
        this.userId = userId;
        this.role = role;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }
    
}
