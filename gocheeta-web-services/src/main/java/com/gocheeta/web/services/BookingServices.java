package com.gocheeta.web.services;

import com.google.gson.Gson;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import static java.util.Objects.isNull;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

/**
 *
 * @author Dilshan
 */
@Path("/booking")
public class BookingServices {

    @GET
    @Path("/customer/{customerId}")
    @Produces(MediaType.APPLICATION_JSON)
    public String getCustomerBookings(@PathParam("customerId") int customerId) {
        List<Booking> bookings = new ArrayList<>();
        // Database Connection
        Connection conn = DBUtil.getInstance();

        // SQL Query
        String query = "SELECT b.id as bookingId, b.pickup, b.destination, "
                + "b.fare, b.customer_id, "
                + "b.status, "
                + "CONCAT(d.first_name, ' ', d.last_name) AS driverName, "
                + "d.mobile AS driverMobile, vc.type AS vehicle_type, br.city, v.make, v.model, "
                + "v.reg_no FROM bookings AS b INNER JOIN customers AS c ON b.customer_id = c.id "
                + "LEFT JOIN drivers AS d ON b.driver_id=d.id LEFT JOIN vehicle_categories AS vc "
                + "ON b.vehicle_category_id=vc.id INNER JOIN branches AS br ON b.branch_id = br.id "
                + "LEFT JOIN vehicles AS v ON b.vehicle_id=v.id WHERE b.customer_id = " + customerId;

        try {
            Statement st = conn.createStatement();
            ResultSet result = st.executeQuery(query);

            while (result.next()) {

                // Customer               
                Booking b = new Booking();
                b.setBookingId(result.getInt("bookingId"));
                b.setPickup(result.getString("pickup"));
                b.setDestination(result.getString("destination"));
                b.setFare(result.getFloat("fare"));
                b.setStatus(result.getString("status"));
                b.setDriverName(result.getString("driverName"));
                b.setDriverMobile(result.getString("driverMobile"));
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
    @Path("/all")
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
    @Path("/{id}")
    @Produces(MediaType.APPLICATION_JSON)
    public String getBooking(@PathParam("id") int bookingRefId) {
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
                + "LEFT JOIN vehicles AS v ON b.vehicle_id=v.id WHERE b.id =" + bookingRefId;

        try {
            Statement st = conn.createStatement();
            ResultSet result = st.executeQuery(query);

            while (result.next()) {

                // Customer               
                Booking b = new Booking();
                b.setBookingId(bookingRefId);
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

                Gson gson = new Gson();
                return gson.toJson(b);
            }
        } catch (SQLException ex) {
        }
        return "Error";
    }

    @GET
    @Path("/branches")
    @Produces(MediaType.APPLICATION_JSON)
    public String getBranches() {
        List<Branch> branches = new ArrayList<>();

        // Database Connection
        Connection conn = DBUtil.getInstance();

        // SQL Query
        String query = "SELECT * FROM branches";

        try {

            Statement st = conn.createStatement();
            ResultSet result = st.executeQuery(query);
            while (result.next()) {

                Branch br = new Branch();
                br.setBranchId(result.getInt("id"));
                br.setCity(result.getString("city"));
                br.setAddress_line_one(result.getString("address_line_one"));
                br.setAddress_line_two(result.getString("address_line_two"));
                br.setType(result.getString("type"));

                branches.add(br);

            }
        } catch (SQLException ex) {
        }
        Gson gson = new Gson();
        return gson.toJson(branches);
    }
    
    @GET
    @Path("/vehicleCategories")
    @Produces(MediaType.APPLICATION_JSON)
    public String getVehicleCategories() {
        List<VehicleCategory> vehicleCategories = new ArrayList<>();

        // Database Connection
        Connection conn = DBUtil.getInstance();

        // SQL Query
        String query = "SELECT * FROM vehicle_categories";

        try {

            Statement st = conn.createStatement();
            ResultSet result = st.executeQuery(query);
            while (result.next()) {

                VehicleCategory vc = new VehicleCategory();
                vc.setVehicleCategoryId(result.getInt("id"));
                vc.setType(result.getString("type"));
                vc.setFirstKm(result.getDouble("first_km_fare"));
                vc.setPerKm(result.getDouble("per_km_fare"));
                vc.setImagePath(result.getString("image_path"));
                vc.setPassengerSeats(result.getInt("passenger_seats"));

                vehicleCategories.add(vc);

            }
        } catch (SQLException ex) {
        }
        Gson gson = new Gson();
        return gson.toJson(vehicleCategories);
    }
    
    
}
