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

            <h5>Date and Time</h5>
            <div class="row mb-4">
                <!-- Date Input Starts -->
                <div class="col-md-6">
                    <div class="row mb-3">
                        <label for="inputEmail3" class="col-sm-2 col-form-label">Date</label>
                        <div class="col-sm-10">
                            <input id="startDate" class="form-control" type="date" />
                        </div>
                    </div>
                </div>
                <!-- Date Input Ends -->

                <!-- Time Input Starts -->
                <div class="col-md-6">
                    <div class="row mb-3">
                        <label for="inputEmail3" class="col-sm-2 col-form-label">Time</label>
                        <div class="col-sm-10  mt-1">
                            <input type="time" id="appt" name="appt" min="09:00" max="18:00" required>
                        </div>
                    </div>
                </div>
                <!-- Time Input Ends -->
            </div>

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
                <h6>Estimated Distance: 5km</h6>
            </div>
            <!-- Estimated Distance Ends -->

            <hr>
            <!-- Vehicle Type Starts -->
            <h5>Vehicle Type</h5>

            <div class="row mt-3 mx-2">

                <!-- Single Vehicle Type Starts -->
                <div class="col-md-3 mx-3 shadow-none p-3 mb-5 bg-light rounded">
                    <img src="images\Nano.png" class="rounded img-fluid w-100" alt="">

                    <div class="form-check">
                        <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault1">
                        <label class="form-check-label" for="flexRadioDefault1">
                            <h6>Micro</h6>
                        </label>
                    </div>
                    <small>Seats - 2</small>
                </div>
                <!-- Single Vehicle Type Ends -->

                <!-- Single Vehicle Type Starts -->
                <div class="col-md-3 mx-3 shadow-none p-3 mb-5 bg-light rounded">
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
                </div>
                <!-- Single Vehicle Type Ends -->

                <!-- Single Vehicle Type Starts -->
                <div class="col-md-3 mx-3 shadow-none p-3 mb-5 bg-light rounded">
                    <img src="images\SUV.png" class="rounded img-fluid w-100" alt="">

                    <div class="form-check">
                        <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault1">
                        <label class="form-check-label" for="flexRadioDefault1">
                            <h6>SUV</h6>
                        </label>
                    </div>
                    <small>Seats - 4</small>
                </div>
                <!-- Single Vehicle Type Ends -->

                <!-- Single Vehicle Type Starts -->
                <!-- <div class="col-md-3 mx-3 shadow-none p-3 mb-5 bg-light rounded">
                    <img src="images\pickup.png" class="rounded img-fluid w-100" alt="">

                    <div class="form-check">
                        <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault1">
                        <label class="form-check-label" for="flexRadioDefault1">
                            <h6>Pickup</h6>
                        </label>
                    </div>
                    <small>Seats - 3</small>
                </div> -->
                <!-- Single Vehicle Type Ends -->



            </div>
            <!-- Estimated Fare Starts -->
            <div class="row mt-2">
                <p>Selected Vehicle Type: SUV <br>
                    First KM - Rs. 200.00/ Additional per KM - Rs. 100.00</p>

                <h6>Estimated Fare: Rs. 600.00</h6>

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
    <div class="row mt-3 justify-content-md-center">

        <div class="col-md-6 shadow-lg p-3 mb-5 bg-body rounded p-4">
            <h3>Searching for a ride....</h3>
            <img src="images\load.jpg" class="rounded img-fluid w-100" alt="Waiting for Taxi image">
        </div>
    </div>
    <!-- Searching For A Ride Ends -->

    <!-- Booking Confirmed Starts -->
    <div class="row mt-3 justify-content-md-center">
        <div class="col-md-6 shadow-lg p-3 mb-5 bg-body rounded p-4">
            <h3>Booking Confirmed</h3>
            <hr>

            <!-- Booking Details Starts -->
            <dl class="row">
                <dt class="col-sm-3">Status</dt>
                <dd class="col-sm-9">In Progress</dd>

                <dt class="col-sm-3">Pickup</dt>
                <dd class="col-sm-9">Bauddhaloka Mawatha</dd>

                <dt class="col-sm-3">Destination</dt>
                <dd class="col-sm-9">Ananda Rajakaruna Mawatha</dd>

                <dt class="col-sm-3">City</dt>
                <dd class="col-sm-9">Colombo</dd>

                <dt class="col-sm-3">Date and Time</dt>
                <dd class="col-sm-9">2022/09/10 12.20 PM</dd>

                <h5 class="mt-3 mb-2 lead">Driver Details</h5>

                <dt class="col-sm-3">Name</dt>
                <dd class="col-sm-9">Alex Doe</dd>

                <dt class="col-sm-3">Mobile</dt>
                <dd class="col-sm-9">077 123 4567</dd>

                <h5 class="mt-3 mb-2 lead">Vehicle Details</h5>

                <dt class="col-sm-3">Vehicle Type</dt>
                <dd class="col-sm-3">SUV</dd>

                <dt class="col-sm-3">No</dt>
                <dd class="col-sm-3">WP CAB 1234</dd>

                <dt class="col-sm-3">Make</dt>
                <dd class="col-sm-3">Toyota</dd>

                <dt class="col-sm-3">Model</dt>
                <dd class="col-sm-3">Vitz</dd>

                <h5 class="mt-3 mb-2 lead">Fare Details</h5>

                <dt class="col-sm-3">Distance</dt>
                <dd class="col-sm-9">5.0 KM</dd>

                <dt class="col-sm-3">Total Fare</dt>
                <dd class="col-sm-9">LKR 600.00</dd>
            </dl>

            <!-- Booking Details Ends -->
        </div>
    </div>
    <!-- Booking Confirmed Starts Ends -->

</div>

<%@ include file = "footer.jsp" %>