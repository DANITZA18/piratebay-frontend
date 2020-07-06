$(document).ready(function () {
    cargaProductos(); 
    $('#nom_almacen').text(localStorage.infoAlmacen);

    // $('#btnRecargaDatos').click(function(){
    //     cargaProductos();
    // });

    $('#texto').keyup(function(){
        cargaProductos();
    });

    $('#contenedor').on('click','tr',function(){
        let urlKardex = $(this).attr('data-url');
        localStorage.urlKardex = urlKardex;
        localStorage.idProd = $(this).attr('data-id')
        localStorage.codigoProd = $(this).attr('data-codigo')
        localStorage.nomProd = $(this).attr('data-nombre')
        localStorage.minimoProd = $(this).attr('data-minimo')
        localStorage.proveedor = $(this).attr('data-proveedor')
        localStorage.formatoProd = $(this).attr('data-formato')

        window.location.href = "kardex.html";
    });
});

function cargaProductos()
{
    $('#contenedor').html(`<tr><td colspan="6">Cargando...</td></tr>`);
    setTimeout(function(){
        $.ajax({
            headers:{'Authorization':'bearer '+localStorage.piratebay_token},
            type: "GET",
            url: localStorage.urlProductos+$('#texto').val(),
            contentType: 'application/json',
            success: function (response) {
                let vacio = `<tr><td colspan="5">SIN REGISTROS</td></tr>`;
                if(response.length > 0)
                {
                    let filas = ``;
                    $.each(response,function(i, item){
                        filas += `<tr data-id="${item.id}" 
                        data-url="${url_base}/api/v1/kardex?id=${item.id}" 
                        data-codigo="${item.product.product_code}"
                        data-nombre="${item.product.product_name}"
                        data-minimo="${item.m_stock}"
                        data-proveedor="${item.provider.provider_name}"
                        data-formato="${item.product.cat_product_type}" 
                        title="Ver Kardex" data-toggle="tooltip">
                            <td>${item.product.product_code}</td>
                            <td>${item.product.product_name}</td>
                            <td>${item.product.cat_product_type}</td>
                            <td>${item.creation_date}</td>
                            <td>${item.provider.provider_name}</td>
                            <td>${item.stock}</td></tr>`;
                    });
                    $('#contenedor').html(filas)
                    iniciaTooltip();
                }
                else{
                    $('#contenedor').html(vacio)
                }
            },
            error: function(){
                usarRefresh();
                cargaProductos();
            }
        });
    },500);
}

