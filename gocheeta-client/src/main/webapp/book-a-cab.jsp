<%@page import="java.net.HttpURLConnection"%>
<%@page import="java.net.URL"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%>

<%@ include file = "header.jsp" %>
<script>
    var isBookingRequest = false;

    var bookingReq = Cookies.get('bookingReq');

    if (bookingReq == "true") {
        isBookingRequest = true;
    }

//    var userId = Cookies.get('userId');
//    var userRole = Cookies.get('role');
//
//    if (userId == "undefined" || userRole == "undefined" || userRole != "Customer") {
//        window.location.replace("customer-login.jsp");
//    }

</script>
<!-- Header Start -->
<div class="about border d-flex align-items-center justify-content-center"
     style="background-color: #104a8e; height: 180px;">
    <h2 class="text-center text-white ">Book A Cab</h2>
</div>
<!-- Header Ends -->

<div class="container my-5">
    <div class="row mt-3 justify-content-md-center">
        <!-- Book a Ride Starts -->
        <div class="col-md-6 shadow-lg p-3 mb-5 bg-body rounded p-4" id="bookingDiv">
            <h3>Book a Ride</h3>
            <hr>
            <h5>Location</h5>
            <form id="addNewBooking">
                <!-- Select City Starts-->
                <div class="row my-3">
                    <label for="inputEmail3" class="col-sm-4 col-form-label">Select a city</label>
                    <div class="col-sm-6">
                        <select class="form-select" onchange="branchUpdate()" id="branchId" aria-label="Default select example">
                            <option value="1" selected>Colombo</option>
                            <option value="2">Nugegoda</option>
                            <option value="3">Galle</option>
                            <option value="4">Gampaha</option>
                            <option value="5">Kandy</option>
                            <option value="6">Kurunagala</option>                            
                        </select>
                    </div>
                </div>
                <!-- Select City Ends-->

                <!-- Location Starts -->
                <div class="row">
                    <!-- Pickup Street Starts -->
                    <div class="col-md-6">
                        <label for="pickup" class="form-label"><i class="bi bi-geo-alt-fill"></i> Pickup</label>
                        <select class="form-select pickup" id="pickup" onchange="destinationUpdate()" aria-label="Default select example">
                        </select>
                    </div>
                    <!-- Pickup Street Ends -->

                    <!-- Destination Street Starts -->
                    <div class="col-md-6">
                        <label for="destination" class="form-label"><i class="bi bi-geo-alt-fill"></i>
                            Destination</label>
                        <select class="form-select destination" id="destination" onchange="distanceCalc()" aria-label="Default select example">
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
                    <div class="col-md-3 mx-3 shadow-none p-3 mb-5 bg-light rounded">
                        <img src="images/Nano.png" class="rounded img-fluid w-100" alt="Vehicle Category Image">
                        <div class="form-check">
                            <input class="form-check-input" onchange="carSelect(this);" type="radio" value="1" name="vehicleType" id="vehicleType">
                            <label class="form-check-label" for="flexRadioDefault1">
                                <h6>Micro</h6>
                            </label>
                        </div>
                        <small>Seats - 2</small>
                    </div>

                    <div class="col-md-3 mx-3 shadow-none p-3 mb-5 bg-light rounded">
                        <img src="images/Sedan.png" class="rounded img-fluid w-100" alt="Vehicle Category Image">
                        <div class="form-check">
                            <input class="form-check-input" onchange="carSelect(this);" type="radio" value="2" name="vehicleType" id="vehicleType">
                            <label class="form-check-label" for="flexRadioDefault1">
                                <h6>Sedan</h6>
                            </label>
                        </div>
                        <small>Seats - 3</small>
                    </div>

                    <div class="col-md-3 mx-3 shadow-none p-3 mb-5 bg-light rounded">
                        <img src="images/SUV.png" class="rounded img-fluid w-100" alt="Vehicle Category Image">
                        <div class="form-check">
                            <input class="form-check-input" onchange="carSelect(this);" type="radio" value="3" name="vehicleType" id="vehicleType">
                            <label class="form-check-label" for="flexRadioDefault1">
                                <h6>SUV</h6>
                            </label>
                        </div>
                        <small>Seats - 4</small>
                    </div>

                </div>
                <!-- Estimated Fare Starts -->
                <div class="row mt-2">
                    <p>Selected Vehicle Type: <span id="type"></span> <br>
                        First KM - Rs. <span id="firstKm"></span>/ Additional per KM - Rs. <span id="perKm"></span></p>
                    <h6>Estimated Fare: Rs. <span id="fare"></span></h6>
                </div>
                <!-- Estimated Fare Ends -->
                <input type="hidden" id="destinationName" name="destinationName">
                <input type="hidden" id="fareAmount" name="fareAmount">

                <!-- Vehicle Type Ends -->

                <div class="book-now mt-3">
                    <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                        <button class="btn btn-primary me-md-2" type="submit">Book Now</button>
                    </div>
                </div>
            </form>
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
    var firstKm = 0;
    var perKm = 0;
    var type = "";
    var fare = 0.00;
    // Default Branch
    var branchId = 1;

    document.getElementById("fare").innerHTML = fare;


    function branchUpdate() {
        branchId = $("#branchId").val();
        document.getElementById("pickup").innerHTML = "";
        var pickup_location_url = "http://localhost:8080/gocheeta-web-services/api/v1/booking/pickup/" + branchId;

        $.ajax({
            type: "GET",
            url: pickup_location_url,
            dataType: "json",
            success: function (response) {
//            console.log(response);
                $.each(response, function (key, val) {
                    var pickup = `<option value="` + val.pickup + `">` + val.pickup + `</option>`;
                    $(".pickup").append(pickup);
                });
            }
        });
    }

    function destinationUpdate() {
        var pickup = $("#pickup").val();
        document.getElementById("destination").innerHTML = "";

        var destination_location_url = "http://localhost:8080/gocheeta-web-services/api/v1/booking/destination/" + pickup;

        $.ajax({
            type: "GET",
            url: destination_location_url,
            dataType: "json",
            success: function (response) {
                $.each(response, function (key, val) {
                    var destination = `<option value="` + val.distance + `">` + val.destination + `</option>`;
                    document.getElementById("destinationName").value = val.destination;
                    $(".destination").append(destination);
                });
            }
        });
    }

    function distanceCalc() {
        var distance = $("#destination").val();
        document.getElementById("distance").innerHTML = distance;
    }


    function carSelect(src) {
        var carType = src.value;

        if (carType == 1) {
            type = "Micro";
            firstKm = 150.00;
            perKm = 100.00;
        } else if (carType == 2) {
            type = "Sedan";
            firstKm = 200.00;
            perKm = 150.00;
        } else if (carType == 3) {
            type = "SUV";
            firstKm = 250.00;
            perKm = 180.00;
        }

        var dist = $("#destination").val();

        fare = getFare(dist, firstKm, perKm);

        document.getElementById("type").innerHTML = type;
        document.getElementById("firstKm").innerHTML = firstKm;
        document.getElementById("perKm").innerHTML = perKm;
        document.getElementById("fare").innerHTML = fare;

        document.getElementById("fareAmount").value = fare;
    }

