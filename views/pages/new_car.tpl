{extends file="layouts/main.tpl"}
{block name="body"}
    <div class="container">
        <div class="row title-row">
            <h1 class="page-title">Add A New Car</h1>
        </div>
        <div class="row content-row mb-3">
            <form class="m-auto" action="" method="post">
                <div class="form-group">
                    <label class="required" for="owner">Owner</label>
                    <select class="form-control" id="owner" name="owner" required="required">
                        <option disabled selected>Select...</option>
                        {foreach from=$owners item=owner}
                            <option value="{$owner.user_id}">{$owner.name}</option>
                        {/foreach}
                    </select>
                </div>
                <div class="form-group">
                    <label class="required" for="reg_no">Reg Number</label>
                    <input class="form-control" id="reg_no" name="reg_no" placeholder="Registration Number"
                           required="required"
                           type="text">
                </div>
                <div class="form-group">
                    <label class="required" for="make">Car Make</label>
                    <select class="form-control" id="make" name="make" required="required">
                        <option disabled selected>Select...</option>
                        {foreach from=$make_and_model item=car}
                            <option value="{$car.model_id}">{$car.manufacturer} {$car.model}</option>
                        {/foreach}
                    </select>
                </div>
                <div class="form-group">
                    <label class="required" for="body_type">Body Type</label>
                    <select class="form-control" id="body_type" name="body_type" required="required">
                        <option disabled selected>Select...</option>
                        {foreach from=$body item=car}
                            <option value="{$car.body_type_id}">{$car.body_type}</option>
                        {/foreach}
                    </select>
                </div>
                <div class="form-group">
                    <label class="required" for="capacity">Passenger Capacity</label>
                    <input class="form-control" id="capacity" name="capacity" placeholder="Capacity" required="required"
                           type="number">
                </div>
                <div class="form-group">
                    <label class="required" for="lease_start">Lease Start Date</label>
                    <input class="form-control" id="lease_start" name="lease_start" placeholder="lease_end" required="required"
                           type="date">
                </div>
                <div class="form-group">
                    <label for="lease_end">Lease End Date</label>
                    <input class="form-control" id="lease_end" name="lease_end" placeholder="lease_end" type="date">
                </div>
                <div class="text-center m-3">
                    <button class="btn btn-primary m-auto" type="submit">Add Car</button>
                </div>
                <div class="text-center m-3">
                    <button class="btn btn-primary m-auto" type="button">
                        <a class="nav-link" href="./index.php?p=admin">Return to Admin Area</a>
                    </button>
                </div>

            </form>
        </div>
    </div>
{/block}
