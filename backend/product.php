<?php
// Set the response content type to JSON
header("Content-Type: application/json");

// Include the database connection file
include 'db.php';

// SQL query to retrieve all products
$sql = "SELECT * FROM products";
$result = $conn->query($sql);

// Check if the query was successful
if (!$result) {
    die("Query failed: " . $conn->error);
}

// Create an array to store the products
$products = array();
while ($row = $result->fetch_assoc()) {
    $products[] = $row;
}

// Return the products as JSON
echo json_encode($products);

// Close the database connection
$conn->close();
?>



