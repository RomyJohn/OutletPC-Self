<meta name="viewport" content="width=device-width, initial-scale=1.0">

<style>
    * {
        padding: 0px;
        margin: 0px;
        box-sizing: border-box;
        font-family: AmazonEmber;
    }
    html{
        scroll-behaviour: smooth;
    }
    html a:hover {
        text-decoration: none;
    }
    html .card{
        border: 0px;
    }
    #logo {
        font-size: 2rem;
        font-weight: bold;
    }
    html .error{
        color: #DC3545;
    }
    html .alert{
        display: none;
    }
    html .spinner-border{
        width: 3rem; 
        height: 3rem;
        display: none;
    }
    html section{
        min-height: 100vh;
    }
    @font-face{
        font-family: AmazonEmber;
        src: url(/Fonts/AmazonEmberRegular.ttf);
    }
</style>

<link rel="stylesheet" href="/CSS/bootstrap.min.css"/>
<link rel="icon" href="/Images/Logo/logo.svg"/>

<script src="/JS/jquery-3.5.1.min.js"></script>
<script src="/JS/bootstrap.min.js"></script>
<script src="/JS/cart.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script defer src="https://use.fontawesome.com/releases/v5.15.1/js/all.js" integrity="sha384-9/D4ECZvKMVEJ9Bhr3ZnUAF+Ahlagp1cyPC7h5yDlZdXs4DQ/vRftzfd+2uFUuqS" crossorigin="anonymous"></script>

<script>
    $(document).ready(function () {
        "use strict";

        $(".btn, input, textarea, .modal-content, select").css("box-shadow", "none").addClass("rounded-0");
    });
</script>
