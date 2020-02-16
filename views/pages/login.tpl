{extends file="layouts/main.tpl"}
{block name="body"}
    <div class="container">
        <div class="row">
            <div class="col-md-12 title-row d-flex align-items-center">
                <h1 class="page-title">Sign In</h1>
            </div>
            <div class="col-md-12 body-text">
                <p>Welcome to the Transport Booking System!</p>
                <p>Please log in below</p>
            </div>
        </div>
        <div class="row content-row">
            <div class="col-md-4"></div>
            <div class="col-md-4">
                {if $error}
                    <div class="alert alert-danger text-center" role="alert">
                        {$error}
                    </div>
                {/if}
                <form action="" method="post">
                    <div class="form-group">
                        <label for="email">Email address</label>
                        <input type="email" class="form-control" id="email" name="email" placeholder="Enter email">
                    </div>
                    <div class="form-group">
                        <label for="password">Password</label>
                        <input type="password" class="form-control" id="password" name="password" placeholder="Password">
                    </div>
                    <div class="text-center">
                        <button type="submit" class="btn btn-primary">Sign In</button>
                    </div>
                </form>
            </div>
            <div class="col-md-4"></div>
        </div>
        <div class="row mt-3 mb-5">
            <div class="col-md-12 body-text">
                <p>To use this service, please contact a member of HR.</p>
            </div>
        </div>
    </div>
{/block}