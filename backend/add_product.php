<?php
// Include the database connection file
include 'db.php';

// Check if the form has been submitted via POST method
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    // Retrieve and sanitize form input values
    $name = $_POST['name'];
    $description = $_POST['description'];
    $details = $_POST['details'];
    $price = $_POST['price'];
    $stock_quantity = $_POST['stock_quantity'];
    $category_id = $_POST['category_id'];
    $image = $_FILES['image']['name'];

    // Set the target directory for image uploads
    $target_dir = "../frontend/public/images/";
    $target_file = $target_dir . basename($image);

    // Move the uploaded file to the target directory
    if (move_uploaded_file($_FILES["image"]["tmp_name"], $target_file)) {
        // SQL query to insert a new product into the database
        $sql = "INSERT INTO products (name, description, details, price, stock_quantity, category_id, image) VALUES ('$name', '$description', '$details', '$price', '$stock_quantity', '$category_id', '$image')";

        // Execute the query and check if it was successful
        if ($conn->query($sql) === TRUE) {
            echo "New product added successfully.";
        } else {
            // Display an error message if the query failed
            echo "Error: " . $sql . "<br>" . $conn->error;
        }
    } else {
        // Display an error message if the file upload failed
        echo "Sorry, there was an error uploading your file.";
    }

    // Close the database connection
    $conn->close();
}
?>











