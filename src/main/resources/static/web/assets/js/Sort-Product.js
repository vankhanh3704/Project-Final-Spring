document.addEventListener('DOMContentLoaded', function () {
    const filterSelect = document.getElementById('filter');

    function updateURLSortParameter(criteria) {
        const url = new URL(window.location.href);
        url.searchParams.set('sort', criteria);
        window.location.href = url.toString(); // Reload trang với sort
    }

    filterSelect.addEventListener('change', function () {
        updateURLSortParameter(this.value);
    });
});
