{extends file="layouts/main.tpl"}
{block name="body"}
    <div class="container">
        <div class="row title-row">
            <h1 class="page-title">Manage Users</h1>
        </div>

        <div class="row mb-3">
            <div class="col-md-6 text-center m-auto">
                <button type="button" class="btn btn-primary m-auto">
                    <a class="nav-link" href=".\index.php?p=new_user">Add New User</a>
                </button>
            </div>
            <div class="col-md-6 text-center m-auto">
                <button type="button" class="btn btn-primary m-auto">
                    <a class="nav-link" href=".\index.php?p=admin">Return to Admin Area</a>
                </button>
            </div>
        </div>

        <div class="row mb-3">
            <div class="col-md-12 table-responsive">
                <table class="ml-auto mr-auto booking-table">
                    <tr>
                        <th class="cell-padding">ID</th>
                        <th class="cell-padding">Name</th>
                        <th class="cell-padding">Employee Number</th>
                        <th class="cell-padding">Dept.</th>
                        <th class="cell-padding">Job Title</th>
                        <th class="cell-padding">Mob. No.</th>
                        <th class="cell-padding">Work Ext.</th>
                        <th class="cell-padding">Email Address</th>
                        <th class="cell-padding">Actions</th>
                    </tr>

                    {foreach from=$all_users item=user}
                        <tr>
                            <td class="cell-padding">{$user.user_id}</td>
                            <td class="cell-padding">{$user.name}</td>
                            <td class="cell-padding">{$user.employee_number}</td>
                            <td class="cell-padding">{$user.department}</td>
                            <td class="cell-padding">{$user.job_title}</td>
                            <td class="cell-padding">{$user.mobile_number}</td>
                            <td class="cell-padding">{$user.work_ext}</td>
                            <td class="cell-padding">{$user.email_address}</td>
                            <td class="cell-padding"><a class="d-block text-link"
                                                        href=".\index.php?p=update_user&id={$user.user_id}">
                                    Update User</a>
                                <a class="d-block text-link"
                                   href=".\index.php?p=delete_user&id={$user.user_id}"> Delete User</a>
                            </td>
                        </tr>
                    {/foreach}
                </table>
            </div>

        </div>
    </div>
{/block}
