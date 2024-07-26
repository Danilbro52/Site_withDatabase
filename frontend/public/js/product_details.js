document.addEventListener("DOMContentLoaded", function() {
    const urlParams = new URLSearchParams(window.location.search);
    const productId = urlParams.get('id'); // Get product ID from URL

    fetch(`http://localhost/sklep-ogrodniczy/backend/product_details.php?id=${productId}`)
        .then(response => response.json())
        .then(data => {
            let detailsDiv = document.getElementById('product-details');
            if (data.error) {
                detailsDiv.innerHTML = `<p>${data.error}</p>`; // Show error message if any
            } else {
                let stockText = data.stock_quantity && data.stock_quantity > 0 ? `${data.stock_quantity} szt.` : "Brak towaru w magazynie";
                detailsDiv.innerHTML = `
                    <h2>${data.name}</h2>
                    <img src="images/${data.image}" alt="${data.name}">
                    <p><strong>${data.price} PLN</strong></p>
                    <p><strong>Na stanie:</strong> ${stockText}</p>
                    <p><strong>Kategoria:</strong> ${data.category_name || "Brak kategorii"}</p>
                    <p>${data.details}</p>
                    <button onclick="addToCart(${data.product_id})">Kup teraz</button>
                    <button onclick="window.history.back()">Powrót</button>
                    <button onclick="window.location.href='cart.html'">Przejdź do koszyka</button>
                `;
            }
        })
        .catch(error => console.error('Error fetching product details:', error));
});

function addToCart(id) {
    fetch(`http://localhost/sklep-ogrodniczy/backend/product_details.php?id=${id}`)
        .then(response => response.json())
        .then(data => {
            let cart = JSON.parse(localStorage.getItem('cart')) || [];
            let productInCart = cart.find(item => item.product_id === id);
            if (productInCart) {
                productInCart.quantity += 1; // Increase quantity if product is already in cart
            } else {
                data.quantity = 1;
                cart.push(data); // Add new product to cart
            }
            localStorage.setItem('cart', JSON.stringify(cart));
            alert(`Dodano do koszyka: ${data.name}`);
        })
        .catch(error => console.error('Error adding to cart:', error));
}














