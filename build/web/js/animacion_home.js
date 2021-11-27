$(window).ready(function()
{
    $("#bottom-panel").click( function ()
    {
        $("#bottom-panel").animate({bottom: '-100vh'},"slow");
        $("#panel-lateral").animate({left:'-100vw'});
        $("#nomenclatura").animate({top:'0'},"slow");
    });
    $("#reportar").click( function ()
    {
        $("#reportar").animate({bottom: '-100vh'},"slow");
        $("#panel-lateral").animate({left:'-100vw'});
        $("#reporte").animate({top:'200'},"slow");
    });
    
    $("#nomenclatura").click( function ()
    {
        $("#bottom-panel").animate({bottom: '0'},"slow");
        $("#panel-lateral").animate({left:'0'});
        $("#nomenclatura").animate({top:'200vw'},"slow");
    });
    // parte de logueado
    $(".icon-user").click( function ()
    {
        $("#bottom-panel").animate({bottom: '-100vh'},"slow");;
        $("#panel-lateral").animate({left:'-100vw'});
        $("#panel").animate({left:'0'},"slow");
        $("#frame-panel").attr("src", "02_perfil.jsp");
    });
    $(".icon-notification").click( function ()
    {
        $("#bottom-panel").animate({bottom: '-100vh'},"slow");
        $("#panel-lateral").animate({left:'-100vw'});
        $("#panel").animate({left:'0'},"slow");
        $("#frame-panel").attr("src", "02_notificacion.jsp");
    });
    $(".icon-map").click( function ()
    {
        $("#bottom-panel").animate({bottom: '-100vh'},"slow");
        $("#panel-lateral").animate({left:'-100vw'});
        $("#panel").animate({left:'0'},"slow");
        $("#frame-panel").attr("src", "02_puntointeres.jsp");
    });
    $(".icon-configuration").click( function ()
    {
        $("#bottom-panel").animate({bottom: '-100vh'},"slow");
        $("#panel-lateral").animate({left:'-100vw'});
        $("#panel").animate({left:'0'},"slow");
        $("#frame-panel").attr("src", "02_configuracion.jsp");
    });
    
    $("#panel").click( function ()
    {
        $("#bottom-panel").animate({bottom: '0'},"slow");
        $("#panel-lateral").animate({left:'0'});
        $("#panel").animate({left:'-100vw'},"slow");
    });
    $("#reporte").click( function ()
    {
        $("#reportar").animate({bottom: '0'},"slow");
        $("#panel-lateral").animate({left:'0'});
        $("#reporte").animate({top:'200vw'},"slow");
    });
});