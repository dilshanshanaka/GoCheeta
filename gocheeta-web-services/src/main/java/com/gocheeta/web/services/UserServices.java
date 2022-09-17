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
    @Consumes(MediaType.APPLICATION_JSON)
    public Response addUser(String json) {
        boolean result = false;
        int status;

        // JSON data to Java Object
        User u = new Gson().fromJson(json, User.class);

        // DB Connection
        Connection conn = DBUtil.getInstance();
        try {
            // SQL Statement
            Statement st = conn.createStatement();
            st.executeUpdate("INSERT INTO Users (email, password) "
                    + "VALUES "
                    + "( '" + u.getEmail() + "', '" + u.getPassword() + "')");

            result = true;

        } catch (SQLException ex) {
        }

        // Response Message
        ResponseMessage response = new ResponseMessage();

        if (result) {
            response.setMessage("Sucessfully added");
            status = 200;
        } else {
            response.setMessage("Error occurred");
            status = 501;
        }

        Gson gson = new GsonBuilder().create();
        return Response.status(status).entity(gson.toJson(response)).build();
    }

}
