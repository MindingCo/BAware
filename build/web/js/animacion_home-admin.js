$(window).ready(function()
{
    $("#bottom-panel").click( function ()
    {
        $("#bottom-panel").animate({bottom: '-5vh'},"slow");
        $("#panel-lateral").animate({left:'-4vw'});
        $("#nomenclatura").animate({top:'0'},"slow");
    });
    $("#nomenclatura").click( function ()
    {
        $("#bottom-panel").animate({bottom: '0'},"slow");
        $("#panel-lateral").animate({left:'0'});
        $("#nomenclatura").animate({top:'100vw'},"slow");
    });
    // parte de logueado
    $(".icon-user").click( function ()
    {
        $("#bottom-panel").animate({bottom: '-5vh'},"slow");
        $("#panel-lateral").animate({left:'-4vw'});
        $("#panel").animate({left:'0'},"slow");
        $("#frame-panel").attr("src", "01_catalogousuarios.jsp");
    });
    $(".icon-location").click( function ()
    {
        $("#bottom-panel").animate({bottom: '-5vh'},"slow");
        $("#panel-lateral").animate({left:'-4vw'});
        $("#panel").animate({left:'0'},"slow");
        $("#frame-panel").attr("src", "01_catalogopines.jsp");
    });
    
    $("#panel").click( function ()
    {
        $("#bottom-panel").animate({bottom: '0'},"slow");
        $("#panel-lateral").animate({left:'0'});
        $("#panel").animate({left:'-100vw'},"slow");
    });
});