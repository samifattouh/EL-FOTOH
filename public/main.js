

let button = document.getElementById('login')

button.addEventListener('click', (e) => {
    let username = document.getElementById('username').value
    let password = document.getElementById('password').value
    console.log(username)
    console.log(password)
    e.preventDefault();
})
