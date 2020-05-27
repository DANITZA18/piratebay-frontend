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
            url: "http://localhost:8008/api/v1/security/login",
            contentType: 'application/json',
            success: function (response) {
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