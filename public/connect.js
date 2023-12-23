const fetchData = async () => {
    try {
        const response = await fetch('/fetchData');
        if (response.ok) {
            const data = await response.json();
            document.getElementById('db').textContent = JSON.stringify(data[0])
            alert(JSON.stringify(data))
        } else {
            console.error('Error fetching data from the backend');
        }
    } catch (error) {
        console.error('Network error:', error);
    }
};

// Call the fetchData function when needed
//fetchData();


