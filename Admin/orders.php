<?php
include("./layouts/header.php");
include("./session_checker.php");
?>
<div id="layoutSidenav">
    <?php include("./layouts/sidebar.php"); ?>
    <div id="layoutSidenav_content">
        <main>
            <div class="text-center mt-3">
                <h4>All Oredrs</h4>
            </div>
            <div class="container-fluid px-4">
                <div class="card mb-4">
                    <div class="card-header">
                        <i class="fas fa-table me-1"></i>
                        DataTable Example
                    </div>
                    <div class="card-body">
                        <table id="datatablesSimple">
                            <thead>
                                <tr>
                                    <th>Order_id</th>
                                    <th>Order_amount</th>
                                    <th>Payment_mode</th>
                                    <th>txn_id</th>
                                    <th>Order_status</th>
                                    <th>Order_date</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tfoot>
                                <tr>
                                    <th>Order_id</th>
                                    <th>Order_amount</th>
                                    <th>Payment_mode</th>
                                    <th>txn_id</th>
                                    <th>Order_status</th>
                                    <th>Order_date</th>
                                    <th>Action</th>
                                </tr>
                            </tfoot>
                            <tbody>
                                <?php
                                $select_query = mysqli_query($conn, "SELECT * FROM `orders` ORDER BY order_date DESC");
                                if (mysqli_num_rows($select_query)>0) {
                                    while ($data = mysqli_fetch_assoc($select_query)) {
                                        ?>
                                        <tr>
                                            <td><?php echo $data['order_id']; ?></td>
                                            <td><?php echo $data['total_order_amount']; ?></td>
                                            <td><?php echo $data['payment_mode']; ?></td>
                                            <td><?php echo $data['txn_id']; ?></td>
                                            <td><?php echo $data['order_status']; ?></td>
                                            <td><?php echo $data['order_date']; ?></td>
                                            <td><button class="btn btn-primary btn-sm">update</button></td>
                                        </tr>
                                        <?php
                                    }
                                }
                                ?>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </main>
<?php
include("./layouts/footer.php");
?>