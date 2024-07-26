import React, { useState, useEffect } from 'react';
import axios from 'axios';

const App = () => {
    const [products, setProducts] = useState([]);
    const [name, setName] = useState('');
    const [description, setDescription] = useState('');
    const [price, setPrice] = useState('');

    useEffect(() => {
        fetchProducts(); // Fetch products on component mount
    }, []);

    const fetchProducts = async () => {
        try {
            const response = await axios.get('/backend/product.php');
            setProducts(response.data); // Set fetched products to state
        } catch (error) {
            console.error('Error fetching products:', error);
        }
    };

    const addProduct = async () => {
        try {
            await axios.post('/backend/add_product.php', { name, description, price });
            fetchProducts(); // Refresh product list
            setName(''); // Clear form inputs
            setDescription('');
            setPrice('');
        } catch (error) {
            console.error('Error adding product:', error);
        }
    };

    const deleteProduct = async (id) => {
        try {
            await axios.get(`/backend/delete_product.php?id=${id}`);
            fetchProducts(); // Refresh product list after deletion
        } catch (error) {
            console.error('Error deleting product:', error);
        }
    };

    return (
        <div className="container">
            <h1>Sklep Ogrodniczy</h1>
            <form onSubmit={e => { e.preventDefault(); addProduct(); }}>
                <input
                    type="text"
                    value={name}
                    onChange={e => setName(e.target.value)}
                    placeholder="Nazwa"
                    required
                />
                <input
                    type="text"
                    value={description}
                    onChange={e => setDescription(e.target.value)}
                    placeholder="Opis"
                    required
                />
                <input
                    type="number"
                    value={price}
                    onChange={e => setPrice(e.target.value)}
                    placeholder="Cena"
                    required
                />
                <button type="submit">Dodaj Produkt</button>
            </form>
            <ul>
                {products.map(product => (
                    <li key={product.id}>
                        {product.name} - {product.description} - {product.price} PLN
                        <button onClick={() => deleteProduct(product.id)}>Usuń</button>
                    </li>
                ))}
            </ul>
        </div>
    );
};

export default App;


