package com.gocheeta.web.services;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.PUT;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

/**
 *
 * @author Dilshan
 */
@Path("/customer")
public class CustomerServices {

    @GET
    @Path("/{id}")
    @Produces(MediaType.APPLICATION_JSON)
    public String getUser(@PathParam("id") int id) {
        // Database Connection
        Connection conn = DBUtil.getInstance();

        // SQL Query
        String query;
        query = "SELECT users.email, users.status, users.role, customers.id as customer_id, customers.mobile, "
                + "customers.first_name, customers.last_name FROM users INNER JOIN customers ON "
                + "users.id=customers.user_id WHERE users.id =" + id;

        try {
            Statement st = conn.createStatement();
            ResultSet result = st.executeQuery(query);

            while (result.next()) {
                int customerId = result.getInt("customer_id");
                String firstName = result.getString("first_name");
                String lastName = result.getString("last_name");
                String mobile = result.getString("mobile");
                String email = result.getString("email");
                String status = result.getString("status");
                String role = result.getString("role");

                // Customer
                Customer c = new Customer();
                c.setId(id);
                c.setCustomerId(customerId);
                c.setFirstName(firstName);
                c.setLastName(lastName);
                c.setMobile(mobile);
                c.setEmail(email);
                c.setStatus(status);
                c.setRole(role);
                c.setPassword("protected");

                Gson gson = new Gson();
                return gson.toJson(c);
            }
        } catch (SQLException ex) {
        }
        return "Error";
    }

    @PUT
    @Path("/{id}")
    @Consumes(MediaType.APPLICATION_JSON)
    public Response updateCustomer(String json, @PathParam("id") int id) {
        boolean result = false;
        int status;

        // JSON data to Java Object
        Customer c = new Gson().fromJson(json, Customer.class);
        
        try {
            // Database Connection
            Connection conn = DBUtil.getInstance();

            // SQL Query
            String query = "UPDATE customers SET first_name = '" + c.getFirstName() + "', "
                    + "last_name ='" + c.getLastName() + "', mobile = '" + c.getMobile() + "'"
                    + "WHERE user_id ='" + id + "'";

            Statement st = conn.createStatement();
            st.executeUpdate(query);

            result = true;
        } catch (SQLException e) {
            System.out.println(e);
        }

        // Response Message
        ResponseMessage response = new ResponseMessage();

        if (result) {
            response.setMessage("Sucessfully Updated");
            status = 200;
        } else {
            response.setMessage("Error occurred");
            status = 501;
        }

        Gson gson = new GsonBuilder().create();
        return Response.status(status).entity(gson.toJson(response)).build();

    }
}
