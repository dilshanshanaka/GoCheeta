<%@ include file = "admin-header.jsp" %>

<!-- Contact Header Start -->
<div class="about border d-flex align-items-center justify-content-center"
     style="background-color: #104a8e; height: 120px;">
    <h2 class="text-center text-white ">Admin - Add New Driver</h2>
</div>
<!-- Contact Header Ends -->


<div class="container my-5">
    <div class="row justify-content-md-center">
        <div class="col-6 shadow-lg p-3 mb-5 bg-body rounded">

            <h4 class="text-center mt-3">Add New Driver</h4>
            <div class="form mt-4 mx-4">
                <form class="row g-3 mb-3" id="register">
                    <div class="col-md-6">
                        <label for="inputEmail4" class="form-label">First Name</label>
                        <input type="text" class="form-control" id="firstName">
                    </div>
                    <div class="col-md-6">
                        <label for="inputPassword4" class="form-label">Last Name</label>
                        <input type="text" class="form-control" id="lastName">
                    </div>
                    <div class="col-md-6">
                        <label for="inputAddress" class="form-label">Email</label>
                        <input type="email" class="form-control" id="email">
                    </div>
                    <div class="col-md-6">
                        <label for="inputAddress" class="form-label">Mobile</label>
                        <input type="text" class="form-control" id="mobile">
                    </div>
                    <div class="col-md-6">
                        <label for="inputEmail4" class="form-label">Branch</label>
                        <select class="form-select" id="branchId" aria-label="Default select example">
                            <option value="1" selected>Colombo</option>
                            <option value="2">Nugegoda</option>
                            <option value="3">Galle</option>
                            <option value="4">Gampaha</option>
                            <option value="5">Kandy</option>
                            <option value="6">Kurunagala</option>                            
                        </select>

                    </div>
                    <div class="col-md-6">
                        <label for="password" class="form-label">Password</label>
                        <input type="password" class="form-control" id="password">
                    </div>
                    <div class="d-grid gap-2 mt-4">
                        <button class="btn btn-primary" type="submit">Login</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>



<script>
    var login_url = "http://localhost:8080/gocheeta-web-services/api/v1/admin/add-new-driver";

    $(document).ready(function () {

        $("#register").submit(function (event) {
            // Form Data
            var formData = {
                email: $("#email").val(),
                password: $("#password").val(),
                firstName: $("#firstName").val(),
                lastName: $("#lastName").val(),
                branchId: $("#branchId").val(),
                mobile: $("#mobile").val(),
                availability: true
            };

            $.ajax({
                type: "POST",
                url: login_url,
                contentType: 'application/json',
                data: JSON.stringify(formData),
                dataType: "json",
                encode: true,
                success: function (data) {
                    window.location.replace("admin-users.jsp");
                }
            });

            event.preventDefault();
        });
    });
</script>

<%@ include file = "admin-footer.jsp" %>