//    document.getElementById("fare").innerHTML = fare;




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

    function clearBooking() {
        Cookies.remove('bookingReq');
        Cookies.remove('bookingId');
        location.reload();
    }



    $(document).ready(function () {
        $("#addNewBooking").submit(function (event) {

            var formData = {
                branchId: $("#branchId").val(),
                pickup: $("#pickup").val(),
                destination: $("#destinationName").val(),
                fare: $("#fareAmount").val(),
                customerId: 13,
                vehicleCategoryId: $('input[name="vehicleType"]:checked').val()
            };

            console.log(formData);
            // Register Company User
            $.ajax({
                type: "POST",
                url: "http://localhost:8080/gocheeta-web-services/api/v1/booking/new",
                contentType: 'application/json',
                data: JSON.stringify(formData),
                dataType: "json",
                encode: true,
            }).done(function (data) {
                Cookies.set('bookingReq', true);
            });
        });
    });



//    if (true) {
//        var bookingId = Cookies.get('bookingId');
//
//        if (bookingId == "undefined") {
//            $.ajax({
//                type: "GET",
//                url: "http://localhost:8080/gocheeta-web-services/api/v1/booking/pending/" + userId,
//                dataType: "json",
//                success: function (response) {
//                    Cookies.set('bookingId', response);
//                    location.reload();
//                }
//            });
//        }



        var booking_data_url = 'http://localhost:8080/gocheeta-web-services/api/v1/booking/9';


        $('#bookingDiv').hide();
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
//                    setInterval('location.reload()', 7000);
                } else {
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

                                <dt class="col-sm-3">Date</dt>
                                <dd class="col-sm-9">` + response.createdDate + `</dd>

                                <h5 class="mt-3 mb-2 lead">Driver Details</h5>

                                <dt class="col-sm-3">Name</dt>
                                <dd class="col-sm-9">` + response.driverName + `</dd>

                                <dt class="col-sm-3">Mobile</dt>
                                <dd class="col-sm-9">` + response.driverMobile + `</dd>

                                <h5 class="mt-3 mb-2 lead">Vehicle Details</h5>

                                <dt class="col-sm-3">No</dt>
                                <dd class="col-sm-3">` + response.regNo + `</dd>

                                <dt class="col-sm-3">Make</dt>
                                <dd class="col-sm-3">` + response.make + `</dd>

                                <dt class="col-sm-3">Model</dt>
                                <dd class="col-sm-3">` + response.model + `</dd>

                                <h5 class="mt-3 mb-2 lead">Fare Details</h5>

                                <dt class="col-sm-3">Total Fare</dt>
                                <dd class="col-sm-9">LKR ` + response.fare + `</dd>
                            </dl>
                            <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                                <button class="btn btn-primary" onclick="clearBooking()" type="button">Close</button>
                            </div>
                        </div>
                    </div>`;
                    $(".bookingDetails").append(bookingConfirmation);
                }
            }
        });
    }


</script>>

<%@ include file = "footer.jsp" %>