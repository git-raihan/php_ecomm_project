<?php
include("../project-config.php");
include("./layouts/header.php");
?>
        <div id="layoutSidenav">
        <?php include("./layouts/sidebar.php"); ?>
            <div id="layoutSidenav_content">
                <main>
                    <div class="container mt-3">
                        <h3>Add Category</h3>
                    </div>
                    <div class="container">
                        <form method="post">
                            <div class="col-6 mx-auto">
                                <div class="mb-3">
                                    <label class="form-label">Category Name</label>
                                    <input type="text" name="category_name" class="form-control">
                                </div>
                                <div class="mb-3">
                                    <div class="d-grid gap-2">
                                        <button
                                            type="submit"
                                            class="btn btn-primary"
                                        >
                                            Add this category
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="container my-5">
                        <div class="">
                            <h3>Available Categories</h3>
                        </div>
                        
                        <div class="col-8 mx-auto">
                        <div
                            class="table-responsive"
                        >
                            <table
                                class="table"
                            >
                                <thead>
                                    <tr>
                                        <th scope="col">category_id</th>
                                        <th scope="col">category_name</th>
                                        <th scope="col">category_created_at</th>
                                        <th scope="col">cat_delete</th>
                                        <th scope="col">cat_update</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php
                                    $select_query=mysqli_query($conn, "SELECT * FROM `category` WHERE 1");
                                    if ($select_query) {
                                        while ($row = mysqli_fetch_assoc($select_query)) {
                                            ?>
                                                <tr class="">
                                                    <td scope="row"><?php echo $row['cat_id'];  ?></td>
                                                    <td><?php echo $row['cat_name'];  ?></td>
                                                    <td><?php echo $row['cat_created_at'];  ?></td>
                                                    <td><button class="btn btn-danger btn-sm">delete</button></td>
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
            </div>
        </div>    
<?php
include("./layouts/footer.php");
?>
<?php
if ($_SERVER['REQUEST_METHOD'] == "POST") {
$cat_name = mysqli_real_escape_string($conn, $_POST['category_name']);
$insert_query = mysqli_query($conn, "INSERT INTO `category`(`cat_name`) VALUES ('$cat_name')");
if ($insert_query) {
echo "Category created successfully !";
// header("location:$admin_category_url");
}
}
?>