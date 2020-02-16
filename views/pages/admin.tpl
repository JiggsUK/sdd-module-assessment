{extends file="layouts/main.tpl"}
{block name="body"}
    <div class="container">
        <div class="row title-row">
            <h1 class="page-title">Admin Area</h1>
        </div>
        <div class="row content-row">
            <div class="card-deck">
                <div class="col-md-4 mt-3">
                    <a href="./index.php?p=manage_cars">
                        <div class="card button-links">
                            <div class="card-body d-flex align-items-center">
                                <h5 class="card-title m-auto">Manage Cars</h5>
                            </div>
                        </div>
                    </a>
                </div>
                <div class="col-md-4 mt-3">
                    <a href="./index.php?p=manage_users">
                        <div class="card button-links">
                            <div class="card-body d-flex align-items-center">
                                <h5 class="card-title m-auto">Manage Users</h5>
                            </div>
                        </div>
                    </a>
                </div>
                <div class="col-md-4 mt-3">
                    <a href="./index.php?p=manage_bookings">
                        <div class="card button-links">
                            <div class="card-body d-flex align-items-center">
                                <h5 class="card-title m-auto">Manage Bookings</h5>
                            </div>
                        </div>
                    </a>
                </div>
                <div class="col-md-4 mt-3">
                    <a href="./index.php?p=audit">
                        <div class="card button-links">
                            <div class="card-body d-flex align-items-center">
                                <h5 class="card-title m-auto">View Audit Trail</h5>
                            </div>
                        </div>
                    </a>
                </div>
            </div>
        </div>
        <div class="row mb-3 mt-5">
            <div class="text-center ml-auto mr-auto">
                <button type="button" class="btn btn-primary m-auto">
                    <a class="nav-link" href="./index.php?p=home">Return to Home</a>
                </button>
            </div>
        </div>
    </div>
{/block}
