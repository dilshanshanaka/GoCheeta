package com.gocheeta.web.services;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import javax.ws.rs.Consumes;
import javax.ws.rs.DELETE;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
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
@Path("/admin")
public class AdminServices {

    @GET
    @Path("/bookings")
    @Produces(MediaType.APPLICATION_JSON)
    public String getAllBookings() {
        List<Booking> bookings = new ArrayList<>();
        // Database Connection
        Connection conn = DBUtil.getInstance();

        // SQL Query
        String query = "SELECT b.id as bookingId, b.branch_id, b.pickup, b.destination, "
                + "b.fare, b.customer_id, b.vehicle_category_id, b.vehicle_id, b.driver_id, "
                + "b.status, CONCAT(c.first_name, ' ', c.last_name) AS customerName, "
                + "c.mobile AS customerMobile, CONCAT(d.first_name, ' ', d.last_name) AS driverName, "
                + "d.mobile AS driverMobile, vc.type AS vehicle_type, br.city, v.make, v.model, "
                + "v.reg_no FROM bookings AS b INNER JOIN customers AS c ON b.customer_id = c.id "
                + "LEFT JOIN drivers AS d ON b.driver_id=d.id LEFT JOIN vehicle_categories AS vc "
                + "ON b.vehicle_category_id=vc.id INNER JOIN branches AS br ON b.branch_id = br.id "
                + "LEFT JOIN vehicles AS v ON b.vehicle_id=v.id";

        try {
            Statement st = conn.createStatement();
            ResultSet result = st.executeQuery(query);

            while (result.next()) {

                // Customer               
                Booking b = new Booking();
                b.setBookingId(result.getInt("bookingId"));
                b.setBranchId(result.getInt("branch_id"));
                b.setPickup(result.getString("pickup"));
                b.setDestination(result.getString("destination"));
                b.setFare(result.getFloat("fare"));
                b.setCustomerId(result.getInt("customer_id"));
                b.setVehicleCategoryId(result.getInt("vehicle_category_id"));
                b.setVehicleId(result.getInt("vehicle_id"));
                b.setDriverId(result.getInt("driver_id"));
                b.setStatus(result.getString("status"));
                b.setCustomerName(result.getString("customerName"));
                b.setDriverName(result.getString("driverName"));
                b.setDriverMobile(result.getString("driverMobile"));
                b.setCustomerMobile(result.getString("customerMobile"));
                b.setCity(result.getString("city"));
                b.setType(result.getString("vehicle_type"));
                b.setMake(result.getString("make"));
                b.setModel(result.getString("model"));
                b.setRegNo(result.getString("reg_no"));

                bookings.add(b);
            }
        } catch (SQLException ex) {
        }

        Gson gson = new Gson();
        return gson.toJson(bookings);
    }

    @GET
    @Path("/all-customers")
    @Produces(MediaType.APPLICATION_JSON)
    public String getAllCustomers() {
        List<Customer> customers = new ArrayList<>();
        // Database Connection
        Connection conn = DBUtil.getInstance();

        // SQL Query
        String query = "SELECT u.email, u.status, u.created_date, c.first_name, u.id AS id, c.id AS customerId, "
                + "c.last_name, c.mobile FROM customers AS c INNER JOIN users AS u ON c.user_id = u.id;";

        try {
            Statement st = conn.createStatement();
            ResultSet result = st.executeQuery(query);

            while (result.next()) {
                Customer c = new Customer();
                c.setId(result.getInt("id"));
                c.setCustomerId(result.getInt("customerId"));
                c.setEmail(result.getString("email"));
                c.setStatus(result.getString("status"));
                c.setFirstName(result.getString("first_name"));
                c.setLastName(result.getString("last_name"));
                c.setMobile(result.getString("mobile"));

                customers.add(c);
            }

        } catch (SQLException ex) {
        }

        Gson gson = new Gson();
        return gson.toJson(customers);
    }

