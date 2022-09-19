package com.gocheeta.web.services;

/**
 *
 * @author Dilshan
 */
public class UserNewPassword extends User {

    private String newPassword;

    public UserNewPassword() {
        this.newPassword = "";
    }

    public UserNewPassword(String newPassword) {
        this.newPassword = newPassword;
    }

    public String getNewPassword() {
        return newPassword;
    }

    public void setNewPassword(String newPassword) {
        this.newPassword = newPassword;
    }
}
