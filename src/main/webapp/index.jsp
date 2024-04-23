<%@ include file="navbar.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+Knujsl5+zEK5+ntkDyQ4jvew9Ogqz4O7Cvq+8KV6ZI2dM5" crossorigin="anonymous">
    <style>
        /* Custom Styles */
        .carousel-inner .carousel-item img {
            height: 400px; /* Set carousel height */
            object-fit: cover;
        }
        .info-card {
            margin-bottom: 20px;
            height: 100%; /* Make all cards the same height */
        }
    </style>
</head>
<body>
    <div class="container-fluid px-3">
        <div class="row">
            <div class="col-12">
                <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
                    <div class="carousel-inner">
                        <div class="carousel-item active">
                            <img src="libs.png" class="d-block w-100" alt="Image 1">
                        </div>
                        <div class="carousel-item">
                            <img src="library2.jpg" class="d-block w-100" alt="Image 2">
                        </div>
                        <div class="carousel-item">
                            <img src="libs.png" class="d-block w-100" alt="Image 3">
                        </div>
                    </div>
                    <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Previous</span>
                    </button>
                    <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Next</span>
                    </button>
                </div>
            </div>
        </div>
        <div class="row mt-4">
            <div class="col-lg-4">
                <div class="card info-card">
                    <div class="card-body">
                        <h5 class="card-title">Library Timings</h5>
                        <p class="card-text">Monday - Friday: 9am - 5pm<br>Saturday: 10am - 4pm<br>Sunday: Closed</p>
                    </div>
                </div>
            </div>
            <div class="col-lg-4">
                <div class="card info-card">
                    <div class="card-body">
                        <h5 class="card-title">Location</h5>
                        <p class="card-text">123 Main Street, Lee's Summit, Missouri</p>
                    </div>
                </div>
            </div>
            <div class="col-lg-4">
                <div class="card info-card">
                    <div class="card-body">
                        <h5 class="card-title">Maintained by UCM</h5>
                        <p class="card-text">University Central Missouri</p>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-DEHJXTNJEPiqX+3QhkpR0lQXeIUl4rWtmuEK9VRgRjccWlFxk9+Jo5eXwKdTR/JB" crossorigin="anonymous"></script>
</body>
</html>
