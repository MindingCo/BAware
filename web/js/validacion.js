$(document).ready(function() 
{
    $("#campoNickName").keypress(
        function inputNickName(event)
        {
            var teclado= (document.all) ? event.keyCode : event.which;
            if(teclado==8)
                return true;
            var patron = /[Á-ÿ\w\d\-\_\.]/;
            var tec    = String.fromCharCode(teclado);
            var teclas = $("#campoNickName").val();

            var ultimaletra = teclas.charAt(teclas.length-1);
            if ((ultimaletra == '.' && ultimaletra == tec) || (ultimaletra == '-' && ultimaletra == tec) || (ultimaletra == '_' && ultimaletra == tec))
            {
                alert("No se pueden poner mas de 1 un caracter continuo del mismo tipo");
                return false;
            }
            return patron.test(tec);
        });
    $("#campoPassword").keypress(
        function inputPassword(event)
        {
            var teclado= (document.all) ? event.keyCode : event.which;
            if(teclado==8)
                return true;
            var patron = /[Á-ÿ\w\d\+\-\_\.]/;
            var tec    = String.fromCharCode(teclado);
            return patron.test(tec);
        });
    $("#campoCPassword").keypress(
        function inputPassword(event)
        {
            
            var teclado= (document.all) ? event.keyCode : event.which;
            if(teclado==8)
                return true;
            var patron = /[Á-ÿ\w\d\+\-\_\.]/;
            var tec    = String.fromCharCode(teclado);
            return patron.test(tec);
        });
    $(".campoPassword").keypress(
        function inputPassword(event)
        {
            var teclado= (document.all) ? event.keyCode : event.which;
            if(teclado==8)
                return true;
            var patron = /[Á-ÿ\w\d\+\-\_\.]/;
            var tec    = String.fromCharCode(teclado);
            return patron.test(tec);
        });
    $("#campoEmail").keypress(
        function inputEmail(event)
        {
            var teclado= (document.all) ? event.keyCode : event.which;
            if(teclado==8)
                return true;
            var patron = /[Á-ÿ\w\d\+\-\_\.\@]/;
            var tec    = String.fromCharCode(teclado);
            return patron.test(tec);
        });
    $("#campoCEmail").keypress(
        function inputEmail(event)
        {
            var teclado= (document.all) ? event.keyCode : event.which;
            if(teclado==8)
                return true;
            var patron = /[Á-ÿ\w\d\+\-\_\.\@]/;
            var tec    = String.fromCharCode(teclado);
            return patron.test(tec);
        });
    
    $("#send-sign").click(
        function confirmarRegistro()
        {
            if ($('#campoCPassword').val() != "")
            {
                if ($('#campoPassword').val() != $('#campoCPassword').val())
                    $("#errorPassword").text("Las contraseñas no coinciden");
                else
                    $("#errorPassword").text("");
            }
            if ($('#campoCEmail').val() != "")
            {
                if ($('#campoEmail').val() != $('#campoCEmail').val())
                    $("#errorEmail").text("Los correos no coinciden");
                else
                    $("#errorEmail").text("");
            }
            if ($("#errorPassword").text() == "" && $("#errorEmail").text() == "")
            {
                $("#send-sign").prop("disabled", false);
                return true;
            }
            else
            {
                $("#send-sign").prop("disabled", true);
                return false;
            }
        });

    $(".input-signin").keyup(
        function confirmarRegistro()
        {
            if ($('#campoCPassword').val() != "")
            {
                if ($('#campoPassword').val() != $('#campoCPassword').val())
                    $("#errorPassword").text("Las contraseñas no coinciden");
                else
                    $("#errorPassword").text("");
            }
            if ($('#campoCEmail').val() != "")
            {
                if ($('#campoEmail').val() != $('#campoCEmail').val())
                    $("#errorEmail").text("Los correos no coinciden");
                else
                    $("#errorEmail").text("");
            }
            if ($("#errorPassword").text() == "" && $("#errorEmail").text() == "")
            {
                $("#send-sign").prop("disabled", false);
                return true;
            }
            else
            {
                $("#send-sign").prop("disabled", true);
                return false;
            }
        });
    $(".input-update").keyup(
        function confirmarModificacion() 
        {
            if (($("#old-pass").val() == "" && $("#new-pass") == "" && $("#new-cpass") == "") &&  ($("#new-ema") == "" && $("#new-cema") == "")) 
            {

            }
            if ($('#new-cpass').val() != "")
            {
                if ($('#new-pass').val() != $('#new-cpass').val())
                    $("#errorPassword").text("La contraseña nueva no coinciden");
                else
                    $("#errorPassword").text("");
            }
            if ($('#new-cema').val() != "")
            {
                if ($('#new-ema').val() != $('#new-cema').val())
                    $("#errorEmail").text("Los correos no coinciden");
                else
                    $("#errorEmail").text("");
            }
            if ($("#errorPassword").text() == "" && $("#errorEmail").text() == "")
            {
                $("#submit-update").prop("disabled", false);
                    return true;
            }
            else
            {
                $("#submit-update").prop("disabled", true);
                    return false;
            }
        });
});