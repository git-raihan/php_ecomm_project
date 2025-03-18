<?php
include('./layout/header.php');
include('./project-config.php');
?>

<!-- Related items section-->
<section class="py-5 bg-light">
    <div class="container my-5">
        <div class="text-center">
            <h3>Your Orders</h3>
        </div>
    </div>
    <div class="container">
        <table class="table border border-dark">
            <thead>
                <tr>
                    <th class="col">Order_id</th>
                    <th class="col">Total_order_amount</th>
                    <th class="col">Payment_mode</th>
                    <th class="col">Txn_id</th>
                    <th class="col">Order_status</th>
                    <th class="col">Order_date</th>
                    <th colspan="2" class="col">Action</th>
                </tr>
            </thead>
            <tbody>
                <?php
                $cus_id = $_SESSION['customer']['cus_id'];
                $select_query = mysqli_query($conn, "SELECT * FROM `orders` WHERE cus_id=$cus_id ORDER BY `order_date` DESC");
                if (mysqli_num_rows($select_query) > 0) {
                    while ($data = mysqli_fetch_array($select_query)) {
                        ?>
                        <tr>
                            <td><?php echo $data['order_id'] ?></td>
                            <td><?php echo $data['total_order_amount'] ?></td>
                            <td><?php echo $data['payment_mode'] ?></td>
                            <td><?php echo $data['txn_id'] ?></td>
                            <td><?php echo $data['order_status'] ?></td>
                            <td><?php echo $data['order_date'] ?></td>
                            <td><button class="btn btn-danger btn-sm">cancel</button></td>
                            <td><button type="submit" class="btn btn-primary btn-sm order-view" data-id="<?php echo $data['order_id']; ?>">view</button></td>
                            <!-- <form action="view-order-product.php" method="post">
                                <input type="hidden" name="order_id" value="<?php // echo $data['order_id']; ?>">
                                <td><button type="submit" class="btn btn-primary btn-sm" data-bs-toggle="modal" data-bs-target="#exampleModal">view order</button></td>
                            </form> -->
                            
                        </tr>
                        <?php
                    }
                }
                ?>
            </tbody>
        </table>
    </div>

    <!-- Order view modal start -->
     <!-- Modal -->
<div class="modal modal-lg fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">Order Details</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body" id="modal-body">
        
      </div>
    </div>
  </div>
</div>
     <!-- Order view modal end -->

</section>

<script>
        $(document).on('click', '.order-view', function () {
            const order_id = $(this).data('id');
            console.log(order_id);
            $.ajax({
                url: 'view-order-product.php',
                type: 'POST',
                data: { order_id: order_id },
                success: function (response) {
                    // $('#modal-body').html(response);
                    // $('#exampleModal').modal('show');
                    if(typeof response === "string"){
                        response = JSON.parse(response);
                    }
                    if (Array.isArray(response)&& response.length > 0) {
                        let total_price = 0;
                        let total_quantity = 0;
                        var output = "<table class='table'>";
                        output += "<thead><tr><th>Product</th><th>Title</th><th>Price</th><th>Quantity</th></tr></thead><tbody>";
                        response.forEach(function (product){
                            total_price = total_price+(parseInt(product.product_price)*parseInt(product.quantity));
                            total_quantity = total_quantity+parseInt(product.quantity);
                            output+="<tr><td><img src='http://localhost/jphp18/Project/admin/"+product.product_image+"' height='70px' width='100px'></td><td>"+product.product_name+"</td><td>"+product.product_price+"</td><td>"+product.quantity+"</td></tr>";
                        });
                        output += "<tr><td></td><td></td><td>"+total_price+"</td><td>"+total_quantity+"</td></tr>";
                        output+= "</tbody></table>";
                        $("#modal-body").html(output);
                        // $("#exampleModal").modal("show");
                    }
                    $("#exampleModal").modal("show");
                    console.log(response);
                },
                error: function () {
                    alert("error fetching data from database.");
                }
            });
        });
    </script>
<?php
include('./layout/footer.php');
?>