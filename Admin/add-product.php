<?php
include("../project-config.php");
include("./layouts/header.php");
?>
        <div id="layoutSidenav">
        <?php include("./layouts/sidebar.php"); ?>
            <div id="layoutSidenav_content">
                <main>
                    <div class="container mt-3">
                        <h3>Add New Product</h3>
                    </div>
                    <div class="container">
                        <form method="post" enctype="multipart/form-data">
                            <div class="col-8 mx-auto">
                                <div class="mb-3">
                                    <div class="mb-3">
                                        <label class="form-label">Select Category</label>
                                        <select
                                            class="form-select form-select"
                                            name="category"
                                        >
                                        <?php
                                        $select_query=mysqli_query($conn, "SELECT * FROM `category` WHERE 1");
                                        if (!mysqli_num_rows($select_query)>0) {
                                            echo "no category found";
                                        }
                                        while ($category=mysqli_fetch_assoc($select_query)) {
                                            echo "<option value='{$category['cat_id']}'>{$category['cat_name']}</option>";
                                        }
                                        ?>
                                        </select>
                                    </div>
                                    <div class="mb-3">
                                        <label class="form-label">Product Name</label>
                                        <input type="text" name="p_name" class="form-control">
                                    </div>
                                    <div class="mb-3">
                                        <label class="form-label">Product Price</label>
                                        <input type="number" name="p_price" class="form-control">
                                    </div>
                                    <div class="mb-3">
                                        <label class="form-label">Product Image</label>
                                        <input type="file" name="p_image" class="form-control">
                                    </div>
                                    <div class="mb-3">
                                        <label class="form-label">Product Description</label>
                                        <textarea name="p_desc" class="form-control"></textarea>
                                    </div>
                                </div>
                                <div class="mb-3">
                                    <div class="d-grid gap-2">
                                        <button
                                            type="submit"
                                            class="btn btn-primary"
                                        >
                                            Add this product
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </main>
            </div>
        </div>    
<?php
include("./layouts/footer.php");
?>
<?php
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $cat_id = mysqli_real_escape_string($conn, $_POST['category']);
    $p_name = mysqli_real_escape_string($conn, $_POST['p_name']);
    $p_price = mysqli_real_escape_string($conn, $_POST['p_price']);
    $p_desc = mysqli_real_escape_string($conn, $_POST['p_desc']);
    $p_image = $_FILES['p_image']['name'];
    $temp_p_image = $_FILES['p_image']['tmp_name'];
    $date=date("d-m-Y");
    $dir_name="uploads/".$date."/";
    if (!is_dir($dir_name)) {
        mkdir($dir_name, 0777, true);
    }
    $file_path=$dir_name.$p_image;
    if (move_uploaded_file($temp_p_image, $file_path)) {
        $insert_query=mysqli_query($conn, "INSERT INTO `product`(`cat_id`, `product_name`, `product_price`, `product_desc`, `product_image`) VALUES ('$cat_id','$p_name','$p_price','$p_desc','$file_path')");
        if ($insert_query) {
            echo "product inserted successfully !";
        }
    }

}
?>