document.addEventListener("DOMContentLoaded", function() {
    const cart = JSON.parse(localStorage.getItem('cart')) || [];
    const cartItemsDiv = document.getElementById('cart-items');
    const totalPriceDiv = document.getElementById('total-price');

    // Update the cart display
    function updateCart() {
        cartItemsDiv.innerHTML = '';
        let totalPrice = 0;
        cart.forEach((item, index) => {
            const itemTotal = item.price * item.quantity;
            totalPrice += itemTotal;
            cartItemsDiv.innerHTML += `
                <div class="cart-item">
                    <h3>${item.name}</h3>
                    <img src="images/${item.image}" alt="${item.name}">
                    <p>${item.description}</p>
                    <p><strong>${item.price} PLN</strong></p>
                    <p><strong>Ilość:</strong> 
                        <input type="number" value="${item.quantity}" min="1" onchange="updateQuantity(${index}, this.value)">
                    </p>
                    <p><strong>Wartość:</strong> ${itemTotal.toFixed(2)} PLN</p>
                    <button onclick="removeFromCart(${index})">Usuń</button>
                </div>
            `;
        });
        totalPriceDiv.innerHTML = `<h2>Łączna cena: ${totalPrice.toFixed(2)} PLN</h2>`;
    }

    // Update the quantity of a product in the cart
    window.updateQuantity = function(index, quantity) {
        cart[index].quantity = parseInt(quantity);
        localStorage.setItem('cart', JSON.stringify(cart));
        updateCart();
    }

    // Remove a product from the cart
    window.removeFromCart = function(index) {
        cart.splice(index, 1);
        localStorage.setItem('cart', JSON.stringify(cart));
        updateCart();
    }

    updateCart();
});











