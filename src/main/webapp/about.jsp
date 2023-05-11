<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="Plugins/cdns.jsp"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>About Us - Outletpc</title>
        <style>
            section .card-header {
                color: whitesmoke;
            }

            @media screen and (min-width: 992px) {
                section .card-body{
                    height: 18rem;
                }
            }
            @media screen and (max-width: 768px) {
                section > img {
                    content: url("Images/About/banner_phone.jpg");
                }
            }
            @media screen and (max-width: 576px) {
                #hex {
                    display: none;
                }
            }
        </style>
    </head>
    <%@include file="Plugins/navbar.jsp"%>

    <section>
        <img src="Images/About/banner_desktop.jpg" width="100%" height="auto" alt="No Image"> 
        <div class="container mt-4">
            <div class="row justify-content-center">
                <div class="col-12">
                    <h3 class="text-center">About Us</h3>
                    <hr>
                    <div class="row justify-content-center pt-2">
                        <div class="col-lg-3">
                            <div class="card">
                                <div class="card-header bg-dark">
                                    OUR WINNING
                                </div>
                                <div class="card-body bg-light">
                                    <p>Our Winning Culture defines the attitudes and behaviours that will be required of us to make our 2020 Vision a reality.</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3">
                            <div class="card">
                                <div class="card-header bg-dark">
                                    OUR VISION
                                </div>
                                <div class="card-body bg-light">
                                    <p>Our vision serves as the framework for our Roadmap and guides every aspect of our business by describing what we need to accomplish in order to continue achieving sustainable, quality growth.</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3">
                            <div class="card">
                                <div class="card-header bg-dark">
                                    OUR WINNING
                                </div>
                                <div class="card-body bg-light">
                                    <p>Our Winning Culture defines the attitudes and behaviours that will be required of us to make our 2020 Vision a reality.</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3">
                            <div class="card">
                                <div class="card-header bg-dark">
                                    LIVE OUR VALUES
                                </div>
                                <div class="card-body bg-light">
                                    <p>Leadership: The courage to shape a better future</p>
                                    <p>Passion: Committed in heart and mind</p>
                                    <p>Collaboration: Leverage collective genius</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="container text-center">
            <img src="Images/About/hex.png" alt="No Image" id="hex" class="img-fluid my-5">
            <h4 class="pt-5">Our Culture</h4>
            <p class="pb-4 pt-2">Outletpc's culture is casual, fun loving, high energy, vibrant, and non-political. There are two things that are placed on top, passion and merit.</p>
            <div class="row">
                <div class="col-md-4 mb-2">
                    <img src="Images/About/1.png" alt="No Image" class="img-fluid">
                    <img src="Images/About/4.png" alt="No Image" class="img-fluid my-2">
                    <img src="Images/About/7.png" alt="No Image" class="img-fluid">
                </div>
                <div class="col-md-4 mb-2">
                    <img src="Images/About/2.png" alt="No Image" class="img-fluid">
                    <img src="Images/About/5.png" alt="No Image" class="img-fluid my-2">
                    <img src="Images/About/8.png" alt="No Image" class="img-fluid">
                </div>
                <div class="col-md-4">
                    <img src="Images/About/3.png" alt="No Image" class="img-fluid">
                    <img src="Images/About/6.png" alt="No Image" class="img-fluid my-2">
                    <img src="Images/About/9.png" alt="No Image" class="img-fluid">
                </div>
            </div>
        </div>
        <div class="container my-5">
            <div class="row justify-content-center">
                <div class="col-lg-8">
                    <h4 class="text-center pt-4">Our Progress</h4>
                    <canvas id="lineChart" class="my-4"></canvas>
                </div>
            </div>
            <div class="row justify-content-center">
                <p class="text-center text-info" id="logo">
                    <i class="fas fa-laptop"></i><span class="text-dark">Outlet</span>PC
                </p>
            </div>
        </div>
    </section>

    <%@include file="Plugins/footer.jsp"%>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.19.1/js/mdb.min.js"></script>

    <script>
        let ctxL = document.getElementById("lineChart").getContext('2d');
        let myLineChart = new Chart(ctxL, {
            type: 'line',
            data: {
                labels: ["2008", "2009", "2010", "2011", "2012", "2013", "2014", "2015", "2016", "2017", "2018", "2019", "2020"],
                datasets:
                        [{
                                label: "The Journey",
                                data: [10, 12, 16, 20, 18, 22, 22, 24, 28, 26, 26, 30],
                                backgroundColor: [
                                    'rgba(0, 137, 132, .2)'
                                ],
                                borderColor: [
                                    'rgba(0, 10, 130, .7)'
                                ],
                                borderWidth: 2
                            }]
            },
            options: {
                responsive: true
            }
        });
    </script>
</body>
</html>
