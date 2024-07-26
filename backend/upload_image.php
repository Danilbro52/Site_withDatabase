<?php
// Include the database connection file
require 'db.php';

// Check if the form has been submitted via POST method
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Check if the file and product ID are set in the POST request
    if (isset($_FILES['file']) && isset($_POST['product_id'])) {
        // Retrieve the product ID and sanitize it
        $productId = intval($_POST['product_id']);
        
        // Get the file name of the uploaded image
        $imageName = basename($_FILES['file']['name']);
        
        // Set the target directory for image uploads
        $targetDir = "../frontend/public/images/";
        $targetFile = $targetDir . $imageName;

        // Check if the uploaded file is an actual image
        $check = getimagesize($_FILES['file']['tmp_name']);
        if ($check === false) {
            echo json_encode(["error" => "File is not an image."]);
            exit;
        }

        // Check if the file already exists
        if (file_exists($targetFile)) {
            echo json_encode(["error" => "File already exists."]);
            exit;
        }

        // Check file size (max 500KB)
        if ($_FILES['file']['size'] > 500000) {
            echo json_encode(["error" => "File is too large."]);
            exit;
        }

        // Allow certain file formats
        $imageFileType = strtolower(pathinfo($targetFile, PATHINFO_EXTENSION));
        if ($imageFileType != "jpg" && $imageFileType != "png" && $imageFileType != "jpeg" && $imageFileType != "gif") {
            echo json_encode(["error" => "Only JPG, JPEG, PNG & GIF files are allowed."]);
            exit;
        }

        // Try to upload the file
        if (move_uploaded_file($_FILES['file']['tmp_name'], $targetFile)) {
            // SQL query to update the product with the new image
            $sql = "UPDATE products SET image = ? WHERE product_id = ?";
            $stmt = $conn->prepare($sql);
            $stmt->bind_param('si', $imageName, $productId);
            
            // Execute the query and check if it was successful
            if ($stmt->execute()) {
                echo json_encode(["success" => "The file " . htmlspecialchars($imageName) . " has been uploaded."]);
            } else {
                echo json_encode(["error" => "Error updating the database."]);
            }
        } else {
            echo json_encode(["error" => "Error uploading the file."]);
        }
    } else {
        echo json_encode(["error" => "Invalid request."]);
    }
}
?>

