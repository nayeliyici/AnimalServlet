<%@page import="java.util.ArrayList"%>
<%@page import="model.AnimalModel"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Lista de Animales</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <style>
            table {
                width: 80%;
                border-collapse: collapse;
            }
            table, th, td {
                border: 1px solid black;
            }
            th, td {
                padding: 10px;
                text-align: left;
            }
            th {
                background-color: #f2f2f2;
            }
        </style>
        <script>
            function eliminarAnimal(id) {
                console.log(`eliminarAnimal?id=` + id);
                if (confirm("¿Estás seguro de que quieres eliminar este animal?")) {
                    fetch(`animal?id=` + id, {
                        method: 'DELETE'
                    }).then(response => {
                        if (response.ok) {
                            alert('Animal eliminado exitosamente');
                            location.reload();
                        } else {
                            alert('Error al eliminar animal');
                        }
                    }).catch(error => console.error('Error:', error));
                }
            }
        </script>
    </head>
    <body class="container mt-4">
        
        <h2>Lista de Animales</h2>
        <button type="button" class="btn btn-warning my-3">
            <a href="views/registro_animales.jsp" style="text-decoration:none; color:#000;">AGREGAR</a>
        </button>
        <table class="table">
             <thead class="table-dark">
                <tr>
                    <th>Id</th>
                    <th>Color</th>
                    <th>Especie</th>
                    <th>Tipo de Animal</th>
                    <th>Tipo de alimentación</th>
                    <th>Peso</th>
                    <th>Habitat</th>
                    <th>Altura</th>
                    <th colspan="2">Acciones</th>
                </tr>
            </thead>
            <tbody>
                <%
                    ArrayList<AnimalModel> listaAnimales = (ArrayList<AnimalModel>) request.getAttribute("animales");

                    if (listaAnimales != null && !listaAnimales.isEmpty()) {
                        for (AnimalModel animal : listaAnimales) {
                %>
                <tr>
                    <td><%= animal.getId()%></td>
                    <td><%= animal.getColor()%></td>
                    <td><%= animal.getEspecie()%></td>
                    <td><%= animal.getTipo_animal()%></td>
                    <td><%= animal.getTipo_alimento()%></td>
                    <td><%= animal.getPeso()%></td>
                    <td><%= animal.getHabitat()%></td>
                    <td><%= animal.getAltura()%></td>
                    <td> 
                        <button type="button" class="btn btn-warning" onclick="eliminarAnimal(<%= animal.getId()%>)">
                            Eliminar
                        </button>
                    </td>
                    <td>
                        <!-- Botón para actualizar, que redirige a actualizarUsuario.jsp con el ID del usuario --> 
                        <form action="${pageContext.request.contextPath}/views/actualizar_animal.jsp" method="GET"> 
                            <input type="hidden" name="id" value="<%= animal.getId()%>"> 
                            <button type="submit" class="btn btn-warning">Actualizar</button> 
                        </form> 
                    </td>
                </tr>
                <%
                    }
                } else {
                %>
                <tr>
                    <td colspan="7">No hay animales registrados.</td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>
    </body>
</html>
