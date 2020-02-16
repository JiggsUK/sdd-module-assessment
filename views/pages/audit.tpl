{extends file="layouts/main.tpl"}
{block name="body"}
    <div class="container">
        <div class="row title-row">
            <h1 class="page-title">Audit Trail</h1>
        </div>
        <div class="col-md-12 body-text">
            <p>User activities can be seen below</p>
        </div>
        <div class="row">
            <div class="col-md-12 table-responsive">
                <table class="ml-auto mr-auto booking-table">
                    <tr>
                        <th class="cell-padding">Timestamp</th>
                        <th class="cell-padding">User</th>
                        <th class="cell-padding">Activity</th>
                    </tr>
                        {foreach from=$audit_data item=audit}
                            <tr>
                                <td class="cell-padding">{$audit.timestamp}</td>
                                <td class="cell-padding">{$audit.logger}</td>
                                <td class="cell-padding">{$audit.message}</td>
                            </tr>
                        {/foreach}
                </table>
            </div>
        </div>

        <div class="row mb-3 mt-5">
            <div class="text-center ml-auto mr-auto">
                <button type="button" class="btn btn-primary m-auto">
                    <a class="nav-link" href=".\index.php?p=admin">Return to Admin Area</a>
                </button>
            </div>
        </div>
    </div>
{/block}
