<%@ include file = "header.jsp" %>

<div class="container my-5">
    <div class="row justify-content-md-center">
        <div class="col-8 shadow-lg p-3 mb-5 bg-body rounded">
            <div class="row">
                <div class="col-6">
                    <img src="images\driver-login.jpg" class="rounded img-fluid w-100" alt="Login Image">
                </div>
                <div class="col-6 mt-4">
                    <h4 class="text-center display-6">Login</h4>

                    <div class="alert-msg" id="alertMsg"></div>
                    <div class="form mt-3 mx-4">
                        <form id="login-form">
                            <div class="mb-3">
                                <label for="exampleFormControlInput1" class="form-label">Email address</label>
                                <input type="email" class="form-control" id="email">
                            </div>
                            <div class="mb-4">
                                <label for="exampleFormControlInput1" class="form-label">Password</label>
                                <input type="password" class="form-control" id="password">
                            </div>
                            <div class="d-grid gap-2">
                                <button class="btn btn-primary" type="submit">Login</button>
                            </div>
                        </form>
                        <hr>
                    </div>
                    <div class="customer-login mt-3 text-center">
                        <p class="lead">Login as a Customer | <a href="customer-login.jsp">Customer Login</a></p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    var login_url = "http://localhost:8080/gocheeta-web-services/api/v1/user/login";

    $(document).ready(function () {

        $("#login-form").submit(function (event) {
            document.getElementById("alertMsg").innerHTML = "";
            // Form Data
            var formData = {
                email: $("#email").val(),
                password: $("#password").val(),
                role: "driver"
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

                    window.location.replace("driver-my-account.jsp");
                },
                error: function (data) {
                    var errorMsg = `<div class="alert alert-danger" role="alert">
                                    ` + data.responseJSON.message + `</div>`;

                    $(".alert-msg").append(errorMsg);
                }
            });

            event.preventDefault();
        });
    });

</script>
<%@ include file = "footer.jsp" %>
