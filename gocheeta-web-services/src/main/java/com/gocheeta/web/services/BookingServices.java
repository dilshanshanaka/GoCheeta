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
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

/**
 *
 * @author Dilshan
 */
@Path("/booking")
public class BookingServices {

    @GET
    @Path("/customer/{userId}")
    @Produces(MediaType.APPLICATION_JSON)
    public String getCustomerBookings(@PathParam("userId") int userId) {
        List<Booking> bookings = new ArrayList<>();
        // Database Connection
        Connection conn = DBUtil.getInstance();

        // SQL Query
        String query = "SELECT b.id as bookingId, b.pickup, b.destination, "
                + "b.fare, b.customer_id, "
                + "b.status, b.date_and_time, "
                + "CONCAT(d.first_name, ' ', d.last_name) AS driverName, "
                + "d.mobile AS driverMobile, vc.type AS vehicle_type, br.city, v.make, v.model, "
                + "v.reg_no FROM bookings AS b INNER JOIN customers AS c ON b.customer_id = c.id "
                + "LEFT JOIN drivers AS d ON b.driver_id=d.id LEFT JOIN vehicle_categories AS vc "
                + "ON b.vehicle_category_id=vc.id INNER JOIN branches AS br ON b.branch_id = br.id "
                + "LEFT JOIN vehicles AS v ON b.vehicle_id=v.id WHERE c.user_id = " + userId + " ORDER BY b.id DESC";

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
                b.setCreatedDate(result.getDate("date_and_time"));

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
        String query = "SELECT b.id as bookingId, b.date_and_time, b.branch_id, b.pickup, b.destination, "
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
                b.setCreatedDate(result.getDate("date_and_time"));

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

    // Get pickup locations
    @GET
    @Path("pickup/{branchId}")
    @Produces(MediaType.APPLICATION_JSON)
    public String getPickupLocations(@PathParam("branchId") int branchId) {
        List<Distance> distances = new ArrayList<>();

        Connection conn = DBUtil.getInstance();

        String query = "SELECT pickup FROM `streets` WHERE branch_id = " + branchId + " GROUP BY pickup";

        try {
            Statement st = conn.createStatement();
            ResultSet result = st.executeQuery(query);

            while (result.next()) {
                Distance d = new Distance();

                d.setPickup(result.getString("pickup"));

                distances.add(d);
            }
        } catch (SQLException ex) {
        }
        Gson gson = new Gson();
        return gson.toJson(distances);
    }

    // Get Destinations and distance
    @GET
    @Path("destination/{pickup}")
    @Produces(MediaType.APPLICATION_JSON)
    public String getPickupLocations(@PathParam("pickup") String pickup) {
        List<Distance> distances = new ArrayList<>();

        Connection conn = DBUtil.getInstance();

        String query = "SELECT destination, distance FROM streets WHERE pickup = '" + pickup + "'";

        try {
            Statement st = conn.createStatement();
            ResultSet result = st.executeQuery(query);

            while (result.next()) {
                Distance d = new Distance();

                d.setDestination(result.getString("destination"));
                d.setDistance(result.getDouble("distance"));

                distances.add(d);
            }
        } catch (SQLException ex) {
        }
        Gson gson = new Gson();
        return gson.toJson(distances);
    }

    @POST
    @Path("/new")
    @Consumes(MediaType.APPLICATION_JSON)
    public Response addBooking(String json) {
        boolean result = false;
        int status;
        int customerId = 0;
        // JSON data to Java Object
        Booking b = new Gson().fromJson(json, Booking.class);

        Connection conn = DBUtil.getInstance();

        try {
            String query = "SELECT id FROM customers WHERE user_id = '" + b.getCustomerId() + "'";
            Statement st = conn.createStatement();
            ResultSet r = st.executeQuery(query);

            while (r.next()) {
                customerId = r.getInt("id");
            }

            st.executeUpdate("INSERT INTO Bookings (branch_id, pickup, destination, fare, customer_id, vehicle_category_id) "
                    + "VALUES "
                    + "( '" + b.getBranchId() + "', '" + b.getPickup() + "', '" + b.getDestination() + "', '" + b.getFare() + "', '" + customerId + "', '" + b.getVehicleCategoryId() + "')");
            result = true;

        } catch (SQLException ex) {
        }

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

    // Get Last Pending Booking
    @GET
    @Path("pending/{userId}")
    @Produces(MediaType.APPLICATION_JSON)
    public String pendingBooking(@PathParam("userId") int userId) {
        int customerId = 0;
        int bookingId = 0;

        Connection conn = DBUtil.getInstance();
        try {
            String query = "SELECT id FROM customers WHERE user_id = '" + userId + "'";
            Statement st = conn.createStatement();
            ResultSet r = st.executeQuery(query);

            while (r.next()) {
                customerId = r.getInt("id");
            }

            String queryTwo = "SELECT id FROM bookings WHERE customer_id = " + customerId + " AND status = 'pending' OR status = 'accepted' ORDER BY id DESC LIMIT 1";
            Statement stTwo = conn.createStatement();
            ResultSet rs = stTwo.executeQuery(queryTwo);

            while (rs.next()) {
                bookingId = rs.getInt("id");
                return String.valueOf(bookingId);
            }

        } catch (SQLException ex) {
        }
        return "Error";
    }

    @GET
    @Path("/driver/past/{userId}")
    @Produces(MediaType.APPLICATION_JSON)
    public String driverPastBookings(@PathParam("userId") int userId) {
        List<Booking> bookings = new ArrayList<>();
        // Database Connection
        Connection conn = DBUtil.getInstance();

        // SQL Query
        String query = "SELECT b.id as bookingId, b.date_and_time, b.pickup, b.destination, "
                + "b.fare, b.customer_id, b.status, CONCAT(c.first_name, ' ', c.last_name) AS customerName, "
                + "c.mobile AS customerMobile, vc.type AS vehicle_type, br.city, v.make, v.model, v.reg_no "
                + "FROM bookings AS b INNER JOIN customers AS c ON b.customer_id = c.id "
                + "LEFT JOIN drivers AS d ON b.driver_id=d.id LEFT JOIN vehicle_categories AS vc "
                + "ON b.vehicle_category_id=vc.id INNER JOIN branches AS br ON b.branch_id = br.id "
                + "LEFT JOIN vehicles AS v ON b.vehicle_id=v.id WHERE d.user_id = '" + userId + "' && "
                + "b.status = 'completed' || b.status = 'canceled' ORDER BY b.id DESC;";

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
                b.setCustomerName(result.getString("customerName"));
                b.setCustomerMobile(result.getString("customerMobile"));
                b.setCity(result.getString("city"));
                b.setType(result.getString("vehicle_type"));
                b.setMake(result.getString("make"));
                b.setModel(result.getString("model"));
                b.setRegNo(result.getString("reg_no"));
                b.setCreatedDate(result.getDate("date_and_time"));

                bookings.add(b);

            }
        } catch (SQLException ex) {
        }

        Gson gson = new Gson();
        return gson.toJson(bookings);
    }

