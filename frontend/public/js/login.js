document.getElementById('login-form').addEventListener('submit', function(e) {
    e.preventDefault(); // Prevent the form from submitting the traditional way
    let formData = new FormData(this); // Create a FormData object from the form

    fetch('http://localhost/sklep-ogrodniczy/backend/login.php', {
        method: 'POST',
        body: formData
    })
    .then(response => response.json())
    .then(data => {
        if (data.status === 'success') {
            sessionStorage.setItem('username', document.getElementById('username').value);
            window.location.href = 'index.html'; // Redirect to home page on success
        } else {
            document.getElementById('message').innerText = 'Niepoprawne hasło'; // Show error message
        }
    })
    .catch(error => console.error('Error:', error));
});


