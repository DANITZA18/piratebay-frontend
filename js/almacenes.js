$(document).ready(function () {
    cargaAlmacenes(); 

    $('#btnRecargaDatos').click(function(){
        $('#contenedor').html(`Cargando...`);
        cargaAlmacenes();
    });

    $('#contenedor').on('click','.contenedor_almacen .almacen',function(){
        let url = $(this).attr('data-url');
        localStorage.urlProductos = url;
        localStorage.infoAlmacen = $(this).attr('data-nom');
        localStorage.infoAlmacenId = $(this).attr('data-id');
        localStorage.almacenDireccion = $(this).attr('data-address');
        window.location.href = 'productos.html';
    });

});
