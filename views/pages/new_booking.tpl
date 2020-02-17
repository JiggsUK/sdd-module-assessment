{extends file="layouts/main.tpl"}
{block name="body"}
    <div class="container">
        <div class="row title-row">
            <h1 class="page-title">Make a Booking</h1>
        </div>
        <div class="row content-row mb-3">
            <div class="col-md-4"></div>
            <div class="col-md-4">
                {if $error}
                    <div class="alert alert-danger text-center" role="alert">
                        {$error}
                    </div>
                {/if}
                <form class="m-auto" action="" method="post">
                    <div class="form-group">
                        <label class="required" for="pickup">Pickup Date and Time</label>
                        <input class="form-control" id="pickup" name="pickup" placeholder="Pickup Date & Time"
                               required="required" type="datetime-local">
                    </div>
                    <div class="form-group">
                        <label class="required" for="drop-off">Drop Off Date and Time</label>
                        <input class="form-control" id="drop-off" name="drop-off" placeholder="Drop off Date & Time"
                               required="required" type="datetime-local">
                    </div>
                    <div class="form-group">
                        <label class="required" for="passengers">Number of Passengers</label>
                        <input class="form-control" id="passengers" name="passengers" placeholder="Number of Passengers"
                               required="required" type="number">
                    </div>
                    <div class="form-group">
                        <label class="required" for="travelPurpose">Purpose of Travel</label>
                        <input class="form-control" id="travelPurpose" name="travelPurpose" placeholder="Purpose of Travel"
                               required="required" type="text">
                    </div>
                    <div class="form-group">
                        <label class="required" for="destination">Destination</label>
                        <input class="form-control" id="destination" name="destination" placeholder="Destination"
                               required="required" type="text">
                    </div>
                    <div class="text-center m-3">
                        <button class="btn btn-primary m-auto" type="submit">Book</button>
                    </div>
                    <div class="text-center m-3">
                        <button class="btn btn-primary m-auto" type="button">
                            <a class="nav-link" href="./index.php?p=availability">Return to Availability</a>
                        </button>
                    </div>
                </form>
            </div>
            <div class="col-md-4"></div>

        </div>
    </div>
{/block}
