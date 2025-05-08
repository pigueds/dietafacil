document.addEventListener('DOMContentLoaded', () => {
    const enterButton = document.getElementById('enter-button');
    const mainContent = document.getElementById('main-content');
    const spinnerContainer = document.getElementById('spinner-container');
    const redirectUrl = 'https://dietafacil.fit';

    if (enterButton && mainContent && spinnerContainer) {
        enterButton.addEventListener('click', () => {
            // Hide main content
            mainContent.style.display = 'none';
            
            // Show spinner
            spinnerContainer.style.display = 'flex';

            // Redirect to the main application
            window.location.href = redirectUrl;
        });
    } else {
        console.error('Essential elements not found for script.js');
    }
});
