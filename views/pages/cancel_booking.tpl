{extends file="layouts/main.tpl"}
{block name="body"}
    <div class="container">
        <div class="row title-row">
            <h1 class="page-title">Cancel Your Booking</h1>
        </div>
        <div class="row content-row mb-3">
            <form class="m-auto" action="" method="post">
                <div class="row body-text">
                    <p class="ml-auto mr-auto">Are you sure you want to cancel your booking?</p>
                </div>
                <div class="form-check text-center">
                    <input class="form-check-input" type="radio" name="confirm" value="2">
                    <label class="form-check-label" for="pass">
                        Yes
                    </label>
                </div>
                <div class="form-check text-center">
                    <input class="form-check-input" type="radio" name="confirm" value="1">
                    <label class="form-check-label" for="fail">
                        No
                    </label>
                </div>
                <div class="text-center m-3">
                    <button type="submit" class="btn btn-primary m-auto">Confirm Cancel</button>
                </div>
                <div class="text-center m-3">
                    <button type="button" class="btn btn-primary m-auto">
                        <a class="nav-link" href="./index.php?p=my_bookings">Return to My Bookings</a>
                    </button>
                </div>

            </form>
        </div>
    </div>
{/block}
