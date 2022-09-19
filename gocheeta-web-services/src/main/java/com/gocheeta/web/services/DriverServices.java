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
@Path("/driver")
public class DriverServices {

    @GET
    @Path("/{id}")
    @Produces(MediaType.APPLICATION_JSON)
    public String getDriver(@PathParam("id") int id) {
        // Database Connection
        Connection conn = DBUtil.getInstance();

        // SQL Query
        String query;
        query = "SELECT users.email, users.status, users.role, drivers.id as driver_id, drivers.mobile, "
                + "drivers.first_name, drivers.last_name, drivers.availability, branches.city, "
                + "branches.id as branch_id FROM users INNER JOIN drivers ON users.id=drivers.user_id "
                + "INNER JOIN branches ON drivers.branch_id = branches.id WHERE users.id =" + id;

        try {
            Statement st = conn.createStatement();
            ResultSet result = st.executeQuery(query);

            while (result.next()) {
                int driverId = result.getInt("driver_id");
                String firstName = result.getString("first_name");
                String lastName = result.getString("last_name");
                String mobile = result.getString("mobile");
                String email = result.getString("email");
                String status = result.getString("status");
                String role = result.getString("role");
                String branch = result.getString("city");
                int branchId = result.getInt("branch_id");
                boolean availability = result.getBoolean("availability");

                // Driver
                Driver d = new Driver();
                d.setId(id);
                d.setDriverId(driverId);
                d.setFirstName(firstName);
                d.setLastName(lastName);
                d.setMobile(mobile);
                d.setBranch(branch);
                d.setBranchId(branchId);
                d.setAvailability(availability);
                d.setEmail(email);
                d.setStatus(status);
                d.setRole(role);
                d.setPassword("protected");

                Gson gson = new Gson();
                return gson.toJson(d);
            }
        } catch (SQLException ex) {
        }
        return "Error";
    }

    @PUT
    @Path("/{id}")
    @Consumes(MediaType.APPLICATION_JSON)
    public Response updateDriver(String json, @PathParam("id") int id) {
        boolean result = false;
        int status;

        // JSON data to Java Object
        Customer c = new Gson().fromJson(json, Customer.class);

        try {
            // Database Connection
            Connection conn = DBUtil.getInstance();

            // SQL Query
            String query = "UPDATE drivers SET first_name = '" + c.getFirstName() + "', "
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
