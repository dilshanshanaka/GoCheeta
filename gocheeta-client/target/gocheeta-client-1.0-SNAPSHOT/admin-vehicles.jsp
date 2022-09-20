<%@ include file = "admin-header.jsp" %>

<div class="about border d-flex align-items-center justify-content-center"
     style="background-color: #104a8e; height: 120px;">
    <h2 class="text-center text-white ">Admin - Manage Vehicles</h2>
</div>

<div class="row my-4 mx-3">
    <div class="col-md-8">
        <h4>Registered Vehicles</h4>
        <hr>
        <table class="table my-4 table-hover">
            <thead>
                <tr>
                    <th scope="col">Vehicle ID</th>
                    <th scope="col">Make</th>
                    <th scope="col">Model</th>
                    <th scope="col">Reg No</th>
                    <th scope="col">Branch</th>
                    <th scope="col">Vehicle Category</th>
                    <th scope="col">Availability</th>
                    <th scope="col">Remove</th>
                </tr>
            </thead>
            <tbody class="vehicleRow">
            </tbody>
        </table>
    </div>
    <div class="col-md-4 shadow-sm p-3 mb-5 bg-body rounded">
        <h5 class="mt-2">Add New Vehicle</h5>
        <hr>
        <form id="addVehicle">
            <div class="form mt-3 mx-5 mb-3">
                <div class="mb-3 row">
                    <label for="staticEmail" class="col-sm-3 col-form-label">Make</label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control" id="make">
                    </div>
                </div>
                <div class="mb-3 row">
                    <label for="inputPassword" class="col-sm-3 col-form-label">Model</label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control" id="model">
                    </div>
                </div>
                <div class="mb-3 row">
                    <label for="inputPassword" class="col-sm-3 col-form-label">Reg No</label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control" id="regNo">
                    </div>
                </div>
                <div class="mb-3 row">
                    <label for="inputPassword" class="col-sm-4 col-form-label">Branch</label>
                    <div class="col-sm-8">
                        <select class="form-select" id="branchId" aria-label="Default select example">
                            <option value="1" selected>Colombo</option>
                            <option value="2">Nugegoda</option>
                            <option value="3">Galle</option>
                            <option value="4">Gampaha</option>
                            <option value="5">Kandy</option>
                            <option value="6">Kurunagala</option>                            
                        </select>
                    </div>
                </div>
                <div class="mb-3 row">
                    <label for="inputPassword" class="col-sm-4 col-form-label">Vehicle Type</label>
                    <div class="col-sm-8">
                        <select class="form-select vehicleCatOption" id="vehicleCategory" aria-label="Default select example">    
                        </select>
                    </div>
                </div>
                <div class="mt-4 row">
                    <div class="d-grid gap-2 col-6 mx-auto">
                        <button class="btn btn-primary" type="submit">Submit</button>
                    </div>
                </div>
            </div>
        </form>
    </div>

</div>

<script>
    var _url = 'http://localhost:8080/gocheeta-web-services/api/v1/admin/all-vehicles';
    var addNewVehicleUrl = "http://localhost:8080/gocheeta-web-services/api/v1/admin/add-new-driver";
    var vehicleCategoriesUrl = "http://localhost:8080/gocheeta-web-services/api/v1/booking/vehicleCategories";

    $.ajax({
        type: "GET",
        url: _url,
        dataType: "json",
        success: function (response) {
            var avalible = "";
            var Remove = `<button type="button" class="btn btn-danger btn-sm">Delete</button>`;

            $.each(response, function (key, val) {
                if (val.availability) {
                    avalible = "available";
                } else {
                    avalible = "unavailable";
                }


                var vehicleRow = `
                     <tr>
                        <th scope="row">` + val.vehicleId + `</th>
                        <td>` + val.make + `</td>
                        <td>` + val.model + `</td>
                        <td>` + val.regNo + `</td>
                        <td>` + val.branchId + `</td>
                        <td>` + val.vehicleCategoryId + `</td>
                        <td>` + avalible + `</td>
                        <td>` + Remove + `</td>
                    </tr>`;

                $(".vehicleRow").append(vehicleRow);
            });
        }
    });
    
    $.ajax({
        type: "GET",
        url: vehicleCategoriesUrl,
        dataType: "json",
        success: function (response) {
            console.log(response);
            $.each(response, function (key, val) {
                var vehicleCatOption = `<option value="`+ val.vehicleCategoryId +`">`+ val.type +`</option>`;

                $(".vehicleCatOption").append(vehicleCatOption);
            });
        }
    });
    

    $(document).ready(function () {
        $("#addVehicle").submit(function (event) {
            // Form Data
            var formData = {
                make: $("#make").val(),
                model: $("#model").val(),
                regNo: $("#regNo").val(),
                vehicleCategoryId: $("#vehicleCategory").val(),
                branchId: $("#branchId").val(),
                availability: true
            };

            $.ajax({
                type: "POST",
                url: addNewVehicleUrl,
                contentType: 'application/json',
                data: JSON.stringify(formData),
                dataType: "json",
                encode: true,
                success: function (data) {
                    location.reload();
                }
            });

            event.preventDefault();
        });
    });

</script>    

<%@ include file = "admin-footer.jsp" %>