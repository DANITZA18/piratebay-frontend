$(document).ready(function () {
    $('#btnSalir').click(cierraSesion);
});

function cierraSesion(e)
{
    e.preventDefault();
    localStorage.removeItem('piratebay_token');
    localStorage.removeItem('piratebay_refresh');
    location.href = 'index.html';
}