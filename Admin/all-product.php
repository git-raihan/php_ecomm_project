<?php
include("../project-config.php");
include("./layouts/header.php");
?>
        <div id="layoutSidenav">
        <?php include("./layouts/sidebar.php"); ?>
            <div id="layoutSidenav_content">
                <main>
                    <div class="container mt-3">
                        <h3>All Products</h3>
                    </div>
                    <div class="col-8 mx-auto">
                        <div
                            class="table-responsive"
                        >
                            <table
                                class="table table-striped align-middle"
                            >
                                <thead class="table-light">
                                    <caption>
                                        Table Name
                                    </caption>
                                    <tr>
                                        <th>Product Image</th>
                                        <th>Product Name</th>
                                        <th>Category</th>
                                        <th>Product Price</th>
                                        <th colspan="2" class="text-center">Action</th>
                                    </tr>
                                </thead>
                                <tbody class="table-group-divider">
                                    <?php
                                    $select_query=mysqli_query($conn, "SELECT * FROM `product` WHERE 1");
                                    if (!mysqli_num_rows($select_query)>0) {
                                        echo "no data found";
                                    }
                                    while ($data=mysqli_fetch_assoc($select_query)) {
                                        ?>
                                            <tr>
                                                <td scope="row">
                                                    <img src="<?php echo $data['product_image']; ?>" width="150" height="100" alt="">
                                                </td>
                                                <td><?php echo $data['product_name']; ?></td>
                                                <td><?php echo $data['cat_id']; ?></td>
                                                <td><?php echo $data['product_price']; ?></td>
                                                <td><button class="btn btn-success">update</button></td>
                                                <td><button class="btn btn-danger">delete</button></td>
                                            </tr>
                                        <?php
                                    }
                                    ?>
                                    
                                </tbody>
                                <tfoot>
                                    
                                </tfoot>
                            </table>
                        </div>
                        
                    </div>
                </main>
            </div>
        </div>    
<?php
include("./layouts/footer.php");
?>
