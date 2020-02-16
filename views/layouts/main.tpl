<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
    <meta charset="utf-8" name="viewport" content="width=device-width, initial-scale=1">
    <title>TBS</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <script src="https://kit.fontawesome.com/36a7ec2dc1.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="./css/styles.css"/>
</head>
<body>
<header>
    <nav class="navbar navbar-expand-lg">
        <div class="container">
            <a class="navbar-brand" href="./index.php"><img alt="MSC logo" src="./images/logo.png" width="50%" height="50%"></a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                    aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span>
              <i class="fas fa-bars"></i>
            </span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    {if $user_data}
                        <li class="nav-item">
                            <a class="nav-link" href="./index.php?p=availability">Availability</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="./index.php?p=my_bookings">My Bookings</a>
                        </li>
                        {if $user_data.user_type == 'ADMIN'}
                            <li class="nav-item">
                                <a class="nav-link" href="./index.php?p=admin">Admin</a>
                            </li>
                        {/if}
                        <li class="nav-item">
                            <a class="nav-link" href="./index.php?p=logout">Logout</a>
                        </li>
                    {/if}
                </ul>
            </div>
        </div>
    </nav>
</header>
{block name="body"}{/block}
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<footer class="footer footer-scheme">
    <div class="container">
        <h1>Transport Booking System</h1>
    </div>
</footer>
</body>

</html>
