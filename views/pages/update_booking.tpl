{extends file="layouts/main.tpl"}
{block name="body"}
    <div class="container">
        <div class="row title-row">
            <h1 class="page-title">Update Your Booking</h1>
        </div>
        <div class="col-md-12 body-text">
            <p>Update your booking details below.</p>
            <p>To change the date or car, please cancel this booking and re-book under the correct date and/or car.</p>
        </div>
        <div class="row content-row mb-3">
            <form class="m-auto" action="" method="post">
                <div class="form-group">
                    <label for="passengers">Number of Passengers</label>
                    <input type="number" class="form-control" id="passengers" name="passengers" placeholder="Number of Passengers">
                </div>
                <div class="form-group">
                    <label for="travelPurpose">Purpose of Travel</label>
                    <input type="text"  class="form-control" id="travelPurpose" name="purpose" placeholder="Purpose of Travel">
                </div>
                <div class="form-group">
                    <label for="destination">Destination</label>
                    <input type="text"  class="form-control" id="destination" name="destination" placeholder="Destination">
                </div>
                <div class="text-center m-3">
                    <button type="submit" class="btn btn-primary m-auto">Update</button>
                </div>
                <div class="text-center m-3">
                    <button type="button" class="btn btn-primary m-auto"><a class="nav-link" href="./index.php?p=my_bookings">Return to My Bookings</a></button>
                </div>

            </form>
        </div>
    </div>
{/block}
