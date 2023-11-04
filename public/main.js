// Cart functionality
var cartItems = [];
var cartCounter = document.getElementById('cartCounter');
var cartModal = document.getElementById('cartModal');
var closeBtn = document.getElementsByClassName('close')[0];
var checkoutBtn = document.getElementById('checkoutBtn');
var flash = document.createElement('div');
flash.classList.add('flash');

function addToCart() {
    var product = this.parentNode;
    var productTitle = product.querySelector('h3').textContent;
    var productPrice = product.querySelector('p').textContent;

    var item = {
        title: productTitle,
        price: productPrice
    };

    cartItems.push(item);
    updateCartCounter();
    showFlashMessage("Item added to cart");
}

function updateCartCounter() {
    cartCounter.textContent = cartItems.length;
}

function showCartModal() {
    cartModal.style.display = 'block';
    displayCartItems();
}

function closeCartModal() {
    cartModal.style.display = 'none';
}

function displayCartItems() {
    var cartItemsList = document.getElementById('cartItems');
    cartItemsList.innerHTML = '';

    for (var i = 0; i < cartItems.length; i++) {
        var li = document.createElement('li');
        li.textContent = cartItems[i].title + ' - ' + cartItems[i].price;
        cartItemsList.appendChild(li);
    }
}

function checkout() {
    // Add your checkout logic here
    showFlashMessage("Checkout functionality coming soon!");
}

function showFlashMessage(message) {
    flash.textContent = message;
    document.body.appendChild(flash);

    setTimeout(function() {
        document.body.removeChild(flash);
    }, 1000);
}

for (var i = 0; i < document.getElementsByClassName('add-to-cart').length; i++) {
    document.getElementsByClassName('add-to-cart')[i].addEventListener('click', addToCart);
}

cartCounter.addEventListener('click', showCartModal);
closeBtn.addEventListener('click', closeCartModal);
checkoutBtn.addEventListener('click', checkout);

function addToCart() {
// ... Your existing addToCart function

// Show the "Back to Top" arrow
var backToTopArrow = document.querySelector('.back-to-top');
backToTopArrow.style.display = 'block';
}

function handleScroll() {
// Show or hide the "Back to Top" arrow based on the scroll position
var backToTopArrow = document.querySelector('.back-to-top');
if (window.pageYOffset > 300) {
backToTopArrow.style.display = 'block';
} else {
backToTopArrow.style.display = 'none';
}
}

// Listen for scroll events to handle the "Back to Top" arrow visibility
window.addEventListener('scroll', handleScroll);

// ... Your existing code
// Cart functionality
var cartItems = [];
var cartCounter = document.getElementById('cartCounter');
var cartModal = document.getElementById('cartModal');
var closeBtn = document.getElementsByClassName('close')[0];
var checkoutBtn = document.getElementById('checkoutBtn');
var flash = document.createElement('div');
flash.classList.add('flash');

function addToCart() {
var product = this.parentNode;
var productTitle = product.querySelector('h3').textContent;
var productPrice = product.querySelector('p').textContent;

var item = {
title: productTitle,
price: productPrice
};

cartItems.push(item);
updateCartCounter();
showCartModal();
showFlashMessage("Item added to cart");
}

function updateCartCounter() {
cartCounter.textContent = cartItems.length;
}

function showCartModal() {
cartModal.style.display = 'block';
displayCartItems();
}

function closeCartModal() {
cartModal.style.display = 'none';
}

function displayCartItems() {
var cartItemsList = document.getElementById('cartItems');
cartItemsList.innerHTML = '';

for (var i = 0; i < cartItems.length; i++) {
var li = document.createElement('li');
li.textContent = cartItems[i].title + ' - ' + cartItems[i].price;
cartItemsList.appendChild(li);
}
}

function checkout() {
// Add your checkout logic here
showFlashMessage("Checkout functionality coming soon!");
}

function showFlashMessage(message) {
flash.textContent = message;
document.body.appendChild(flash);

setTimeout(function () {
document.body.removeChild(flash);
}, 1000);
}

for (var i = 0; i < document.getElementsByClassName('add-to-cart').length; i++) {
document.getElementsByClassName('add-to-cart')[i].addEventListener('click', addToCart);
}

cartCounter.addEventListener('click', showCartModal);
closeBtn.addEventListener('click', closeCartModal);
checkoutBtn.addEventListener('click', checkout);

// Handle scroll events to show or hide the "Back to Top" arrow
function handleScroll() {
var backToTopArrow = document.querySelector('.back-to-top');
if (window.pageYOffset > 300) {
backToTopArrow.style.display = 'block';
} else {
backToTopArrow.style.display = 'none';
}
}

window.addEventListener('scroll', handleScroll);

// Scroll to the top of the page when the "Back to Top" arrow is clicked
document.querySelector('.back-to-top').addEventListener('click', function (event) {
event.preventDefault();
window.scrollTo({ top: 0, behavior: 'smooth' });
});
// Existing JavaScript code (update the displayCartItems function and add a new function)
function displayCartItems() {
var cartItemsList = document.getElementById('cartItems');
cartItemsList.innerHTML = '';

for (var i = 0; i < cartItems.length; i++) {
var li = document.createElement('li');
var productInfo = document.createElement('span');
var cancelButton = document.createElement('button');

productInfo.textContent = cartItems[i].title + ' - ' + cartItems[i].price;
cancelButton.textContent = 'Cancel';
cancelButton.classList.add('cancel-btn');
cancelButton.dataset.index = i;

li.appendChild(productInfo);
li.appendChild(cancelButton);
cartItemsList.appendChild(li);
}

// Attach event listener to the "Cancel" buttons
var cancelButtons = document.querySelectorAll('.cancel-btn');
for (var j = 0; j < cancelButtons.length; j++) {
cancelButtons[j].addEventListener('click', removeItemFromCart);
}
}

function removeItemFromCart() {
var indexToRemove = this.dataset.index;
cartItems.splice(indexToRemove, 1);
updateCartCounter();
displayCartItems();
}

// Existing JavaScript code (unchanged)
// Cart functionality
// ...

// Existing JavaScript code (unchanged)
// ...

// Handle scroll events to show or hide the "Back to Top" arrow
// ...

// Scroll to the top of the page when the "Back to Top" arrow is clicked
// ...
// Existing JavaScript code...

// Function to add a new product section

// Existing JavaScript code...

// Function to add a new product section
function addProductSection() {
var productSection = document.createElement('section');
productSection.classList.add('product');

var productForm = `
<div>
<label for="productName">Product Name:</label>
<input type="text" id="productName">
</div>
<div>
<label for="productPrice">Product Price:</label>
<input type="text" id="productPrice">
</div>
<div>
<label for="productImage">Product Image URL:</label>
<input type="text" id="productImage">
</div>
<button class="add-to-cart">Add to Cart</button>
`;

productSection.innerHTML = productForm;
document.getElementById('products').appendChild(productSection);

var addToCartBtn = productSection.querySelector('.add-to-cart');
addToCartBtn.addEventListener('click', addToCart);
}

// Event listener for the "Add Product" button
document.getElementById('addProductBtn').addEventListener('click', addProductSection);