<style>
    footer a,
    footer a:hover {
        color: whitesmoke;
    }
    footer a,
    footer li,
    footer .card-header {
        font-size: 14px;
    }
    footer .footerTitle,
    footer .card-header {
        color: #b2babb;
    }
    #desktopFooter a:hover {
        text-decoration: underline;
    }
    footer .fa-caret-up,
    footer .fa-caret-down {
        float: right;
    }

    @media screen and (min-width: 768px) {
        #phoneFooter {
            display: none;
        }
    }
    @media screen and (max-width: 767px) {
        #desktopFooter {
            display: none;
        }
    }
</style>

<footer class="container-fluid bg-dark text-light py-4">
    <div id="desktopFooter">
        <div class="d-flex flex-row bd-highlight justify-content-around">
            <div class="bd-highlight">        
                <ul>
                    <li class="nav-link footerTitle">About</li>
                    <li class="nav-link pb-0"><a href="support.jsp">Support</a></li>
                    <li class="nav-link pb-0"><a href="about.jsp">About Us</a></li>
                </ul>
                <ul class="pt-3">
                    <li class="nav-link footerTitle">Policy</li>
                    <li class="nav-link pb-0"><a href="policy.jsp">Return Policy</a></li>
                    <li class="nav-link pb-0"><a href="terms.jsp">Terms of Use</a></li>
                    <li class="nav-link pb-0"><a href="privacy.jsp">Privacy</a></li>
                </ul>
            </div>
            <div class="bd-highlight">       
                <ul>
                    <li class="nav-link footerTitle">Follow</li>
                    <li class="nav-link pb-0">
                        <a href="https://www.facebook.com/">
                            <i class="fab fa-facebook-square"></i> Facebook
                        </a>
                    </li>
                    <li class="nav-link pb-0">
                        <a href="https://www.instagram.com/accounts/login/?hl=en">
                            <i class="fab fa-instagram-square"></i> Instagram
                        </a>
                    </li>
                    <li class="nav-link pb-0">
                        <a href="https://www.linkedin.com/login">
                            <i class="fab fa-linkedin-in"></i> LinkedIn
                        </a>
                    </li>
                    <li class="nav-link pb-0">
                        <a href="https://twitter.com/LOGIN">
                            <i class="fab fa-twitter"></i> Twitter
                        </a>
                    </li>
                </ul>
            </div>
            <div class="bd-highlight">
                <ul>
                    <li class="nav-link footerTitle">Support</li>
                    <li class="nav-link pb-0"><i class="fas fa-map-marker-alt"></i> Bengaluru, Karnataka, India</li>
                    <li class="nav-link pb-0"><i class="fas fa-phone-alt"></i> 1800 208 9898</li>
                    <li class="nav-link pb-0"><i class="fas fa-envelope"></i> services.outletpc@gmail.com</li>
                </ul>
            </div>
            <div class="bd-highlight">        
                <ul>
                    <li class="nav-link footerTitle">Registered Office Address</li>
                    <li class="nav-link">
                        OutletPC Internet Private Limited,<br>
                        Buildings Alyssa, Begonia &<br>
                        Clove Embassy Tech Village,<br>
                        Outer Ring Road,<br>
                        Devarabeesanahalli Village,<br>
                        Bengaluru, 560103,<br>
                        Karnataka, India<br>
                    </li>
                </ul>
            </div>
        </div>
    </div>

    <div class="accordion" id="phoneFooter">
        <div class="card bg-dark">
            <div class="card-header" id="headingOne" onclick="changeIcon('#arrowIcon1', '#arrowIcon2', '#arrowIcon3')" role="button" data-toggle="collapse" data-target="#collapseOne" aria-expanded="false" aria-controls="collapseOne">
                About<i class="fas fa-caret-down" id="arrowIcon1"></i>
            </div>
            <div id="collapseOne" class="collapse" aria-labelledby="headingOne" data-parent="#phoneFooter">
                <div class="card-body">
                    <ul>
                        <li class="nav-link"><a href="support.jsp">Support</a></li>
                        <li class="nav-link"><a href="about.jsp">About Us</a></li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="card bg-dark">
            <div class="card-header" id="headingTwo" onclick="changeIcon('#arrowIcon2', '#arrowIcon1', '#arrowIcon3')" role="button" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                Follow<i class="fas fa-caret-down" id="arrowIcon2"></i>
            </div>
            <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#phoneFooter">
                <div class="card-body">
                    <ul>
                        <li class="nav-link"><a href="https://www.facebook.com/">Facebook</a></li>
                        <li class="nav-link"><a href="https://www.instagram.com/accounts/login/?hl=en">Instagram</a></li>
                        <li class="nav-link"><a href="https://www.linkedin.com/login">LinkedIn</a></li>
                        <li class="nav-link"><a href="https://twitter.com/LOGIN">Twitter</a></li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="card bg-dark">
            <div class="card-header" id="headingThree" onclick="changeIcon('#arrowIcon3', '#arrowIcon1', '#arrowIcon2')" role="button" data-toggle="collapse" data-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                Policy<i class="fas fa-caret-down" id="arrowIcon3"></i>
            </div>
            <div id="collapseThree" class="collapse" aria-labelledby="headingThree" data-parent="#phoneFooter">
                <div class="card-body">
                    <ul>
                        <li class="nav-link"><a href="policy.jsp">Return Policy</a></li>
                        <li class="nav-link"><a href="terms.jsp">Terms of Use</a></li>
                        <li class="nav-link"><a href="privacy.jsp">Privacy</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <hr class="bg-secondary">
    <p class="text-center"><small>© 2007-2020 Outletpc.com</small></p>
</footer>

<script>
    const changeIcon = (element1, element2, element3) => {
        if ($(element1).hasClass("fa-caret-down")) {
            $(element1).removeClass("fa-caret-down").addClass("fa-caret-up");
            $(element2 + "," + element3).addClass("fa-caret-down").removeClass("fa-caret-up");
        } else {
            $(element1).removeClass("fa-caret-up").addClass("fa-caret-down");
        }
    };
</script>
