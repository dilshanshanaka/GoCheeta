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
@Path("/booking/feedback")
public class CustomerFeedbackServices {

    @GET
    @Path("/{id}")
    @Produces(MediaType.APPLICATION_JSON)
    public String getCustomerFeedback(@PathParam("id") int bookingRefId) {
        // Database Connection
        Connection conn = DBUtil.getInstance();

        // SQL Query
        String query = "SELECT * FROM customer_feedback WHERE booking_id =" + bookingRefId;

        try {
            Statement st = conn.createStatement();
            ResultSet result = st.executeQuery(query);

            while (result.next()) {
                
                CustomerFeedback cf = new CustomerFeedback();
                cf.setFeedbackId(result.getInt("id"));
                cf.setBookingId(bookingRefId);
                cf.setStars(result.getInt("stars"));
                cf.setFeedback(result.getString("feedback"));
                
                Gson gson = new Gson();
                return gson.toJson(cf);
            }
        } catch (SQLException ex) {
        }
        return "Error";
    }
}
