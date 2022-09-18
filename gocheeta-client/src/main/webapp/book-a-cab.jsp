<%@page import="java.net.HttpURLConnection"%>
<%@page import="java.net.URL"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%>

<%@ include file = "header.jsp" %>

<!-- Header Start -->
<div class="about border d-flex align-items-center justify-content-center"
     style="background-color: #104a8e; height: 180px;">
    <h2 class="text-center text-white ">Book A Cab</h2>
</div>
<!-- Header Ends -->

<div class="container my-5">
    <div class="row mt-3 justify-content-md-center">
        <!-- Book a Ride Starts -->
        <div class="col-md-6 shadow-lg p-3 mb-5 bg-body rounded p-4">
            <h3>Book a Ride</h3>
            <hr>
            <h5>Location</h5>

            <!-- Select City Starts-->
            <div class="row my-3">
                <label for="inputEmail3" class="col-sm-4 col-form-label">Select a city</label>
                <div class="col-sm-6">
                    <select class="form-select" aria-label="Default select example">
                        <option selected>Colombo</option>
                        <option value="1">Nugegoda</option>
                        <option value="2">Jaffna</option>
                        <option value="3">Kandy</option>
                    </select>
                </div>
            </div>
            <!-- Select City Ends-->

            <!-- Location Starts -->
            <div class="row">
                <!-- Pickup Street Starts -->
                <div class="col-md-6">
                    <label for="pickup" class="form-label"><i class="bi bi-geo-alt-fill"></i> Pickup</label>
                    <select class="form-select" aria-label="Default select example">
                        <option selected>Bauddhaloka Mawatha</option>
                        <option value="1">Nugegoda</option>
                        <option value="2">Jaffna</option>
                        <option value="3">Kandy</option>
                    </select>
                </div>
                <!-- Pickup Street Ends -->

                <!-- Destination Street Starts -->
                <div class="col-md-6">
                    <label for="destination" class="form-label"><i class="bi bi-geo-alt-fill"></i>
                        Destination</label>
                    <select class="form-select" aria-label="Default select example">
                        <option selected>Ananda Rajakaruna Mawatha</option>
                        <option value="1">Nugegoda</option>
                        <option value="2">Jaffna</option>
                        <option value="3">Kandy</option>
                    </select>
                </div>
                <!-- Destination Street Ends -->
            </div>
            <!-- Location Ends -->

            <!-- Estimated Distance Starts -->
            <div class="row mt-3">
                <h6>Estimated Distance: <span id="distance"></span>km</h6>
            </div>
            <!-- Estimated Distance Ends -->

            <hr>
            <!-- Vehicle Type Starts -->
            <h5>Vehicle Type</h5>

            <div class="row mt-3 mx-2 vehicle-category">



                <!-- Single Vehicle Type Starts -->
                <!--                <div class="col-md-3 mx-3 shadow-none p-3 mb-5 bg-light rounded">
                                    <img src="images\Sedan.png" class="rounded img-fluid w-100" alt=""
                                         style="filter: grayscale(100%);">
                
                                    <div class="form-check">
                                        <input class="form-check-input" type="radio" name="flexRadioDefault" disabled
                                               id="flexRadioDefault1">
                                        <label class="form-check-label" for="flexRadioDefault1">
                                            <h6>Sedan</h6>
                                        </label>
                                    </div>
                                    <small>Unavailable</small>
                                </div>-->
                <!-- Single Vehicle Type Ends -->

            </div>
            <!-- Estimated Fare Starts -->
            <div class="row mt-2">
                <p>Selected Vehicle Type: SUV <br>
                    First KM - Rs. 200.00/ Additional per KM - Rs. 100.00</p>

                <h6>Estimated Fare: Rs. <span id="fare"></span></h6>

            </div>
            <!-- Estimated Fare Ends -->
            <!-- Vehicle Type Ends -->

            <div class="book-now mt-3">
                <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                    <button class="btn btn-primary me-md-2" type="button">Book Now</button>
                </div>
            </div>
        </div>
        <!-- Book a Ride Ends -->
    </div>

    <!-- Searching For A Ride Starts -->
    <div class="pending">
    </div>
    <!-- Searching For A Ride Ends -->

    <!-- Booking Details Starts -->
    <div class="bookingDetails">
    </div>
    <!-- Booking Details Ends -->


</div>

