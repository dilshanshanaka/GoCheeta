<%@ include file = "header.jsp" %>

<!-- Hero Image Starts -->
<div id="carouselExampleFade" class="carousel slide carousel-fade" data-bs-ride="carousel">
    <div class="carousel-inner">
        <div class="carousel-item active">
            <img src="images\home-hero.png" class="d-block w-100" alt="Taxi Hero Image">
        </div>
        <div class="carousel-item">
            <img src="images\home-hero.png" class="d-block w-100" alt="...">
        </div>
        <div class="carousel-item">
            <img src="images\home-hero.png" class="d-block w-100" alt="...">
        </div>
    </div>
    <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleFade" data-bs-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Previous</span>
    </button>
    <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleFade" data-bs-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Next</span>
    </button>
</div>
<!-- <img src="images\home-hero.png" class="img-fluid w-100" alt="Taxi Hero Image"> -->
<!-- Hero Image Ends -->

<div class="container my-5">
    <!-- Section One Starts -->
    <div class="section-one mb-4">
        <h3 class="mb-5 display-5" style="color: #0a375e;">Why Choose GoCheeta?</h3>


        <div class="row">

            <div class="col-md-4 col-sm-6">
                <div class="card" style="width: 18rem;">
                    <img src="images\content-box-img.jpg" class="card-img-top" alt="...">
                    <div class="card-body">
                        <h5 class="card-title">24x7 Availability</h5>
                        <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod
                            tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam. </p>
                    </div>
                </div>
            </div>

            <div class="col-md-4 col-sm-6">
                <div class="card" style="width: 18rem;">
                    <img src="images\content-box-img.jpg" class="card-img-top" alt="...">
                    <div class="card-body">
                        <h5 class="card-title">24x7 Availability</h5>
                        <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod
                            tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam. </p>
                    </div>
                </div>
            </div>

            <div class="col-md-4 col-sm-6">
                <div class="card" style="width: 18rem;">
                    <img src="images\content-box-img.jpg" class="card-img-top" alt="...">
                    <div class="card-body">
                        <h5 class="card-title">24x7 Availability</h5>
                        <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod
                            tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam. </p>
                    </div>
                </div>
            </div>
        </div>

    </div>
    <!-- Section One Ends -->
</div>

<div class="section-two" style="background-color: #0a375e;">
    <!-- <div class="row"> -->
    <div class="container text-white py-5">
        <div class="row">
            <div class="col-md-8">
                <h3 class="py-3 display-6" style="font-family: 'Roboto', sans-serif;">Book a cab</h3>
                <p class="pb-3">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod
                    tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.Lorem ipsum dolor
                    sit
                    amet, consectetur adipiscing elit, sed do eiusmod
                    tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.Lorem ipsum dolor
                    sit
                    amet, consectetur adipiscing elit, sed do eiusmod
                    tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.</p>
                <button type="button" class="btn btn-light">BOOK NOW</button>
            </div>

            <div class="col-md-4 text-center">
                <img src="images\taxi-side.jpg" class="img-fluid w-75" alt="Taxi Side Image">
            </div>
        </div>

    </div>
</div>

<div class="container my-5">
    <div class="section-three shadow p-3 mb-5 rounded bg-light">
        <div class="row p-3">
            <div class="col-md-6">
                <img src="images\section-3-image.jpg" class="rounded img-fluid w-100" alt="">
            </div>
            <div class="col-md-6">
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut
                    labore et dolore magna aliqua. Ut enim ad minim veniam.Lorem ipsum dolor sit amet, consectetur
                    adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad
                    minim veniam.Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor
                    incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.</p>
                <ul>
                    <li>Colombo</li>
                    <li>Nugegoda</li>
                    <li>Galle</li>
                    <li>Jaffna</li>
                </ul>
            </div>
        </div>
    </div>
</div>

<%@ include file = "footer.jsp" %>
