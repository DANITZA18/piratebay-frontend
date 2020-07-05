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
function cargaAlmacenes()
{
    $.ajax({
        headers:{'Authorization':'bearer '+localStorage.piratebay_token},
        type: "GET",
        url: url_base+"/api/v1/warehouse",
        contentType: 'application/json',
        success: function (response) {
            let vacio = `SIN REGISTROS`;
            if(response.length > 0)
            {
                let almacen = ``;
                $.each(response,function(i, item){
                    almacen += `
                            <div class="col-md-4 contenedor_almacen">
                                <div class="almacen" 
                                    data-url="${url_base}/api/v1/products/warehouse?id=${item.warehouse_id}&texto=" 
                                    data-id="${item.warehouse_id}" 
                                    data-nom="${item.warehouse_name}"
                                    data-address="${item.warehouse_address}"
                                    >
                                    <div class="imagen"><i class="fa fa-building fa-8x"></i></div>
                                    <div class="nombre">${item.warehouse_name}</div>
                                </div>
                            </div>
                            `;
                });
                $('#contenedor').html(almacen)
            }
            else{
                $('#contenedor').html(vacio)
            }
        },
        error: function(){
            usarRefresh();
            cargaUsuarios();
        }
    });
}
