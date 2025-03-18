<?php
include("./project-config.php");
if ($_SERVER['REQUEST_METHOD'] == "POST"){
    $order_id = mysqli_real_escape_string($conn,$_POST["order_id"]);
    $select_query = mysqli_query($conn, "SELECT * FROM `order_details` WHERE order_id='$order_id'");
    if (mysqli_num_rows($select_query)>0) {
        while($product = mysqli_fetch_array($select_query)){
            $quantity = $product['quantity'];
            $product_id = $product['product_id'];
            if (!empty($product_id)) {
                $select_product = mysqli_query($conn, "SELECT * FROM `product` WHERE product_id=$product_id");
                if (mysqli_num_rows($select_product)>0) {
                    $data = mysqli_fetch_assoc($select_product);
                    $data['quantity']=$quantity;
                    $row[] = $data;
                }
            }
        }
        echo json_encode($row);
    }
}
?>