    @GET
    @Path("/driver/ongoing/{userId}")
    @Produces(MediaType.APPLICATION_JSON)
    public String ongoingDriverBooking(@PathParam("userId") int userId)
    {
        List<Booking> bookings = new ArrayList<>();
        // Database Connection
        Connection conn = DBUtil.getInstance();

        // SQL Query
        String query = "SELECT b.id as bookingId, b.date_and_time, b.pickup, b.destination, "
                + "b.fare, b.customer_id, b.status, CONCAT(c.first_name, ' ', c.last_name) AS customerName, "
                + "c.mobile AS customerMobile, vc.type AS vehicle_type, br.city, v.make, v.model, v.reg_no "
                + "FROM bookings AS b INNER JOIN customers AS c ON b.customer_id = c.id "
                + "LEFT JOIN drivers AS d ON b.driver_id=d.id LEFT JOIN vehicle_categories AS vc "
                + "ON b.vehicle_category_id=vc.id INNER JOIN branches AS br ON b.branch_id = br.id "
                + "LEFT JOIN vehicles AS v ON b.vehicle_id=v.id WHERE d.user_id = '" + userId + "' && "
                + "b.status = 'accepted' ORDER BY b.id DESC;";

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
                b.setCustomerName(result.getString("customerName"));
                b.setCustomerMobile(result.getString("customerMobile"));
                b.setCity(result.getString("city"));
                b.setType(result.getString("vehicle_type"));
                b.setMake(result.getString("make"));
                b.setModel(result.getString("model"));
                b.setRegNo(result.getString("reg_no"));
                b.setCreatedDate(result.getDate("date_and_time"));

                bookings.add(b);

            }
        } catch (SQLException ex) {
        }

        Gson gson = new Gson();
        return gson.toJson(bookings);
    }
    
    @GET
    @Path("/driver/booking-request/{branchId}")
    @Produces(MediaType.APPLICATION_JSON)
    public String requestDriverBooking(@PathParam("branchId") int branchId)
    {
        List<Booking> bookings = new ArrayList<>();
        // Database Connection
        Connection conn = DBUtil.getInstance();

        // SQL Query
        String query = "SELECT b.id as bookingId, b.date_and_time, b.pickup, b.destination, "
                + "b.fare, b.customer_id, b.status, CONCAT(c.first_name, ' ', c.last_name) AS customerName, "
                + "c.mobile AS customerMobile, b.vehicle_category_id AS vehicle_category_id ,vc.type AS vehicle_type, br.city, v.make, v.model, v.reg_no "
                + "FROM bookings AS b INNER JOIN customers AS c ON b.customer_id = c.id "
                + "LEFT JOIN drivers AS d ON b.driver_id=d.id LEFT JOIN vehicle_categories AS vc "
                + "ON b.vehicle_category_id=vc.id INNER JOIN branches AS br ON b.branch_id = br.id "
                + "LEFT JOIN vehicles AS v ON b.vehicle_id=v.id WHERE br.id = '" + branchId + "' && "
                + "b.status = 'pending'";

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
                b.setCustomerName(result.getString("customerName"));
                b.setCustomerMobile(result.getString("customerMobile"));
                b.setCity(result.getString("city"));
                b.setType(result.getString("vehicle_type"));                
                b.setVehicleCategoryId(result.getInt("vehicle_category_id"));
                b.setMake(result.getString("make"));
                b.setModel(result.getString("model"));
                b.setRegNo(result.getString("reg_no"));
                b.setCreatedDate(result.getDate("date_and_time"));

                bookings.add(b);

            }
        } catch (SQLException ex) {
        }

        Gson gson = new Gson();
        return gson.toJson(bookings);
    }
}
