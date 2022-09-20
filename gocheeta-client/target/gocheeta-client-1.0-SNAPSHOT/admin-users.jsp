<%@ include file = "admin-header.jsp" %>

<div class="about border d-flex align-items-center justify-content-center"
     style="background-color: #104a8e; height: 120px;">
    <h2 class="text-center text-white ">Admin - Users</h2>
</div>


<div class="container my-4">
    <ul class="nav nav-tabs" id="myTab" role="tablist">
        <li class="nav-item" role="presentation">
            <button class="nav-link active" id="home-tab" data-bs-toggle="tab" data-bs-target="#home-tab-pane"
                    type="button" role="tab" aria-controls="home-tab-pane" aria-selected="true">Customers</button>
        </li>
        <li class="nav-item" role="presentation">
            <button class="nav-link" id="profile-tab" data-bs-toggle="tab" data-bs-target="#profile-tab-pane"
                    type="button" role="tab" aria-controls="profile-tab-pane" aria-selected="false">Drivers</button>
        </li>
    </ul>
    <div class="tab-content" id="myTabContent">
        <div class="tab-pane fade show active" id="home-tab-pane" role="tabpanel" aria-labelledby="home-tab"
             tabindex="0">

            <table class="table my-4 table-hover">
                <thead>
                    <tr>
                        <th scope="col">User ID</th>
                        <th scope="col">Customer ID</th>
                        <th scope="col">Email</th>
                        <th scope="col">Full Name</th>
                        <th scope="col">Mobile</th>
                        <th scope="col">Status</th>
                        <th scope="col">Manage User</th>
                    </tr>
                </thead>
                <tbody class="customerRow">

                </tbody>
            </table>

        </div>
        <div class="tab-pane fade" id="profile-tab-pane" role="tabpanel" aria-labelledby="profile-tab" tabindex="0">
            <table class="table my-4 table-hover">
                <thead>
                    <tr>
                        <th scope="col">User ID</th>
                        <th scope="col">Driver ID</th>
                        <th scope="col">Email</th>
                        <th scope="col">Full Name</th>
                        <th scope="col">Mobile</th>
                        <th scope="col">Branch</th>
                        <th scope="col">Availability</th>
                        <th scope="col">Status</th>
                        <th scope="col">Manage User</th>
                    </tr>
                </thead>
                <tbody class="driverRow">
                </tbody>
            </table>
        </div>
    </div>
</div>

<script>
    var _url_user = 'http://localhost:8080/gocheeta-web-services/api/v1/admin/all-customers';
    var _url_driver = 'http://localhost:8080/gocheeta-web-services/api/v1/admin/all-drivers';


    $.ajax({
        type: "GET",
        url: _url_user,
        dataType: "json",
        success: function (response) {
            var manageButton = "";

            $.each(response, function (key, val) {
                if (val.status == "active") {
                    manageButton = `<button type="button" class="btn btn-danger btn-sm">Block</button>`;
                } else {
                    manageButton = `<button type="button" class="btn btn-success btn-sm">Activate</button>`;
                }

                var customerRow = `
                     <tr>
                        <th scope="row">` + val.id + `</th>
                        <td>` + val.customerId + `</td>
                        <td>` + val.email + `</td>
                        <td>` + val.firstName + ` ` + val.lastName + `</td>
                        <td>` + val.mobile + `</td>
                        <td>` + val.status + `</td>
                        <td>` + manageButton + `</td>
                    </tr>`;

                $(".customerRow").append(customerRow);
            });
        }
    });

    $.ajax({
        type: "GET",
        url: _url_driver,
        dataType: "json",
        success: function (response) {
            var manageButton = "";
            var avalible = "";

            $.each(response, function (key, val) {
                
                if (val.availability) {
                    avalible = "available";
                } else {
                    avalible = "unavailable";
                }

                if (val.status == "active") {
                    manageButton = `<button type="button" class="btn btn-danger btn-sm">Block</button>`;
                } else {
                    manageButton = `<button type="button" class="btn btn-success btn-sm">Activate</button>`;
                }

                var driverRow = `
                     <tr>
                        <th scope="row">` + val.id + `</th>
                        <td>` + val.driverId + `</td>
                        <td>` + val.email + `</td>
                        <td>` + val.firstName + ` ` + val.lastName + `</td>
                        <td>` + val.mobile + `</td>
                        <td>` + val.branch + `</td>
                        <td>` + avalible + `</td>
                        <td>` + val.status + `</td>
                        <td>` + manageButton + `</td>
                    </tr>`;

                $(".driverRow").append(driverRow);
            });
        }
    });

</script>    

<%@ include file = "admin-footer.jsp" %>
