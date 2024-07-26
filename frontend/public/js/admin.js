// Event listener for the product addition form submission
document.getElementById('add-product-form').addEventListener('submit', function(e) {
    e.preventDefault(); // Prevent default form submission behavior
    let formData = new FormData(this); // Create a FormData object with the form data

    // Send the form data to the server using fetch
    fetch('http://localhost/sklep-ogrodniczy/backend/add_product.php', {
        method: 'POST',
        body: formData
    })
    .then(response => response.text()) // Parse the response as text
    .then(data => {
        document.getElementById('message').innerText = data; // Display the server response
        this.reset(); // Reset the form
    })
    .catch(error => console.error('Error:', error)); // Log any errors
});










