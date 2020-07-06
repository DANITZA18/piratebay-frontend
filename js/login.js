$(document).ready(function () {
    $('#btnAcceder').click(iniciarSesion);
    $('#username').keypress(function(e){
        var code = (e.keyCode ? e.keyCode : e.which);
        if(code==13){
            iniciarSesion();
        }
 
    });
    $('#password').keypress(function(e){
        var code = (e.keyCode ? e.keyCode : e.which);
        if(code==13){
            iniciarSesion();
        }
    });

});

// FUNCION PARA INCIAR SESIÓN
function iniciarSesion()
{
    $('#mensaje').addClass('oculto');
    let username = $('#username').val().trim();
    let password = $('#password').val().trim();
    credentialsModel ={"username":username, "password":password};
    if(username != '' && password != '')
    {
        $.ajax({
            type: "POST",
            data: JSON.stringify(credentialsModel),
            url: url_base+"/api/v1/security/login",
            contentType: 'application/json',
            success: function (response) {
                // GUARDAR EL TOKEN Y REFRESH EN EL LOCALSTORAGE
                localStorage.piratebay_token =  response.authentication;
                localStorage.piratebay_refresh =  response.refresh;
                location.href = 'Home.html';
            },
            error:function(error){
                $('#mensaje').removeClass('oculto');
                $('#mensaje').text(error.responseJSON.message);
            }
        });
    }
    else{
        $('#mensaje').removeClass('oculto');
        $('#mensaje').addClass('error');
        $('#mensaje').text('Debes indicar un usuario y contraseña');
    }
}

function usarRefresh()
{
    $.ajax({
        type: "POST",
        data: JSON.stringify({'refreshToken':localStorage.piratebay_refresh}),
        url: url_base+"/api/v1/security/refresh",
        contentType: 'application/json',
        success: function (response) {
            localStorage.piratebay_token =  response.authentication;
            localStorage.piratebay_refresh =  response.refresh;
        },
        error: function(){
            localStorage.removeItem('piratebay_token');
            localStorage.removeItem('piratebay_refresh');
            location.href = 'index.html';
        }
    }); 
}