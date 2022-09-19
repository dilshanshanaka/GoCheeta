<%@ include file = "header.jsp" %>

<div class="container my-5">
    <div class="row justify-content-md-center">
        <div class="col-6 shadow-lg p-3 mb-5 bg-body rounded">

            <h4 class="text-center display-6">Register</h4>
            <div class="form mt-4 mx-4">
                <div class="alert-msg" id="alertMsg"></div>
                <form class="row g-3 mb-3"id="register">
                    <div class="col-md-6">
                        <label for="inputEmail4" class="form-label">First Name</label>
                        <input type="text" class="form-control" id="firstName" required>
                    </div>
                    <div class="col-md-6">
                        <label for="inputPassword4" class="form-label">Last Name</label>
                        <input type="text" class="form-control" id="lastName"required>
                    </div>
                    <div class="col-12">
                        <label for="inputAddress" class="form-label">Email</label>
                        <input type="email" class="form-control" id="email" required>
                    </div>
                    <div class="col-12">
                        <label for="inputAddress" class="form-label">Mobile</label>
                        <input type="text" class="form-control" id="mobile" required>
                    </div>
                    <div class="col-md-6">
                        <label for="inputEmail4" class="form-label">Password</label>
                        <input type="password" class="form-control" id="password" required>
                    </div>
                    <div class="col-md-6">
                        <label for="cPassword" class="form-label">Confirm Password</label>
                        <input type="password" class="form-control" id="cPassword" required>
                    </div>
                    <div class="d-grid gap-2">
                        <button class="btn btn-primary" type="submit">Register</button>
                    </div>
                </form>
                <hr>
            </div>
            <div class="driver-login mt-3 text-center">
                <p class="lead">Already have an account -> <a href="customer-login.jsp">Customer Login</a></p>
            </div>
        </div>
    </div>
</div>

<script>
    var login_url = "http://localhost:8080/gocheeta-web-services/api/v1/user/register/customer";

    $(document).ready(function () {

        $("#register").submit(function (event) {
            document.getElementById("alertMsg").innerHTML = "";
            
            if ($("#password").val() === $("#cPassword").val()) {
                // Form Data
                var formData = {
                    email: $("#email").val(),
                    password: $("#password").val(),
                    role: "customer",
                    firstName: $("#firstName").val(),
                    lastName: $("#lastName").val(),
                    mobile: $("#mobile").val()
                };

                $.ajax({
                    type: "POST",
                    url: login_url,
                    contentType: 'application/json',
                    data: JSON.stringify(formData),
                    dataType: "json",
                    encode: true,
                    success: function (data) {
                        Cookies.set('userId', data.userId);
                        Cookies.set('role', data.role);

                        window.location.replace("customer-my-account.jsp");
                    }
                });
            } else {
                var errorMsg = `<div class="alert alert-danger" role="alert">
                                Password Mismatch.</div>`;
                $(".alert-msg").append(errorMsg);
            }

            event.preventDefault();
        });
    });
</script>
<%@ include file = "footer.jsp" %>
