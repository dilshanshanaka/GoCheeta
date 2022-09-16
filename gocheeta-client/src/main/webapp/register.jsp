<%@ include file = "header.jsp" %>

<div class="container my-5">
    <div class="row justify-content-md-center">
        <div class="col-6 shadow-lg p-3 mb-5 bg-body rounded">

            <h4 class="text-center display-6">Register</h4>
            <div class="form mt-4 mx-4">
                <form class="row g-3 mb-3">
                    <div class="col-md-6">
                        <label for="inputEmail4" class="form-label">First Name</label>
                        <input type="email" class="form-control" id="inputEmail4">
                    </div>
                    <div class="col-md-6">
                        <label for="inputPassword4" class="form-label">Last Name</label>
                        <input type="password" class="form-control" id="inputPassword4">
                    </div>
                    <div class="col-12">
                        <label for="inputAddress" class="form-label">Email</label>
                        <input type="text" class="form-control" id="inputAddress">
                    </div>
                    <div class="col-12">
                        <label for="inputAddress" class="form-label">Mobile</label>
                        <input type="text" class="form-control" id="inputAddress">
                    </div>
                    <div class="col-md-6">
                        <label for="inputEmail4" class="form-label">Password</label>
                        <input type="email" class="form-control" id="inputEmail4">
                    </div>
                    <div class="col-md-6">
                        <label for="inputPassword4" class="form-label">Confirm Password</label>
                        <input type="password" class="form-control" id="inputPassword4">
                    </div>
                    <div class="d-grid gap-2">
                        <button class="btn btn-primary" type="button">Register</button>
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

<%@ include file = "footer.jsp" %>