<script>


    // Distance Calculator
    function getDistance(latitude1, longitude1, latitude2, longitude2) {
        var p = 0.017453292519943295; //This is  Math.PI / 180
        var c = Math.cos;
        var a = 0.5 - c((latitude2 - latitude1) * p) / 2 +
                c(latitude1 * p) * c(latitude2 * p) *
                (1 - c((longitude2 - longitude1) * p)) / 2;
        var R = 6371; //  Earth distance in km so it will return the distance in km
        var dist = 2 * R * Math.asin(Math.sqrt(a)) * 2;
        return dist;
    }

    // Fare Calculator
    function getFare(distance, firstKm, perKm) {
        var fare;
        if (distance <= 1) {
            fare = firstKm;
        } else {
            fare = (distance - 1) * perKm + firstKm;
        }

        return fare;
    }

    var calcDistance = getDistance(6.934404023935403, 79.85166098291769, 6.924027770253638, 79.84492395015823);
    var distance = Math.round(getDistance(6.934404023935403, 79.85166098291769, 6.924027770253638, 79.84492395015823) * 100) / 100;
    var fare = Math.round(getFare(calcDistance, 150, 100) * 100) / 100;
    document.getElementById("distance").innerHTML = distance;
    document.getElementById("fare").innerHTML = fare;
    console.log();
    var isBookingRequest = false;
    $(document).ready(function () {

        var formData = {
            branchId: $("#branchId").val(),
            pickup: $("#pickup").val(),
            destination: $("#destination").val(),
            fare: $("#fare").val(),
            customerId: $("#customerId").val(),
            vehicleCategoryId: $("#vehicleCategoryId").val(),
        };
        // Register Company User
        $.ajax({
            type: "POST",
            url: book_url,
            data: formData,
            dataType: "json",
            encode: true,
        }).done(function (data) {
//            isBookingRequest = true;b 
        });
    });
    var vehicle_url = "http://localhost:8080/gocheeta-web-services/api/v1/booking/vehicleCategories";
    $.ajax({
        type: "GET",
        url: vehicle_url,
        dataType: "json",
        success: function (response) {
//            console.log(response);
            $.each(response, function (key, val) {
                var vehicleCategory = `
                    <div class="col-md-3 mx-3 shadow-none p-3 mb-5 bg-light rounded">
                        <img src="` + val.imagePath + `" class="rounded img-fluid w-100" alt="">
                                <div class="form-check">
                                <input class="form-check-input" type="radio" name="vehicleType" id="vehicleType">
                        <label class="form-check-label" for="flexRadioDefault1">
                        <h6>` + val.type + `</h6>
                        </label>
                        </div>
                        <small>Seats - ` + val.passengerSeats + `</small>
                    </div>`;
                $(".vehicle-category").append(vehicleCategory);

            });
        }
    });

    var booking_data_url = 'http://localhost:8080/gocheeta-web-services/api/v1/booking/2';

    if (isBookingRequest) {
        $.ajax({
            type: "GET",
            url: booking_data_url,
            dataType: "json",
            success: function (response) {
                if (response.status === "pending") {
                    var pendingMessage = `
                    <div class="row mt-3 justify-content-md-center">
                        <div class="col-md-6 shadow-lg p-3 mb-5 bg-body rounded p-4">
                            <h3>Searching for a ride....</h3>
                            <img src="images\\load.jpg" class="rounded img-fluid w-100" alt="Waiting for Taxi image">
                        </div>
                    </div>`;

                    $(".pending").append(pendingMessage);
                    setInterval('location.reload()', 7000);
                } else {
                    console.log(response);
                    var bookingConfirmation = `
                    <div class="row mt-3 justify-content-md-center">
                        <div class="col-md-6 shadow-lg p-3 mb-5 bg-body rounded p-4">
                            <h3>Booking Confirmed</h3>
                            <hr>
                            <dl class="row booking-details">
                                <dt class="col-sm-3">Status</dt>
                                <dd class="col-sm-9">` + response.status + `</dd>

                                <dt class="col-sm-3">Pickup</dt>
                                <dd class="col-sm-9">` + response.pickup + `</dd>

                                <dt class="col-sm-3">Destination</dt>
                                <dd class="col-sm-9">` + response.destination + `</dd>

                                <dt class="col-sm-3">City</dt>
                                <dd class="col-sm-9">` + response.city + `</dd>

                                <dt class="col-sm-3">Date and Time</dt>
                                <dd class="col-sm-9">2022/09/10 12.20 PM</dd>

                                <h5 class="mt-3 mb-2 lead">Driver Details</h5>

                                <dt class="col-sm-3">Name</dt>
                                <dd class="col-sm-9">` + response.driverName + `</dd>

                                <dt class="col-sm-3">Mobile</dt>
                                <dd class="col-sm-9">` + response.driverMobile + `</dd>

                                <h5 class="mt-3 mb-2 lead">Vehicle Details</h5>

                                <dt class="col-sm-3">Vehicle Type</dt>
                                <dd class="col-sm-3">` + response.type + `</dd>

                                <dt class="col-sm-3">No</dt>
                                <dd class="col-sm-3">` + response.regNo + `</dd>

                                <dt class="col-sm-3">Make</dt>
                                <dd class="col-sm-3">` + response.make + `</dd>

                                <dt class="col-sm-3">Model</dt>
                                <dd class="col-sm-3">` + response.model + `</dd>

                                <h5 class="mt-3 mb-2 lead">Fare Details</h5>

                                <dt class="col-sm-3">Distance</dt>
                                <dd class="col-sm-9">5.0 KM</dd>

                                <dt class="col-sm-3">Total Fare</dt>
                                <dd class="col-sm-9">LKR ` + response.fare + `</dd>
                            </dl>
                        </div>
                    </div>`;
                    $(".bookingDetails").append(bookingConfirmation);
                }
            }
        });
    }


</script>>

<%@ include file = "footer.jsp" %>