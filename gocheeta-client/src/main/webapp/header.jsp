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
                            <a class="nav-link active" aria-current="page" href="index.jsp">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="book-a-cab.jsp">Book a Cab</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="about.jsp">About</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="contact.jsp">Contact</a>
                        </li>
                    </ul>
                </div>

                <%
                    boolean isLoggedin = true;
                    if (isLoggedin) { %>
                <a class="btn btn-outline-primary" type="button" href="customer-my-account.jsp">My Account</a>
                <a class="btn btn-outline-danger mx-2" type="button" onclick="logout()">Logout</a>
                <% } else { %>
                <a class="btn btn-outline-primary" type="button" href="customer-login.jsp">Login</a>
                <% }%>

            </div>
        </nav>
        <!-- Navbar Ends -->

        <script>
            // Logout Function
            function logout() {
                Cookies.remove('userId');
                Cookies.remove('role');
                location.reload();
            }

            var userId = Cookies.get('userId');
            var userRole = Cookies.get('role');

//
//    if (userId == "undefined" || userRole == null || user != "customer") {
//        window.location.replace("customer-login.jsp");
//    }


        </script>
