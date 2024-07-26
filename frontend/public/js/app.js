document.addEventListener("DOMContentLoaded", function() {
    console.log("DOM fully loaded and parsed");

    // Fetch the list of products from the server
    fetch('http://localhost/sklep-ogrodniczy/backend/product.php')
        .then(response => response.json())
        .then(data => {
            console.log("Fetched products:", data);
            let app = document.getElementById('app');
            app.innerHTML = '<h2 class="offer-title">Nasza Oferta!</h2>';
            let productList = document.createElement('div');
            productList.className = 'product-list';
            if (data.length === 0) {
                app.innerHTML += '<p>Brak produktów w sklepie.</p>';
            } else {
                data.forEach(product => {
                    let productItem = document.createElement('div');
                    productItem.className = 'product-item';
                    productItem.innerHTML = `
                        <h3>${product.name}</h3>
                        <img src="images/${product.image}" alt="${product.name}">
                        <p>${product.description}</p>
                        <p><strong>${product.price} PLN</strong></p>
                        <button onclick="viewDetails(${product.product_id})">Szczegóły</button>
                        <button class="add-to-cart-btn" data-id="${product.product_id}">Kup teraz</button>
                    `;
                    productList.appendChild(productItem);
                });
            }
            app.appendChild(productList);

            // Attach event listeners to "Kup teraz" buttons
            const addToCartButtons = document.querySelectorAll('.add-to-cart-btn');
            addToCartButtons.forEach(button => {
                button.addEventListener('click', function() {
                    addToCart(this.dataset.id);
                });
            });
        })
        .catch(error => console.error('Error fetching products:', error));
});

// Redirect to product details page
window.viewDetails = function(id) {
    window.location.href = `product_details.html?id=${id}`;
}

// Add a product to the cart
function addToCart(id) {
    fetch(`http://localhost/sklep-ogrodniczy/backend/product_details.php?id=${id}`)
        .then(response => response.json())
        .then(data => {
            let cart = JSON.parse(localStorage.getItem('cart')) || [];
            let productInCart = cart.find(item => item.product_id === id);
            if (productInCart) {
                productInCart.quantity += 1;
            } else {
                data.quantity = 1;
                cart.push(data);
            }
            localStorage.setItem('cart', JSON.stringify(cart));
            alert(`Dodano do koszyka: ${data.name}`);
        })
        .catch(error => console.error('Error adding to cart:', error));
}




















