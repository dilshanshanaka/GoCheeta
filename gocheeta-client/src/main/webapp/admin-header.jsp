<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="icon" type="image/x-icon" href="images\GoCheeta-logo.png">

        <title>GoCheeta</title>

        <!-- Bootstrap 5.2 -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">

        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">

        <!-- Google Fonts -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;500&display=swap" rel="stylesheet">


        <!-- JQuery -->
        <script src="js/jquery-3.6.0.min.js"></script>

        <script src="https://cdn.jsdelivr.net/npm/js-cookie@3.0.1/dist/js.cookie.min.js"></script>
    </head>

    <body>

        <!-- Navbar Starts -->
        <nav class="navbar navbar-expand-lg bg-light">
            <div class="container">
                <a class="navbar-brand" href="#">
                    <img src="images\GoCheeta-logo.png" alt="GoCheeta Logo" width="150">
                </a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                        data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false"
                        aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav mx-auto mb-2 mb-lg-0">
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="admin-dashboard.jsp">Dashboard</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="admin-users.jsp">Users</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="admin-bookings.jsp">Bookings</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="admin-vehicles.jsp">Vehicles</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="admin-add-new-driver.jsp">Add New Driver</a>
                        </li>
                    </ul>
                </div>
                <a class="btn btn-outline-danger mx-2" type="button" onclick="logout()">Logout</a>
            </div>
        </nav>
        <!-- Navbar Ends -->

        <script>

            var userId = Cookies.get('userId');
            var userRole = Cookies.get('role');

            if (userId == "undefined" || userRole == "undefined" || userRole != "admin") {
                window.location.replace("admin-login.jsp");
            }


            // Logout Function
            function logout() {
                Cookies.remove('userId');
                Cookies.remove('role');
                location.reload();
            }



        </script>