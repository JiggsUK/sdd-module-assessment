{extends file="layouts/main.tpl"}
{block name="body"}
    <div class="container">
        <div class="row title-row">
            <h1 class="page-title">Add A New Car</h1>
        </div>
        <div class="row content-row mb-3">
            <form class="m-auto" action="" method="post">

                <div class="form-group">
                    <label for="owner">Owner</label>
                    <select class="form-control" id="owner" name="owner">
                        <option disabled selected>Select...</option>
                        {foreach from=$owners item=owner}
                            <option value="{$owner.user_id}">{$owner.name}</option>
                        {/foreach}
                    </select>
                </div>
                <div class="form-group">
                    <label for="reg_no">Reg Number</label>
                    <input type="text"  class="form-control" id="reg_no" name="reg_no" placeholder="Registration Number">
                </div>
                <div class="form-group">
                    <label for="make">Car Make</label>
                    <select class="form-control" id="make" name="make">
                        <option disabled selected>Select...</option>
                        {foreach from=$make_and_model item=car}
                            <option value="{$car.model_id}">{$car.manufacturer} {$car.model}</option>
                        {/foreach}
                    </select>
                </div>
                <div class="form-group">
                    <label for="body_type">Body Type</label>
                    <select class="form-control" id="body_type" name="body_type">
                        <option disabled selected>Select...</option>
                        {foreach from=$body item=car}
                            <option value="{$car.body_type_id}">{$car.body_type}</option>
                        {/foreach}
                    </select>
                </div>
                <div class="form-group">
                    <label for="capacity">Passenger Capacity</label>
                    <input type="number"  class="form-control" id="capacity" name="capacity" placeholder="Capacity">
                </div>
                <div class="form-group">
                    <label for="lease_start">Lease Start Date</label>
                    <input type="date"  class="form-control" id="lease_start" name="lease_start">
                </div>
                <div class="form-group">
                    <label for="lease_end">Lease End Date</label>
                    <input type="date" class="form-control" id="lease_end" name="lease_end" >
                </div>

                <div class="text-center m-3">
                    <button type="submit" class="btn btn-primary m-auto">Add Car</button>
                </div>
                <div class="text-center m-3">
                    <button type="button" class="btn btn-primary m-auto">
                        <a class="nav-link" href="./index.php?p=admin">Return to Admin Area</a>
                    </button>
                </div>

            </form>
        </div>
    </div>
{/block}
