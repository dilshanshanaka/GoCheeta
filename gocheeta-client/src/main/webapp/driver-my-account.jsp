<%@ include file = "header.jsp" %>
<script>
    var userId = Cookies.get('userId');
    var userRole = Cookies.get('role');

    if (userId == "undefined" || userRole == null || user != "customer") {
        window.location.replace("driver-login.jsp");
    }

//    var loggedIn = false;
//
//    if (loggedIn) {
//        window.location.replace("driver-login.jsp");
//    }
</script>
<div class="container my-5">
    <h2><strong> My Account</strong></h2>

    <div class="row mt-3">
        <div class="col-md-2">
            <div class="nav flex-column nav-pills me-3" id="v-pills-tab" role="tablist" aria-orientation="vertical">
                <button class="nav-link active" id="v-pills-home-tab" data-bs-toggle="pill"
                        data-bs-target="#v-pills-home" type="button" role="tab" aria-controls="v-pills-home"
                        aria-selected="true">Profile</button>
                <button class="nav-link" id="v-pills-profile-tab" data-bs-toggle="pill"
                        data-bs-target="#v-pills-profile" type="button" role="tab" aria-controls="v-pills-profile"
                        aria-selected="false">Bookings</button>
            </div>
        </div>
        <div class="col-md-10 shadow-lg p-3 mb-5 bg-body rounded">
            <div class="tab-content" id="v-pills-tabContent">
                <!-- Profile Tab Starts -->
                <div class="tab-pane fade show active py-4 px-5" id="v-pills-home" role="tabpanel"
                     aria-labelledby="v-pills-home-tab" tabindex="0">
                    <div class="row profile-row">

                    </div>
                    <hr>

                    <h5 class="my-3">Change Password</h5>
                    <form id="changePassword">
                        <div class="alert-pw-msg" id="alertMsg"></div>
                        <div class="col-md-8">
                            <div class="row mb-3">
                                <label for="firstName" class="col-sm-4 col-form-label">New Password</label>
                                <div class="col-sm-8">
                                    <input type="password" class="form-control" id="newPassword">
                                </div>
                            </div>
                        </div>
                        <div class="col-md-8">
                            <div class="row mb-3">
                                <label for="lastName" class="col-sm-4 col-form-label">Confirm Password</label>
                                <div class="col-sm-8">
                                    <input type="password" class="form-control" id="cPassword">
                                </div>
                            </div>
                        </div>
                        <div class="col-md-8">
                            <div class="row mb-3">
                                <label for="lastName" class="col-sm-4 col-form-label">Current Password</label>
                                <div class="col-sm-8">
                                    <input type="password" class="form-control" id="oldPassword">
                                </div>
                            </div>
                        </div>
                        <div class="col-md-8">
                            <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                                <button class="btn btn-primary me-md-2" type="submit">Update</button>
                            </div>
                        </div>
                    </form>
                </div>
                <!-- Profile Tab Ends -->

                <div class="tab-pane fade py-2 px-2" id="v-pills-profile" role="tabpanel"
                     aria-labelledby="v-pills-profile-tab" tabindex="0">
                    <div class="row">
                        <h4 class="mb-3">Bookings Requests</h4>
                        <table class="table table-hover">
                            <thead>
                                <tr>
                                    <th scope="col">Date and Time</th>
                                    <th scope="col">Pickup</th>
                                    <th scope="col">Destination</th>
                                    <th scope="col">City</th>
                                    <th scope="col">Customer Name</th>
                                    <th scope="col">Customer Mobile</th>
                                    <th scope="col">Vehicle Type</th>
                                    <th scope="col">No</th>
                                    <th scope="col">Make & Model</th>
                                    <th scope="col">Estimated Fare (LKR)</th>
                                    <th scope="col"></th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>2022/09/10 12.20 PM</td>
                                    <td>Bauddhaloka Mawatha</td>
                                    <td>Ananda Rajakaruna Mawatha</td>
                                    <td>Colombo</td>
                                    <td>Alex Doe</td>
                                    <td>077 1234567</td>
                                    <td>Micro</td>
                                    <td>WP CAB 1234</td>
                                    <td>Toyota Vitz</td>
                                    <td>600.00</td>
                                    <td><button type="button" class="btn btn-success btn-sm">Accept</button></td>
                                </tr>
                            </tbody>
                        </table>
                        <h4 class="my-3">Previous Bookings</h4>
                        <table class="table table-hover">
                            <thead>
                                <tr>
                                    <th scope="col">#</th>
                                    <th scope="col">Date and Time</th>
                                    <th scope="col">Pickup</th>
                                    <th scope="col">Destination</th>
                                    <th scope="col">City</th>
                                    <th scope="col">Customer Name</th>
                                    <th scope="col">Vehicle Type</th>
                                    <th scope="col">No</th>
                                    <th scope="col">Make & Model</th>
                                    <th scope="col">Fare (LKR)</th>
                                    <th scope="col">Status</th>
                                    <th scope="col">Review</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <th scope="row">1</th>
                                    <td>2022/09/10 12.20 PM</td>
                                    <td>Bauddhaloka Mawatha</td>
                                    <td>Ananda Rajakaruna Mawatha</td>
                                    <td>Colombo</td>
                                    <td>Alex Doe</td>
                                    <td>Micro</td>
                                    <td>WP CAB 1234</td>
                                    <td>Toyota Vitz</td>
                                    <td>600.00</td>
                                    <td>Completed</td>
                                    <td><button type="button" class="btn btn-primary btn-sm">View</button></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    userId = Cookies.get('userId');
    var profile_data_url = 'http://localhost:8080/gocheeta-web-services/api/v1/driver/' + userId;

    $.ajax({
        type: "GET",
        url: profile_data_url,
        dataType: "json",
        success: function (response) {
            var profile = `<h4 class="mb-3">Profile</h4>
            <form id="profileUpdate">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="row mb-3">
                                <label for="firstName" class="col-sm-3 col-form-label">First Name</label>
                                <div class="col-sm-9">
                                    <input type="text" id="firstName" class="form-control" value="` + response.firstName + `">
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="row mb-3">
                                <label for="lastName" class="col-sm-3 col-form-label">Last Name</label>
                                <div class="col-sm-9">
                                    <input type="text" id="lastName" class="form-control" value="` + response.lastName + `">
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="row mb-3">
                                <label for="lastName" class="col-sm-3 col-form-label">Email</label>
                                <div class="col-sm-9">
                                    <input type="email" class="form-control" value="` + response.email + `" disabled>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="row mb-3">
                                <label for="lastName" class="col-sm-3 col-form-label">Mobile</label>
                                <div class="col-sm-9">
                                    <input type="text" id="mobile" class="form-control" value="` + response.mobile + `">
                                </div>
                            </div>
                        </div>
                        <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                            <button class="btn btn-primary me-md-2" type="submit">Update</button>
                        </div>
                    </div>
            </form>`;
            $(".profile-row").append(profile);
        }
    });

    $(document).ready(function () {
        // Update Profile
        $("#profileUpdate").submit(function (event) {
            event.preventDefault();
            var formData = {
                firstName: $("#firstName").val(),
                lastName: $("#lastName").val(),
                mobile: $("#mobile").val()
            };
            console.log(formData);
            $.ajax({
                type: "PUT",
                url: "http://localhost:8080/gocheeta-web-services/api/v1/driver/" + userId,
                contentType: 'application/json',
                data: JSON.stringify(formData),
                encode: true

            }).done(function (data) {
                location.reload();
            });
        });
        // Change Password
        $("#changePassword").submit(function (event) {
            event.preventDefault();
            document.getElementById("alertMsg").innerHTML = "";

            if ($("#newPassword").val() === $("#cPassword").val()) {
                var formData = {
                    id: userId,
                    password: $("#oldPassword").val(),
                    newPassword: $("#newPassword").val()
                };

                $.ajax({
                    type: "PUT",
                    url: "http://localhost:8080/gocheeta-web-services/api/v1/user/change-password/" + userId,
                    contentType: 'application/json',
                    data: JSON.stringify(formData),
                    encode: true
                }).done(function (data) {
                    location.reload();
                });
            } else {
                var errorMsg = `<div class="alert alert-danger" role="alert">
                                Confirm password mismatch.</div>`;
                $(".alert-pw-msg").append(errorMsg);
            }
        });
    });

</script>
<%@ include file = "footer.jsp" %>