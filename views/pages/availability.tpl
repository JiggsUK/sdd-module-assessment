{extends file="layouts/main.tpl"}
{block name="body"}
    <div class="container">
        <div class="row title-row">
            <h1 class="page-title">Car Availability</h1>
        </div>
        <div class="col-md-12 body-text">
            <p>Below are the current bookings for each car.</p>
            <p>Any date and time not listed below is available for booking.</p>
        </div>
        <div class="row">
            {foreach from=$availability_data item=car}
                <div class="col-md-6 mt-3 mb-4">
                    <h3 class="page-subtitle text-center">{$car.manufacturer} {$car.model}</h3>
                    <h5 class="body-text">Max Capacity: {$car.passenger_capacity}</h5>
                    <div class="col-md-12 min-height">
                        <table class="ml-auto mr-auto">
                            <tr>
                                <th>Date</th>
                                <th>Time</th>
                            </tr>
                            {if $car.availability == NULL}
                                <tr>
                                    <td colspan="2">There are currently no bookings for this car.</td>
                                </tr>
                            {else}
                                {foreach from=$car.availability item=bookings}
                                    <tr>
                                        <td>{$bookings.booking_date}</td>
                                        <td>{$bookings.time_from} - {$bookings.time_to}</td>
                                    </tr>
                                {/foreach}
                            {/if}
                        </table>
                    </div>
                    <div class="text-center m-3">
                        <a class="nav-link" href=".\index.php?p=new_booking&car_id={$car.car_id}">
                            <button type="link" class="btn btn-primary">Book this car</button>
                        </a>
                    </div>
                </div>
            {/foreach}
        </div>
    </div>
{/block}
