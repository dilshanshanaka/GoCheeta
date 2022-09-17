package com.gocheeta.web.services;

import com.google.gson.Gson;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

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
}
