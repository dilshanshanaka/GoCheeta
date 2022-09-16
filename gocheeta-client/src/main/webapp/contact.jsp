<%@ include file = "header.jsp" %>

<!-- Contact Header Start -->
<div class="about border d-flex align-items-center justify-content-center"
     style="background-color: #104a8e; height: 180px;">
    <h2 class="text-center text-white ">Contact Us</h2>
</div>
<!-- Contact Header Ends -->

<div class="container my-5">

    <div class="contact-us">
        <h4 class="text-center">Let's Start a Conversation</h4>
        <div class="row mt-4 justify-content-md-center">
            <div class="col-md-4 shadow p-3 mb-5 bg-body rounded text-center">
                <h5 class="mt-3">EMAIL</h5>
                <p class="lead">contact@gocheeta.lk</p>
                <h5 class="mt-3">CALL US</h5>
                <p class="lead">+94 11 123 4567<br>
                    +94 77 123 4567</p>
                <h5 class="mt-3">LOCATION</h5>
                <p class="lead mb-4">22/A, Cross Street,<br>
                    Colombo 04, Sri Lanka</p>
            </div>
            <div class="col-md-4 px-5">
                <div class="form">
                    <div class="mb-3">
                        <label for="formGroupExampleInput" class="form-label">Name</label>
                        <input type="text" class="form-control" id="formGroupExampleInput">
                    </div>
                    <div class="mb-3">
                        <label for="formGroupExampleInput2" class="form-label">Email</label>
                        <input type="text" class="form-control" id="formGroupExampleInput2">
                    </div>
                    <div class="mb-3">
                        <label for="exampleFormControlTextarea1" class="form-label">Message</label>
                        <textarea class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>
                    </div>
                    <div class="d-grid gap-2">
                        <button type="button" class="btn btn-outline-primary">Submit</button>
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>

<%@ include file = "footer.jsp" %>