<%@ include file = "header.jsp" %>
<script>
    var userId = Cookies.get('userId');
    var userRole = Cookies.get('role');

    if (userId == "undefined" || userRole == null || user != "customer") {
        window.location.replace("customer-login.jsp");
    }

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

                <div class="tab-pane fade py-4 px-5" id="v-pills-profile" role="tabpanel"
                     aria-labelledby="v-pills-profile-tab" tabindex="0">
                    <div class="row">
                        <h4 class="mb-3">My Bookings</h4>
                        <table class="table table-hover table-sm">
                            <thead>
                                <tr>
                                    <th scope="col">#</th>
                                    <th scope="col">Date and Time</th>
                                    <th scope="col">Pickup</th>
                                    <th scope="col">Destination</th>
                                    <th scope="col">City</th>
                                    <th scope="col">Driver Name</th>
                                    <th scope="col">Vehicle Type</th>
                                    <th scope="col">No</th>
                                    <th scope="col">Make & Model</th>
                                    <th scope="col">Fare (LKR)</th>
                                    <th scope="col">Status</th>
                                </tr>
                            </thead>
                            <tbody class="table-data">

                            </tbody>
                        </table>
                    </div>
                </div>                           
            </div>
        </div>
    </div>
</div>

<script>
    var profile_data_url = 'http://localhost:8080/gocheeta-web-services/api/v1/customer/' + userId;

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
                url: "http://localhost:8080/gocheeta-web-services/api/v1/customer/" + userId,
                contentType: 'application/json',
                data: JSON.stringify(formData),
                encode: true

            }).done(function (data) {
                location.reload();
            });

        });
    });

    var booking_data_url = 'http://localhost:8080/gocheeta-web-services/api/v1/booking/customer/' + userId;

    $.ajax({
        type: "GET",
        url: booking_data_url,
        dataType: "json",
        success: function (response) {
            $.each(response, function (key, val) {
                var driverName = val.driverName;
                var make = val.make;
                var model = val.model;
                var regNo = val.regNo;

                if(driverName == undefined){
                    driverName = "N/A";
                }

                if (make == undefined) {
                    make = "N/A";
                    model = "N/A";
                    regNo = "N/A";
                }

                var tableRow = `<tr>
                                    <th scope="row">` + val.bookingId + `</th>
                                    <td>` + val.createdDate +`</td>
                                    <td>` + val.pickup + `</td>
                                    <td>` + val.destination + `</td>
                                    <td>` + val.city + `</td>
                                    <td>` + driverName + `</td>
                                    <td>` + val.type + `</td>
                                    <td>` + regNo + `</td>
                                    <td>` + make + ` ` + model + `</td>
                                    <td>` + val.fare.toFixed(2) + `</td>
                                    <td>` + val.status + `</td>
                                </tr>`;

                var feedback = `
                                <!-- Modal -->
                                <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                  <div class="modal-dialog">
                                    <div class="modal-content">
                                      <div class="modal-header">
                                        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                      </div>
                                      <div class="modal-body">
                                        ...
                                      </div>
                                      <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                        <button type="button" class="btn btn-primary">Save changes</button>
                                      </div>
                                    </div>
                                  </div>
                                </div>`;

                $(".table-data").append(tableRow);
                $(".modal").append(feedback);


            });
        }
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
</script>

<div class="modal"></div>
<%@ include file = "footer.jsp" %>
