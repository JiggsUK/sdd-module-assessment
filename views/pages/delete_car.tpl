{extends file="layouts/main.tpl"}
{block name="body"}
    <div class="container">
        <div class="row title-row">
            <h1 class="page-title">Delete A Car</h1>
        </div>
        <div class="row content-row mb-3">
            <div class="col-md-12 body-text">
                <p class="ml-auto mr-auto">The car will not be removed from the database.<br>
                    The Lease Expiry Date will be updated to today's date and the car will no longer be bookable.<br>
                    Are you sure you want to remove car {$car} from the pool cars?</p>

            </div>
            <form class="m-auto" action="" method="post">

                <div class="form-check text-center">
                    <input class="form-check-input" type="radio" name="confirm" id="cancel_true" value="1">
                    <label class="form-check-label" for="pass">
                        Yes
                    </label>
                </div>
                <div class="form-check text-center">
                    <input class="form-check-input" type="radio" name="confirm" id="cancel_true" value="0">
                    <label class="form-check-label" for="fail">
                        No
                    </label>
                </div>
                <div class="text-center m-3">
                    <button type="submit" class="btn btn-primary m-auto">Confirm Delete</button>
                </div>
                <div class="text-center m-3">
                    <button type="button" class="btn btn-primary m-auto"><a class="nav-link" href=".\index.php?p=admin">Return to Admin Area</a></button>
                </div>

            </form>
        </div>
    </div>
{/block}
