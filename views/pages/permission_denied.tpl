{extends file="layouts/main.tpl"}
{block name="body"}
    <div class="container">
        <div class="row title-row mt-5">
            <h3 class="page-subtitle ml-auto mr-auto">Permission Denied</h3>
        </div>
        <div class="text-center m-3">
            <p class="body-text">You do not have the correct permissions to access this area.</p>
            <p class="body-text">If this is a mistake, please contact HR to resolve this issue.</p>
            <button type="button" class="btn btn-primary m-auto"><a class="nav-link" href="./index.php?p=home">Return to Home</a></button>
        </div>
    </div>
{/block}