    @GET
    @Path("/all-drivers")
    @Produces(MediaType.APPLICATION_JSON)
    public String getAllDrivers() {
        List<Driver> drivers = new ArrayList<>();
        // Database Connection
        Connection conn = DBUtil.getInstance();

        // SQL Query
        String query = "SELECT u.email, u.status, u.created_date, u.id AS id, d.id AS driver_id, "
                + "d.first_name, d.last_name, d.mobile, d.availability, b.city FROM drivers AS d "
                + "INNER JOIN users AS u ON d.user_id = u.id INNER JOIN branches AS b ON d.branch_id = b.id;";

        try {
            Statement st = conn.createStatement();
            ResultSet result = st.executeQuery(query);

            while (result.next()) {
                Driver d = new Driver();
                d.setId(result.getInt("id"));
                d.setDriverId(result.getInt("driver_id"));
                d.setEmail(result.getString("email"));
                d.setStatus(result.getString("status"));
                d.setBranch(result.getString("city"));
                d.setAvailability(result.getBoolean("availability"));
                d.setFirstName(result.getString("first_name"));
                d.setLastName(result.getString("last_name"));
                d.setMobile(result.getString("mobile"));

                drivers.add(d);
            }

        } catch (SQLException ex) {
        }

        Gson gson = new Gson();
        return gson.toJson(drivers);
    }

    @PUT
    @Path("/manage-user/{id}/{status}")
    @Consumes(MediaType.APPLICATION_JSON)
    public Response blockUser(@PathParam("id") int id, @PathParam("status") String status) {
        boolean result = false;
        int statusCode;

        try {
            // Database Connection
            Connection conn = DBUtil.getInstance();

            // SQL Query
            String query = "UPDATE users SET status = '" + status + "' WHERE id ='" + id + "'";

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
            statusCode = 200;
        } else {
            response.setMessage("Error occurred");
            statusCode = 501;
        }

        Gson gson = new GsonBuilder().create();
        return Response.status(statusCode).entity(gson.toJson(response)).build();
    }

