<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Detalles del Albergue</title>
</head>
<body>
<h1>Detalles del Albergue</h1>

<p><strong>Nombre del Albergue:</strong> ${albergue.nombreAlbergue}</p>
<p><strong>Encargado:</strong> ${albergue.nombre}</p>
<p><strong>Teléfono:</strong> ${albergue.telefono}</p>
<p><strong>Distrito:</strong> ${albergue.distrito.nombre}</p>
<p><strong>Dirección:</strong> ${albergue.direccion}</p>
<p><strong>Punto de Acopio de Donaciones:</strong> ${albergue.puntoAcopioDonaciones}</p>
<p><strong>URL de Redes Sociales:</strong> <a href="${albergue.urlFbig}" target="_blank">${albergue.urlFbig}</a></p>
<p><strong>Número de Contacto de Donaciones:</strong> ${albergue.numeroDonaciones}</p>
</body>
</html>
