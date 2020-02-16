{extends file="layouts/main.tpl"}
{block name="body"}
    <div class="container">
        <div class="row title-row">
            <h1 class="page-title">Manage Cars</h1>
        </div>

        <div class="row mb-3">
            <div class="col-md-6 text-center m-auto">
                <button type="button" class="btn btn-primary m-auto"><a class="nav-link" href=".\index.php?p=new_car">Add New Car</a></button>
            </div>
            <div class="col-md-6 text-center m-auto">
                <button type="button" class="btn btn-primary m-auto"><a class="nav-link" href=".\index.php?p=admin">Return to Admin Area</a></button>
            </div>
        </div>

        <div class="row mb-3 mt-5">
            <div class="page-subtitle">
                <h5>Current Pool Cars</h5>
            </div>
            <div class="col-md-12 table-responsive">
                <table class="ml-auto mr-auto booking-table">
                    <tr>
                        <th class="cell-padding">ID</th>
                        <th class="cell-padding">Owner</th>
                        <th class="cell-padding">Make and Model</th>
                        <th class="cell-padding">Reg. Number</th>
                        <th class="cell-padding">Body Type</th>
                        <th class="cell-padding">Passenger Capacity</th>
                        <th class="cell-padding">Lease Start</th>
                        <th class="cell-padding">Last Updated</th>
                        <th class="cell-padding">Actions</th>
                    </tr>

                    {foreach from=$all_cars item=car}
                        <tr>
                            <td class="cell-padding">{$car.car_id}</td>
                            <td class="cell-padding">{$car.name}</td>
                            <td class="cell-padding">{$car.manufacturer} {$car.model}</td>
                            <td class="cell-padding">{$car.reg_number}</td>
                            <td class="cell-padding">{$car.body_type}</td>
                            <td class="cell-padding">{$car.passenger_capacity}</td>
                            <td class="cell-padding">{$car.lease_start_date}</td>
                            <td class="cell-padding">{$car.last_update}</td>
                            <td class="cell-padding"><a class="d-block text-link"
                                                        href=".\index.php?p=update_car&id={$car.car_id}">
                                    Update car</a>
                                <a class="d-block text-link"
                                   href=".\index.php?p=delete_car&id={$car.car_id}"> Delete car</a>
                            </td>
                        </tr>
                    {/foreach}
                </table>
            </div>
        </div>

        <div class="row mb-3 mt-5">
            <div class="page-subtitle">
                <h5>Lease Expired Pool Cars</h5>
            </div>
            <div class="col-md-12 table-responsive">
                <table class="ml-auto mr-auto booking-table">
                    <tr>
                        <th class="cell-padding">ID</th>
                        <th class="cell-padding">Owner</th>
                        <th class="cell-padding">Make and Model</th>
                        <th class="cell-padding">Reg. Number</th>
                        <th class="cell-padding">Body Type</th>
                        <th class="cell-padding">Passenger Capacity</th>
                        <th class="cell-padding">Lease Start</th>
                        <th class="cell-padding">Lease End</th>
                        <th class="cell-padding">Last Updated</th>
                        <th class="cell-padding">Actions</th>
                    </tr>

                    {foreach from=$expired_cars item=car}
                        <tr>
                            <td class="cell-padding">{$car.car_id}</td>
                            <td class="cell-padding">{$car.name}</td>
                            <td class="cell-padding">{$car.manufacturer} {$car.model}</td>
                            <td class="cell-padding">{$car.reg_number}</td>
                            <td class="cell-padding">{$car.body_type}</td>
                            <td class="cell-padding">{$car.passenger_capacity}</td>
                            <td class="cell-padding">{$car.lease_start_date}</td>
                            <td class="cell-padding">{$car.lease_end_date}</td>
                            <td class="cell-padding">{$car.last_update}</td>
                            <td class="cell-padding"><a class="d-block text-link"
                                                        href=".\index.php?p=update_car&id={$car.car_id}">
                                    Update car</a>
                                <a class="d-block text-link"
                                   href=".\index.php?p=delete_car&id={$car.car_id}"> Delete car</a>
                            </td>
                        </tr>
                    {/foreach}
                </table>
            </div>
        </div>
    </div>
{/block}