    @POST
    @Path("/add-new-driver")
    @Consumes(MediaType.APPLICATION_JSON)
    public Response addNewDriver(String json) {
        boolean result = false;
        int status;
        int userId = 0;

        // JSON data to Java Object
        Driver d = new Gson().fromJson(json, Driver.class);

        PasswordHash hPassword = new PasswordHash();
        String nPwd = hPassword.convertToMD5(d.getPassword());

        // DB Connection
        Connection conn = DBUtil.getInstance();
        try {
            // SQL Statement
            Statement st = conn.createStatement();
            st.executeUpdate("INSERT INTO Users (email, password, role) "
                    + "VALUES "
                    + "( '" + d.getEmail() + "', '" + nPwd + "', 'driver')");

            // Get User ID
            String query = "SELECT id FROM users WHERE email = '" + d.getEmail() + "'";
            ResultSet r = st.executeQuery(query);

            while (r.next()) {
                userId = r.getInt("id");
            }

            if (userId != 0) {
                st.executeUpdate("INSERT INTO Drivers (first_name, last_name, user_id, mobile, branch_id, availability) "
                        + "VALUES "
                        + "( '" + d.getFirstName() + "', '" + d.getLastName() + "', '" + userId + "', '" + d.getMobile() + "', '" + d.getBranchId() + "', " + d.isAvailability() + " )");
                result = true;
            }

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

    // Add new vehicle Category
    @POST
    @Path("/add-new-vehicle-category")
    @Consumes(MediaType.APPLICATION_JSON)
    public Response addNewVehicleCategory(String json) {
        boolean result = false;
        int status;

        // JSON data to Java Object
        VehicleCategory vc = new Gson().fromJson(json, VehicleCategory.class);

        Connection conn = DBUtil.getInstance();

        try {
            // SQL Statement
            Statement st = conn.createStatement();
            st.executeUpdate("INSERT INTO vehicle_categories (type, first_km_fare, per_km_fare, image_path, passenger_seats) "
                    + "VALUES "
                    + "( '" + vc.getType() + "', '" + vc.getFirstKm() + "', '" + vc.getPerKm() + "', '" + vc.getImagePath() + "', '" + vc.getPassengerSeats() + "')");
            result = true;
        } catch (SQLException ex) {
        }

        // Response Message
        AuthResponse response = new AuthResponse();

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

    // Add new Vehicle
    @POST
    @Path("/add-new-vehicle")
    @Consumes(MediaType.APPLICATION_JSON)
    public Response addNewVehicle(String json) {
        boolean result = false;
        int status;

        // JSON data to Java Object
        Vehicle v = new Gson().fromJson(json, Vehicle.class);

        Connection conn = DBUtil.getInstance();

        try {
            // SQL Statement
            Statement st = conn.createStatement();
            st.executeUpdate("INSERT INTO vehicles (make, model, reg_no, availability, branch_id, vehicle_category_id) "
                    + "VALUES "
                    + "( '" + v.getMake() + "', '" + v.getModel() + "', '" + v.getRegNo() + "', " + v.isAvailability() + ", " + v.getBranchId() + ", " + v.getVehicleCategoryId() + " )");
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

    // Delete a Vehicle
    @DELETE
    @Path("delete-vehicle/{id}")
    public Response deleteVehicle(@PathParam("id") int id) {
        boolean result = false;
        int status;

        Connection conn = DBUtil.getInstance();

        try {
            Statement st = conn.createStatement();
            st.executeUpdate("DELETE FROM vehicles WHERE (id = " + id + ")");
            result = true;
        } catch (SQLException ex) {
        }

        // Response Message
        ResponseMessage response = new ResponseMessage();

        if (result) {
            response.setMessage("Sucessfully Deleted");
            status = 200;
        } else {
            response.setMessage("Error occurred");
            status = 501;
        }

        Gson gson = new GsonBuilder().create();
        return Response.status(status).entity(gson.toJson(response)).build();
    }

    // Get All Vehicles
    @GET
    @Path("/all-vehicles")
    @Produces(MediaType.APPLICATION_JSON)
    public String getAllVehicles() {
        List<Vehicle> vehicles = new ArrayList<>();
        // Database Connection
        Connection conn = DBUtil.getInstance();

        // SQL Query
        String query = "SELECT v.id AS id, v.make, v.model, v.reg_no, v.availability, "
                + "v.branch_id, v.vehicle_category_id, b.city AS branch FROM vehicles AS v "
                + "INNER JOIN branches AS b ON v.branch_id = b.id";

        try {
            Statement st = conn.createStatement();
            ResultSet result = st.executeQuery(query);

            while (result.next()) {
                Vehicle v = new Vehicle();
                v.setVehicleId(result.getInt("id"));
                v.setMake(result.getString("make"));
                v.setModel(result.getString("model"));
                v.setRegNo(result.getString("reg_no"));
                v.setBranch(result.getString("branch"));
                v.setAvailability(result.getBoolean("availability"));
                v.setVehicleCategoryId(result.getInt("vehicle_category_id"));
                v.setBranchId(result.getInt("branch_id"));
                vehicles.add(v);
            }

        } catch (SQLException ex) {
        }

        Gson gson = new Gson();
        return gson.toJson(vehicles);
    }

    // Get total earnings of branches
    @GET
    @Path("/branch-earnings")
    @Produces(MediaType.APPLICATION_JSON)
    public String branchEarnings() {
        List<Branch> branches = new ArrayList<>();
        // Database Connection
        Connection conn = DBUtil.getInstance();

        // SQL Query
        String query = "SELECT b.branch_id, br.city, SUM(b.fare) AS totalEarnings "
                + "FROM bookings AS b INNER JOIN branches AS br ON b.branch_id = br.id GROUP BY branch_id";

        try {
            Statement st = conn.createStatement();
            ResultSet result = st.executeQuery(query);

            while (result.next()) {
                Branch b = new Branch();

                b.setBranchId(result.getInt("branch_id"));
                b.setCity(result.getString("city"));
                b.setTotalEarnings(result.getDouble("totalEarnings"));

                branches.add(b);

            }

        } catch (SQLException ex) {
        }

        Gson gson = new Gson();
        return gson.toJson(branches);
    }

}
