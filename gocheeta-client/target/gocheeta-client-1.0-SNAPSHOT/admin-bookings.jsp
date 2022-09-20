<%@ include file = "admin-header.jsp" %>

<div class="about border d-flex align-items-center justify-content-center"
     style="background-color: #104a8e; height: 120px;">
    <h2 class="text-center text-white ">Admin - Bookings</h2>
</div>


<div class="my-4 mx-3">

    <table class="table my-4 table-hover">
        <thead>
            <tr>
                <th scope="col">Boooking ID</th>
                <th scope="col">Branch</th>
                <th scope="col">Pickup</th>
                <th scope="col">Destination</th>
                <th scope="col">Fare (LKR)</th>
                <th scope="col">Customer Name</th>
                <th scope="col">Customer Mobile</th>
                <th scope="col">Driver Name</th>
                <th scope="col">Driver Mobile</th>
                <th scope="col">Vehicle Type</th>
                <th scope="col">Make</th>
                <th scope="col">Model</th>
                <th scope="col">Reg No</th>
                <th scope="col">Status</th>
            </tr>
        </thead>
        <tbody class="tableRow">

        </tbody>
    </table>
</div>

<script>
    var _url = 'http://localhost:8080/gocheeta-web-services/api/v1/admin/bookings';

    $.ajax({
        type: "GET",
        url: _url,
        dataType: "json",
        success: function (response) {
            console.log(response);
            $.each(response, function (key, val) {
                var driverName = val.driverName;                
                var driverMobile = val.driverMobile;
                var make = val.make;
                var model = val.model;
                var regNo = val.regNo;

         
                if (driverName == undefined) {
                    driverName = "N/A";
                    driverMobile = "N/A";
                }
                
                if (make == undefined) {
                    make = "N/A";
                    model = "N/A";
                    regNo = "N/A";
                }
                
                
                var tableRow = `
                            <tr>
                                <th scope="row">` + val.bookingId + `</th>
                                <td>` + val.city + `</td>
                                <td>` + val.pickup + `</td>
                                <td>` + val.destination + `</td>
                                <td>` + val.fare + `</td>
                                <td>` + val.customerName + `</td>
                                <td>` + val.customerMobile + `</td>
                                <td>` + driverName + `</td>
                                <td>` + driverMobile + `</td>
                                <td>` + val.type + `</td>
                                <td>` + make + `</td>
                                <td>` + model + `</td>
                                <td>` + regNo + `</td>
                                <td>` + val.status + `</td>
                            </tr>`;

                $(".tableRow").append(tableRow);
            });
        }
    });

</script>    

<%@ include file = "admin-footer.jsp" %>