document.addEventListener('DOMContentLoaded', function() {
    const headerBar = document.querySelector('.header__bar');
    const headerMenu = document.querySelector('.header__menu');

    headerBar.addEventListener('click', function() {
        headerMenu.classList.toggle('active');
    });
});