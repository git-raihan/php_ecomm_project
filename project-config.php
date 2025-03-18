<?php
$site_title="EG STORE";
// Customer Route Management
$cus_url="http://localhost/jphp18/Project/";

// Admin Route Management
$admin_url="http://localhost/jphp18/Project/admin/";
$admin_login_url="http://localhost/jphp18/Project/admin/auth/admin-login.php";
$admin_logout_url="http://localhost/jphp18/Project/admin/auth/admin-logout.php";
$admin_category_url="http://localhost/jphp18/Project/admin/add-category.php";

// Database configaration
$db_server = "localhost";
$db_username = "root";
$db_password = "";
$db_name = "ecomm";

$conn = mysqli_connect($db_server, $db_username, $db_password, $db_name);

if (!$conn) {
    echo "DB not connect ... ";
}
?>