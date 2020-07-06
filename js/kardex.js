var datos = null;

$(document).ready(function () {
    cargaKardex();

    cargaInformacion();
    $('#nom_almacen').text(localStorage.infoAlmacen);

    $('#btnAceptar').click(function(){
        registraIngreso();
    });
});

function cargaInformacion()
{
    $('#codigoProd').text(localStorage.codigoProd);
    $('#nomProd').text(localStorage.nomProd);
    $('#formatoProd').text(localStorage.formatoProd);
    $('#localizacion').text(localStorage.almacenDireccion);
    $('#proveedor').text(localStorage.proveedor);
    $('#minProd').text(localStorage.minimoProd);
}

function cargaKardex()
{
    $('#contenedor').html(`<tr><td colspan="11">Cargando...</td></tr>`);
    setTimeout(function(){
        $.ajax({
            headers:{'Authorization':'bearer '+localStorage.piratebay_token},
            type: "GET",
            url: localStorage.urlKardex,
            contentType: 'application/json',
            success: function (response) {
                let vacio = `<tr><td colspan="11">SIN REGISTROS</td></tr>`;
                if(response.length > 0)
                {
                    let filas = ``;
                    $.each(response,function(i, item){
                        if(item.income_q == 0)
                        {
                            filas += `<tr data-id="${item.id}">
                            <td>${item.kdate}</td>
                            <td>${item.concept}</td>
                            <td>${item.invoice}</td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td>${item.departure_uc}</td>
                            <td>${item.departure_q}</td>
                            <td>${item.departure_total}</td>
                            <td>${item.balance_q}</td>
                            <td>${item.balance_total}</td>
                            </tr>`;
                        }
                        else{
                            filas += `<tr data-id="${item.id}">
                                <td>${item.kdate}</td>
                                <td>${item.concept}</td>
                                <td>${item.invoice}</td>
                                <td>${item.income_uc}</td>
                                <td>${item.income_q}</td>
                                <td>${item.income_total}</td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td>${item.balance_q}</td>
                                <td>${item.balance_total}</td>
                            </tr>`;
                        }
                    });
                    $('#contenedor').html(filas);
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

function llena()
{
    let cantidad = $('#cantidad').val();
    let costo_unitario = $('#costo_unitario').val();
    let factura = $('#factura').val();
    let fecha = null;
    if(costo_unitario > 0 && costo_unitario != '' && cantidad > 0 && cantidad != '' && factura!='')
    {
        let date = new Date();
        let day = date.getDate()
        let month = date.getMonth() + 1
        let year = date.getFullYear()


        if(month < 10){
            fecha =`${year}-0${month}-${day}`
        }
        else{
            fecha = `${year}-${month}-${day}`
        }

        let total = parseInt(cantidad) * parseFloat(costo_unitario);

        // CALCULA BALANCE/SALDO
        let ultima_fila = $('#contenedor').children('tr').last();
        let cantidad_total = parseInt(ultima_fila.children('td').eq(9).text());
        let saldo_total = parseFloat(ultima_fila.children('td').eq(10).text());
        cantidad_total = cantidad_total + parseInt(cantidad);
        saldo_total = saldo_total + parseFloat(total);
        datos = {
            product_warehouse_id: localStorage.idProd,
            concept:'Compra',
            kdate:fecha,
            invoice: factura,
            income_q: cantidad,
            income_uc:costo_unitario,
            income_total:total,
            balance_q: cantidad_total,
            balance_total:saldo_total
        };
        return true;
    }
    return false;
}

function registraIngreso()
{
    if(llena())
    {
        $('#msj_error').removeClass('addClass');
        $.ajax({
            headers:{'Authorization':'bearer '+localStorage.piratebay_token},
            type: "POST",
            url: url_base+"/api/v1/kardex/ingreso",
            data: JSON.stringify(datos),
            contentType: 'application/json',
            success: function (response) {
                cargaKardex();
                $('#modal_ingreso').modal('hide');
            }
        });
    }
    else{
        $('#msj_error').removeClass('oculto');
    }
}