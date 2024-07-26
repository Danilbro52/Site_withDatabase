<?php
// Set the response content type to JSON
header("Content-Type: application/json; charset=UTF-8");

// Enable error reporting
error_reporting(E_ALL);
ini_set('display_errors', 1);

// Include the database connection file
require 'db.php';

// Check if a product ID was provided in the GET request
if (!isset($_GET['id'])) {
    echo json_encode(["error" => "No product ID provided"]);
    exit;
}

// Retrieve the product ID from the GET request and sanitize it
$productId = intval($_GET['id']);

// SQL query to retrieve product details along with category name
$sql = "SELECT p.*, c.category_name 
        FROM products p 
        LEFT JOIN categories c ON p.category_id = c.category_id 
        WHERE product_id = $productId";
$result = $conn->query($sql);

// Check if the product was found
if ($result->num_rows > 0) {
    $row = $result->fetch_assoc();
    
    // Ensure that 'details' field is not null
    $row['details'] = $row['details'] ?? "No product details provided.";
    
    echo json_encode($row);
} else {
    // Return error message if the product was not found
    echo json_encode(["error" => "Product not found"]);
}

// Close the database connection
$conn->close();
?>











