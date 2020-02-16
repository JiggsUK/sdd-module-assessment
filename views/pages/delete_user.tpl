{extends file="layouts/main.tpl"}
{block name="body"}
    <div class="container">
        <div class="row title-row">
            <h1 class="page-title">Delete A User</h1>
        </div>
        <div class="row content-row mb-3">
            <form class="m-auto" action="" method="post">
                <div class="row body-text">
                    <p class="ml-auto mr-auto">Are you sure you want to delete user {$user}?</p>
                </div>
                <div class="form-check text-center">
                    <input class="form-check-input" type="radio" name="confirm" id="cancel_true" value="1">
                    <label class="form-check-label" for="pass">
                        Yes
                    </label>
                </div>
                <div class="form-check text-center">
                    <input class="form-check-input" type="radio" name="confirm" id="cancel_true" value="0">
                    <label class="form-check-label" for="fail">
                        No
                    </label>
                </div>
                <div class="text-center m-3">
                    <button type="submit" class="btn btn-primary m-auto">Confirm Delete</button>
                </div>
                <div class="text-center m-3">
                    <button type="button" class="btn btn-primary m-auto"><a class="nav-link" href=".\index.php?p=admin">Return to Admin Area</a></button>
                </div>

            </form>
        </div>
    </div>
{/block}
