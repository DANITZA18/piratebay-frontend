 $(document).ready(function () {
    cargaUsuarios(); 

    $('#btnRecargaDatos').click(function(){
        $('#contenedor').html(`<tr><td colspan="4">Cargando...</td></tr>`);
        cargaUsuarios();
    });

});

function cargaUsuarios()
{
    $.ajax({
        headers:{'Authorization':'bearer '+localStorage.piratebay_token},
        type: "GET",
        url: "http://localhost:8008/api/v1/user",
        contentType: 'application/json',
        success: function (response) {
            let vacio = `<tr><td colspan="4">SIN REGISTROS</td></tr>`;
            if(response.length > 0)
            {
                let filas = ``;
                $.each(response,function(i, item){
                    filas += `<tr><td>${item.username}</td><td>${item.email}</td><td>${item.phoneNumber}</td><td>${item.catUserStatus}</td></tr>`;
                    console.log(item);
                });
                $('#contenedor').html(filas)
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

