{extends file="layouts/main.tpl"}
{block name="body"}
    <div class="container">
        <div class="row title-row">
            <h1 class="page-title">Add Car Checks</h1>
        </div>
        <div class="row content-row mb-3">
            <form class="body-text m-auto text-left" action="" method="post">
                <div class="form-group">
                    <label for="pickup_mileage">Pickup Mileage</label>
                    <input type="number" required="required" class="form-control" id="pickup_mileage" name="pickup_mileage" placeholder="Pickup Mileage">
                </div>
                <div class="form-group">
                    <label for="drop_off_mileage">Drop Off Mileage</label>
                    <input type="number" required="required" class="form-control" id="drop_off_mileage" name="drop_off_mileage" placeholder="Drop off Mileage">
                </div>
                <div class="form-group">
                    <label for="fuel">Fuel Level (%)</label>
                    <input type="number" min="1" max="100" step="1" required="required" class="form-control" id="fuel" name="fuel" placeholder="Fuel Level (%)">
                </div>
                <div class="form-group">
                    <label for="check_date">Date of Checks</label>
                    <input type="date" required="required" class="form-control" id="check_date" name="check_date" placeholder="Check Date">
                </div>
                {foreach from=$check_details item=check}
                    <div class="row body-text">
                         <p class="mb-0 mt-2">{$check.check_type}</p>
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="radio" name="{$check.check_type_id}" id="{$check.check_type}_pass" value="1">
                        <label class="form-check-label" for="pass">
                            Pass
                        </label>
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="radio" name="{$check.check_type_id}" id="{$check.check_type}_fail" value="0">
                        <label class="form-check-label" for="fail">
                            Fail
                        </label>
                    </div>
                {/foreach}
                <div class="text-center m-3">
                    <button type="submit" class="btn btn-primary m-auto">Add Checks</button>
                </div>
                <div class="text-center m-3">
                    <button type="button" class="btn btn-primary m-auto"><a class="nav-link" href="./index.php?p=my_bookings">Return to My Bookings</a></button>
                </div>

            </form>
        </div>
    </div>
{/block}
