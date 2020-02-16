{extends file="layouts/main.tpl"}
{block name="body"}
    <div class="container">
        <div class="row title-row">
            <h1 class="page-title">Update a User</h1>
        </div>
        <div class="row content-row mb-3">
            <form class="m-auto" action="" method="post">
                <div class="form-group">
                    <label for="employee_number">Employee Number</label>
                    <input type="text"  class="form-control" id="employee_number" name="employee_number" placeholder="Employee Number">
                </div>
                <div class="form-group">
                    <label for="first_name">First Name</label>
                    <input type="text"  class="form-control" id="first_name" name="first_name" placeholder="First Name">
                </div>
                <div class="form-group">
                    <label for="last_name">Last Name</label>
                    <input type="text"  class="form-control" id="last_name" name="last_name" placeholder="Last Name">
                </div>
                <div class="form-group">
                    <label for="department">Department</label>
                    <input type="text"  class="form-control" id="department" name="department" placeholder="Department">
                </div>
                <div class="form-group">
                    <label for="job">Job Title</label>
                    <input type="text"  class="form-control" id="job" name="job" placeholder="Job Title">
                </div>
                <div class="form-group">
                    <label for="mobile">Mobile No.</label>
                    <input type="text"  class="form-control" id="mobile" name="mobile" placeholder="Mobile No.">
                </div>
                <div class="form-group">
                    <label for="work_ext">Work Ext.</label>
                    <input type="text"  class="form-control" id="work_ext" name="work_ext" placeholder="Work Ext.">
                </div>
                <div class="form-group">
                    <label for="email">Email</label>
                    <input type="email"  class="form-control" id="email" name="email" placeholder="Email">
                </div>
                <div class="form-group">
                    <label for="destination">User Type</label>
                    <select  class="form-control" id="user_type" name="user_type">
                        <option disabled selected>Select...</option>
                        <option>Authorised User</option>
                        <option>Admin</option>
                    </select>
                </div>

                <div class="text-center m-3">
                    <button type="submit" class="btn btn-primary m-auto">Update User</button>
                </div>
                <div class="text-center m-3">
                    <button type="button" class="btn btn-primary m-auto"><a class="nav-link" href="./index.php?p=admin">Return to Admin Area</a></button>
                </div>

            </form>
        </div>
    </div>
{/block}
