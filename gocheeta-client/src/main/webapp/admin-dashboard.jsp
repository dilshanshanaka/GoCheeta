<%@ include file = "admin-header.jsp" %>

<div class="about border d-flex align-items-center justify-content-center"
     style="background-color: #104a8e; height: 120px;">
    <h2 class="text-center text-white ">Admin - Dashboard</h2>
</div>

<div class="row my-4 mx-3">
    <div class="col-md-8">
        <h4>Earnings</h4>
        <hr>
        <div class="row branch-earning">

        </div>

        <div class="row mt-5">
            <h4>Vehicle Categories</h4>
            <hr>
            <div class="row vehicleCat">
            </div>


        </div>
    </div>
    <div class="col-md-4 shadow-sm p-3 mb-5 bg-body rounded"> 
        <h5 class="mt-2">Latest Bookings</h5>
        <hr>
        <table class="table my-4 table-hover">
            <thead>
                <tr>
                    <th scope="col">Booking ID</th>
                    <th scope="col">Branch</th>
                    <th scope="col">Fare</th>
                    <th scope="col">Status</th>
                </tr>
            </thead>
            <tbody class="tableRow">

            </tbody>
        </table>
    </div>
</div>

<script>

    var vehicleCategoriesUrl = "http://localhost:8080/gocheeta-web-services/api/v1/booking/vehicleCategories";
    var branchEarningsUrl = "http://localhost:8080/gocheeta-web-services/api/v1/admin/branch-earnings";

    $.ajax({
        type: "GET",
        url: vehicleCategoriesUrl,
        dataType: "json",
        success: function (response) {
            console.log(response);
            $.each(response, function (key, val) {
                var vehicleCat = `<div class="col-6">
                <div class="card mb-3" style="max-width: 540px;">
                    <div class="row g-0">
                        <div class="col-md-4">
                            <img src="` + val.imagePath + `" class="img-fluid rounded-start" alt="">
                        </div>
                        <div class="col-md-8">
                            <div class="card-body">
                                <h5 class="card-title">` + val.type + `</h5>
                                <p class="card-text">Passenger Seats: ` + val.passengerSeats + ` <br>First KM Fare: LKR ` + val.firstKm + ` <br> Extra KM Fare: LKR ` + val.perKm + `</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>`;

                $(".vehicleCat").append(vehicleCat);
            });
        }
    });

    $.ajax({
        type: "GET",
        url: branchEarningsUrl,
        dataType: "json",
        success: function (response) {
            console.log(response);
            $.each(response, function (key, val) {
                var branch = `<div class="col-sm-3">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">` + val.city + `</h5>
                        <p class="card-text">Total Earnings: <br> <strong>LKR ` + val.totalEarnings.toFixed(2) + `</strong></p>
                    </div>
                </div>
            </div>`;

                $(".branch-earning").append(branch);
            });
        }
    });

    var _url = 'http://localhost:8080/gocheeta-web-services/api/v1/admin/bookings';

    $.ajax({
        type: "GET",
        url: _url,
        dataType: "json",
        success: function (response) {
            console.log(response);

            $.each(response, function (key, val) {
                var tableRow = `
                <tr>
                    <th scope="row">` + val.bookingId + `</th>
                    <td>` + val.city + `</td>
                    <td>LKR ` + val.fare + `</td>
                    <td>` + val.status + `</td>
                </tr>`;


                $(".tableRow").append(tableRow);
            });


        }
    });
</script>
<%@ include file = "admin-footer.jsp" %>
