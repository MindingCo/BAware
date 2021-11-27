<% 
    HttpSession sesionOk = request.getSession();
    sesionOk.invalidate();
%>
<!DOCTYPE html>
<html>
    <head>
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:forward page="index.jsp">
            <jsp:param name="CerrarSesion" value="true"/>
        </jsp:forward>
    </body>
</html>
