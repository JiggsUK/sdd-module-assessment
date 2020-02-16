{extends file="layouts/main.tpl"}
{block name="body"}
    <div class="container">
        <div class="row title-row">
            <h1 class="page-title">Previous Bookings</h1>
        </div>
        <div class="row mb-3">
            <div class="col-md-6 text-center m-auto">
                <button type="button" class="btn btn-primary m-auto">
                    <a class="nav-link" href="./index.php?p=manage_bookings">Return to Future Bookings</a>
                </button>
            </div>
            <div class="col-md-6 text-center m-auto">
                <button type="button" class="btn btn-primary m-auto">
                    <a class="nav-link" href="./index.php?p=admin">Return to Admin Area</a>
                </button>
            </div>
        </div>
        <div class="row mb-3">
            <div class="col-md-3">
                <div class="container">
                    <form action="" method="post">
                        <div class="form-group">
                            <label class="required" for="make">Car</label>
                            <select class="form-control" id="make" name="make" required="required">
                                <option disabled selected>Select...</option>
                                {foreach from=$make_and_model item=car}
                                    <option value="{$car.model_id}">{$car.manufacturer} {$car.model}</option>
                                {/foreach}
                            </select>
                        </div>
                        <div class="text-center">
                            <button type="submit" class="btn btn-primary">Apply</button>
                        </div>
                    </form>
                </div>
            </div>
            <div class="col-md-9">
                <div class="col-md-12 table-responsive">
                    <table class="ml-auto mr-auto booking-table">
                        <tr>
                            <th class="cell-padding">ID</th>
                            <th class="cell-padding">Car</th>
                            <th class="cell-padding">User</th>
                            <th class="cell-padding">Date</th>
                            <th class="cell-padding">Time</th>
                            <th class="cell-padding">Passengers</th>
                            <th class="cell-padding">Purpose</th>
                            <th class="cell-padding">Destination</th>
                        </tr>
                        {if $bookings == NULL}
                            <tr>
                                <td colspan="8">
                                    There are no previous bookings for this car.
                                </td>
                            </tr>
                        {else}
                            {foreach from=$bookings item=booking}
                                <tr>
                                    <td class="cell-padding">{$booking.booking_id}</td>
                                    <td class="cell-padding">{$booking.manufacturer} {$booking.model}</td>
                                    <td class="cell-padding">{$booking.first_name} {$booking.last_name}</td>
                                    <td class="cell-padding">{$booking.booking_date}</td>
                                    <td class="cell-padding">{$booking.time_from} - {$booking.time_to}</td>
                                    <td class="cell-padding">{$booking.num_passengers}</td>
                                    <td class="cell-padding">{$booking.travel_purpose}</td>
                                    <td class="cell-padding">{$booking.destination}</td>
                                </tr>
                            {/foreach}
                        {/if}
                    </table>
                </div>
            </div>
        </div>

        {*<div class="row mb-3">
            <div class="col-md-12 table-responsive">
                <table class="ml-auto mr-auto booking-table">
                    <tr>
                        <th class="cell-padding">ID</th>
                        <th class="cell-padding">Car</th>
                        <th class="cell-padding">User</th>
                        <th class="cell-padding">Date</th>
                        <th class="cell-padding">Time</th>
                        <th class="cell-padding">No. of Passengers</th>
                        <th class="cell-padding">Purpose</th>
                        <th class="cell-padding">Destination</th>
                        <th class="cell-padding">Actions</th>
                    </tr>
                    {if $bookings == NULL}
                        <tr>
                            <td colspan="8">
                                There are no future bookings.
                            </td>
                        </tr>
                    {else}
                        {foreach from=$bookings item=booking}
                            <tr>
                                <td class="cell-padding">{$booking.booking_id}</td>
                                <td class="cell-padding">{$booking.manufacturer} {$booking.model}</td>
                                <td class="cell-padding">{$booking.first_name} {$booking.last_name}</td>
                                <td class="cell-padding">{$booking.booking_date}</td>
                                <td class="cell-padding">{$booking.time_from} - {$booking.time_to}</td>
                                <td class="cell-padding">{$booking.num_passengers}</td>
                                <td class="cell-padding">{$booking.travel_purpose}</td>
                                <td class="cell-padding">{$booking.destination}</td>
                                <td class="cell-padding">
                                    <a class="d-block text-link"
                                       href="./index.php?p=update_booking&id={$booking.booking_id}"> Update Booking</a>
                                    <a class="d-block text-link"
                                       href="./index.php?p=cancel_booking&id={$booking.booking_id}"> Cancel Booking</a>
                                </td>
                            </tr>
                        {/foreach}
                    {/if}
                </table>
            </div>
        </div>*}

    </div>
{/block}
