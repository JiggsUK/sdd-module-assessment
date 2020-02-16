{extends file="layouts/main.tpl"}
{block name="body"}
    <div class="container">
        <div class="row title-row">
            <h1 class="page-title">Welcome!</h1>
        </div>
        <div class="row content-row">
            <div class="card-deck">
                <div class="col-md-4">
                    <a href="./index.php?p=availability">
                        <div class="card button-links">
                            <div class="card-body d-flex align-items-center">
                                <h5 class="card-title m-auto">Check Availability & Make a Booking</h5>
                            </div>
                        </div>
                    </a>
                </div>
                <div class="col-md-4">
                    <a href="./index.php?p=my_bookings">
                        <div class="card button-links">
                            <div class="card-body d-flex align-items-center">
                                <h5 class="card-title m-auto">My Bookings</h5>
                            </div>
                        </div>
                    </a>
                </div>
                {if $user_data.user_type == 'AUTHORISED USER'}
                    <div class="col-md-4">
                        <a class="disabled" href="#">
                            <div class="card button-links disabled">
                                <div class="card-body d-flex align-items-center">
                                    <h5 class="card-title m-auto">Admin</h5>
                                </div>
                            </div>
                        </a>
                    </div>
                    {else}
                    <div class="col-md-4">
                        <a href="./index.php?p=admin">
                            <div class="card button-links">
                                <div class="card-body d-flex align-items-center">
                                    <h5 class="card-title m-auto">Admin Area</h5>
                                </div>
                            </div>
                        </a>
                    </div>
                {/if}
            </div>
        </div>
    </div>
{/block}
