<%@ include file = "header.jsp" %>

<div class="container my-5">
    <div class="row justify-content-md-center">
        <div class="col-6 shadow-lg p-3 mb-5 bg-body rounded">

            <h4 class="text-center display-6 mt-4">Admin Login</h4>
            <div class="form mt-3 mx-4 mb-4">
                <div class="mb-3">
                    <label for="exampleFormControlInput1" class="form-label">Email address</label>
                    <input type="email" class="form-control" id="exampleFormControlInput1">
                </div>
                <div class="mb-4">
                    <label for="exampleFormControlInput1" class="form-label">Password</label>
                    <input type="email" class="form-control" id="exampleFormControlInput1">
                </div>
                <div class="d-grid gap-2">
                    <button class="btn btn-primary" type="button">Login</button>
                </div>
            </div>
        </div>
    </div>
</div>

<%@ include file = "footer.jsp" %>
