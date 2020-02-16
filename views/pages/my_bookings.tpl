{extends file="layouts/main.tpl"}
{block name="body"}
    <div class="container">
        <div class="row title-row">
            <h1 class="page-title">My Bookings</h1>
        </div>
        <div class="col-md-12 body-text">
            <p>Your future and previous bookings can be viewed below.</p>
        </div>
        <div class="row">
            <div class="page-subtitle">
                <h5>Your Future Bookings</h5>
            </div>
            <div class="col-md-12 table-responsive">
                <table class="ml-auto mr-auto booking-table">
                    <tr>
                        <th class="cell-padding">ID</th>
                        <th class="cell-padding">Car</th>
                        <th class="cell-padding">Date</th>
                        <th class="cell-padding">Time</th>
                        <th class="cell-padding">No. of Passengers</th>
                        <th class="cell-padding">Purpose</th>
                        <th class="cell-padding">Destination</th>
                        <th class="cell-padding">Actions</th>

                    </tr>

                    {if $future_booking == NULL}
                        <tr>
                            <td colspan="8">
                                You currently have no future bookings
                            </td>
                        </tr>
                    {else}
                        {foreach from=$future_booking item=booking}
                            <tr>
                                <td class="cell-padding">{$booking.booking_id}</td>
                                <td class="cell-padding">{$booking.manufacturer} {$booking.model}</td>
                                <td class="cell-padding">{$booking.booking_date}</td>
                                <td class="cell-padding">{$booking.time_from} - {$booking.time_to}</td>
                                <td class="cell-padding">{$booking.num_passengers}</td>
                                <td class="cell-padding">{$booking.travel_purpose}</td>
                                <td class="cell-padding">{$booking.destination}</td>
                                <td class="cell-padding"><a class="d-block text-link"
                                                            href=".\index.php?p=add_checks&id={$booking.booking_id}">
                                        Add Car Checks</a>
                                    <a class="d-block text-link"
                                       href=".\index.php?p=update_booking&id={$booking.booking_id}"> Update Booking</a>
                                    <a class="d-block text-link"
                                       href=".\index.php?p=cancel_booking&id={$booking.booking_id}"> Cancel Booking</a>
                                </td>
                            </tr>
                        {/foreach}
                    {/if}

                </table>
            </div>
        </div>
        <div class="row mt-5 mb-3">
            <div class="page-subtitle">
                <h5>Your Previous Bookings</h5>
            </div>
            <div class="col-md-12 table-responsive">
                <table class="ml-auto mr-auto booking-table">
                    <tr>
                        <th class="cell-padding">ID</th>
                        <th class="cell-padding">Car</th>
                        <th class="cell-padding">Date</th>
                        <th class="cell-padding">Time</th>
                        <th class="cell-padding">No. of Passengers</th>
                        <th class="cell-padding">Purpose</th>
                        <th class="cell-padding">Destination</th>
                        <th class="cell-padding">Actions</th>
                    </tr>
                    {if $prev_booking == NULL}
                        <tr>
                            <td colspan="8">
                                You currently have no previous bookings
                            </td>
                        </tr>
                    {else}
                        {foreach from=$prev_booking item=booking}
                            <tr>
                                <td class="cell-padding">{$booking.booking_id}</td>
                                <td class="cell-padding">{$booking.manufacturer} {$booking.model}</td>
                                <td class="cell-padding">{$booking.booking_date}</td>
                                <td class="cell-padding">{$booking.time_from} - {$booking.time_to}</td>
                                <td class="cell-padding">{$booking.num_passengers}</td>
                                <td class="cell-padding">{$booking.travel_purpose}</td>
                                <td class="cell-padding">{$booking.destination}</td>
                                <td class="cell-padding"><a class="d-block text-link"
                                                            href=".\index.php?p=add_checks&id={$booking.booking_id}">
                                        Add Car Checks</a>

                                </td>
                            </tr>
                        {/foreach}
                    {/if}
                </table>
            </div>
        </div>
        <div class="row mb-3">
            <div class="text-center ml-auto mr-auto">
                <button type="button" class="btn btn-primary m-auto">
                    <a class="nav-link" href=".\index.php?p=home">Return to Home</a>
                </button>
            </div>
        </div>
    </div>
{/block}
