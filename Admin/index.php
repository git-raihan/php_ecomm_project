<?php
include("./layouts/header.php");
include("./session_checker.php");
?>
        <div id="layoutSidenav">
        <?php include("./layouts/sidebar.php"); ?>
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">Dashboard</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">Dashboard</li>
                        </ol>
                        <div class="row">
                            <div class="col-xl-3 col-md-6">
                                <div class="card bg-primary text-white mb-4">
                                    <div class="card-header">Total Sell</div>
                                    <?php
                                        $sell_select_query = mysqli_query($conn, "SELECT SUM(total_order_amount) as total_sells FROM `orders`");
                                        if (mysqli_num_rows($sell_select_query)>0) {
                                            $sell = mysqli_fetch_assoc($sell_select_query);
                                        }
                                    ?>
                                    <div class="card-body"><?php echo $sell['total_sells']; ?></div>
                                </div>
                            </div>
                            <div class="col-xl-3 col-md-6">
                                <div class="card bg-warning text-white mb-4">
                                    <div class="card-header">Total Customer</div>
                                    <?php
                                        $cus_select_query = mysqli_query($conn, "SELECT COUNT(*) as total_customers FROM `customers`");
                                        if (mysqli_num_rows($cus_select_query)>0) {
                                            $customers = mysqli_fetch_assoc($cus_select_query);
                                        }
                                    ?>
                                    <div class="card-body"><?php echo $customers['total_customers']; ?></div>
                                </div>
                            </div>
                            <div class="col-xl-3 col-md-6">
                                <div class="card bg-success text-white mb-4">
                                    <div class="card-header">Total Orders</div>
                                    <?php
                                        $order_select_query = mysqli_query($conn, "SELECT COUNT(*) AS total_orders FROM `orders`");
                                        if (mysqli_num_rows($order_select_query)>0) {
                                            $order = mysqli_fetch_assoc($order_select_query);
                                        }
                                    ?>
                                    <div class="card-body"><?php echo $order['total_orders']; ?></div>
                                </div>
                            </div>
                            <div class="col-xl-3 col-md-6">
                                <div class="card bg-danger text-white mb-4">
                                    <div class="card-header">Total Products</div>
                                    <?php
                                        $product_select_query = mysqli_query($conn, "SELECT COUNT(*) AS total_product FROM `product`");
                                        if (mysqli_num_rows($product_select_query)>0) {
                                            $product = mysqli_fetch_assoc($product_select_query);
                                        }
                                    ?>
                                    <div class="card-body"><?php echo $product['total_product']; ?></div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xl-6">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fas fa-chart-area me-1"></i>
                                        Area Chart Example
                                    </div>
                                    <div class="card-body"><canvas id="myAreaChart" width="100%" height="40"></canvas></div>
                                </div>
                            </div>
                            <div class="col-xl-6">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fas fa-chart-bar me-1"></i>
                                        Bar Chart Example
                                    </div>
                                    <div class="card-body"><canvas id="myBarChart" width="100%" height="40"></canvas></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </main>
<?php
include("./layouts/footer.php");
?>