<?php
// Include the database connection file
include 'db.php';

// Start session
session_start();

// Check if the form has been submitted via POST method
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    // Retrieve username and password from POST request
    $username = $_POST['username'];
    $password = $_POST['password'];

    // SQL query to check user credentials
    $sql = "SELECT * FROM users WHERE username = '$username' AND password = '$password'";
    $result = $conn->query($sql);

    // Check if a matching user was found
    if ($result->num_rows > 0) {
        // Set session variable for the username
        $_SESSION['username'] = $username;
        echo json_encode(['status' => 'success']);
    } else {
        // Return error message if credentials are invalid
        echo json_encode(['status' => 'error', 'message' => 'Invalid credentials']);
    }

    // Close the database connection
    $conn->close();
}
?>


