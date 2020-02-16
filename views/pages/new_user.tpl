{extends file="layouts/main.tpl"}
{block name="body"}
    <div class="container">
        <div class="row title-row">
            <h1 class="page-title">Add A New User</h1>
        </div>
        <div class="row content-row mb-3">
            <form class="m-auto" action="" method="post">
                <div class="form-group">
                    <label class="required" for="emp_num">Employee Number</label>
                    <input type="text" required="required" class="form-control" id="employee_number" name="employee_number" placeholder="Employee Number">
                </div>
                <div class="form-group">
                    <label class="required" for="first_name">First Name</label>
                    <input type="text" required="required" class="form-control" id="first_name" name="first_name" placeholder="First Name">
                </div>
                <div class="form-group">
                    <label class="required" for="last_name">Last Name</label>
                    <input type="text" required="required" class="form-control" id="last_name" name="last_name" placeholder="Last Name">
                </div>
                <div class="form-group">
                    <label class="required" for="department">Department</label>
                    <input type="text" required="required" class="form-control" id="department" name="department" placeholder="Department">
                </div>
                <div class="form-group">
                    <label class="required" for="job">Job Title</label>
                    <input type="text" required="required" class="form-control" id="job" name="job" placeholder="Job Title">
                </div>
                <div class="form-group">
                    <label class="required" for="mobile">Mobile No.</label>
                    <input type="text" required="required" class="form-control" id="mobile" name="mobile" placeholder="Mobile No.">
                </div>
                <div class="form-group">
                    <label class="required" for="work_ext">Work Ext.</label>
                    <input type="text" required="required" class="form-control" id="work_ext" name="work_ext" placeholder="Work Ext.">
                </div>
                <div class="form-group">
                    <label class="required" for="email">Email</label>
                    <input type="email" required="required" class="form-control" id="email" name="email" placeholder="Email">
                </div>
                <div class="form-group">
                    <label class="required" for="password">Password</label>
                    <input type="password" required="required" class="form-control" id="password" name="password" placeholder="Password">
                </div>
                <div class="form-group">
                    <label class="required" for="confirm_password">Confirm Password</label>
                    <input type="password" required="required" class="form-control" id="confirm_password" name="confirm_password" placeholder="Confirm Password">
                </div>
                <div class="form-group">
                    <label class="required" for="user_type">User Type</label>
                    <select required="required" class="form-control" id="user_type" name="user_type">
                        <option disabled selected>Select...</option>
                        <option>Authorised User</option>
                        <option>Admin</option>
                    </select>
                </div>
                <div class="text-center m-3">
                    <button type="submit" class="btn btn-primary m-auto">Add User</button>
                </div>
                <div class="text-center m-3">
                    <button type="button" class="btn btn-primary m-auto"><a class="nav-link" href="./index.php?p=admin">Return to Admin Area</a></button>
                </div>
            </form>
        </div>
    </div>
{/block}
