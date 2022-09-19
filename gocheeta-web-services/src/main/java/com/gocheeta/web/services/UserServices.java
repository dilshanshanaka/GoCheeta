package com.gocheeta.web.services;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.ws.rs.POST;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Consumes;
import javax.ws.rs.PUT;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

/**
 *
 * @author Dilshan
 */
@Path("/user")
public class UserServices {

    @GET
    @Path("/{id}")
    @Produces(MediaType.APPLICATION_JSON)
    public String getUser(@PathParam("id") int id) {
        // Database Connection
        Connection conn = DBUtil.getInstance();

        // SQL Query
        String query;
        query = "SELECT * FROM Users Where id =" + id;

        try {
            Statement st = conn.createStatement();
            ResultSet result = st.executeQuery(query);

            while (result.next()) {
                String password = result.getString("password");
                String email = result.getString("email");
                String role = result.getString("role");
                String status = result.getString("status");

                // User
                User user = new User();
                user.setId(id);
                user.setEmail(email);
                user.setPassword(password);
                user.setRole(role);
                user.setStatus(status);

                Gson gson = new Gson();
                return gson.toJson(user);
            }
        } catch (SQLException ex) {
        }
        return "Error";
    }

    @POST
    @Path("/register/customer")
    @Consumes(MediaType.APPLICATION_JSON)
    public Response addCustomer(String json) {
        boolean result = false;
        int status;
        int userId = 0;

        // JSON data to Java Object
        Customer c = new Gson().fromJson(json, Customer.class);

        PasswordHash hPassword = new PasswordHash();
        String nPwd = hPassword.convertToMD5(c.getPassword());

        // DB Connection
        Connection conn = DBUtil.getInstance();
        try {
            // SQL Statement
            Statement st = conn.createStatement();
            st.executeUpdate("INSERT INTO Users (email, password, role) "
                    + "VALUES "
                    + "( '" + c.getEmail() + "', '" + nPwd + "', '" + c.getRole() + "')");

            // Get User ID
            String query = "SELECT id FROM users WHERE email = '" + c.getEmail() + "'";
            ResultSet r = st.executeQuery(query);

            while (r.next()) {
                userId = r.getInt("id");
            }

            if (userId != 0) {
                st.executeUpdate("INSERT INTO Customers (first_name, last_name, user_id, mobile) "
                        + "VALUES "
                        + "( '" + c.getFirstName() + "', '" + c.getLastName() + "', '" + userId + "', '" + c.getMobile() + "')");
                result = true;
            }

        } catch (SQLException ex) {
        }

        // Response Message
        AuthResponse response = new AuthResponse();

        if (result) {
            response.setMessage("Sucessfully added");
            response.setUserId(userId);
            response.setRole("Customer");
            status = 200;
        } else {
            response.setMessage("Error occurred");
            status = 501;
        }

        Gson gson = new GsonBuilder().create();
        return Response.status(status).entity(gson.toJson(response)).build();
    }

    @POST
    @Path("/login")
    @Consumes(MediaType.APPLICATION_JSON)
    public Response login(String json) {
        int status = 0;

        // Response Message
        AuthResponse response = new AuthResponse();

        // JSON data to Java Object
        User u = new Gson().fromJson(json, User.class);

        // Password Hash
        PasswordHash hPassword = new PasswordHash();
        String nPwd = hPassword.convertToMD5(u.getPassword());

        // Database Connection
        Connection conn = DBUtil.getInstance();

        try {
            // SQL Query
            String query = "SELECT * FROM users WHERE email = '" + u.getEmail() + "'";
            Statement st = conn.createStatement();
            ResultSet r = st.executeQuery(query);

            // SQL Statement
            while (r.next()) {
                User user = new User();
                user.setId(r.getInt("id"));
                user.setEmail("Protected");
                user.setPassword(r.getString("password"));
                user.setRole(r.getString("role"));
                user.setStatus(r.getString("status"));

                // Check Password
                if (user.getPassword().equals(nPwd)) {
                    // Check Role
                    if (user.getRole().equals(u.getRole())) {

                        if (user.getStatus().equals("active")) {
                            response.setMessage("Sucess");
                            response.setUserId(user.getId());
                            response.setRole(user.getRole());
                            status = 200;
                        } else {
                            response.setMessage("Blocked");
                            status = 403;
                        }
                    } else {
                        response.setMessage("Access Denied");
                        status = 403;

                    }
                } else {
                    response.setMessage("Invalid Password");
                    status = 400;

                }
            }
        } catch (SQLException ex) {
        }

        Gson gson = new GsonBuilder().create();
        return Response.status(status).entity(gson.toJson(response)).build();
    }

    @PUT
    @Path("change-password/{id}")
    @Consumes(MediaType.APPLICATION_JSON)
    public Response updatePassword(String json, @PathParam("id") int id) {
        int status;
        ResponseMessage response = new ResponseMessage();
        // Database Connection
        Connection conn = DBUtil.getInstance();

        // JSON data to Java Object
        UserNewPassword u = new Gson().fromJson(json, UserNewPassword.class);

        PasswordHash cPassword = new PasswordHash();
        String cPwd = cPassword.convertToMD5(u.getPassword());

        PasswordHash hPassword = new PasswordHash();
        String nPwd = hPassword.convertToMD5(u.getNewPassword());

        String query = "SELECT * FROM users WHERE id = " + id;

        try {
            Statement st = conn.createStatement();
            ResultSet r = st.executeQuery(query);

            while (r.next()) {
                User user = new User();

                user.setId(r.getInt("id"));
                user.setEmail("Protected");
                user.setPassword(r.getString("password"));
                user.setRole("protected");
                user.setStatus("protected");

                if (cPwd.equals(user.getPassword())) {
                    // SQL Query
                    String queryTwo = "UPDATE users SET password = '" + nPwd + "' WHERE id = " + id;

                    Statement stTwo = conn.createStatement();
                    stTwo.executeUpdate(queryTwo);

                    response.setMessage("Sucessfully Updated");
                    status = 200;
                } else {
                    response.setMessage("Current Password Error");
                    status = 501;
                }

                Gson gson = new GsonBuilder().create();
                return Response.status(status).entity(gson.toJson(response)).build();
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        response.setMessage("Something Went Wrong");
        status = 501;
        Gson gson = new GsonBuilder().create();
        return Response.status(status).entity(gson.toJson(response)).build();

    }
}
