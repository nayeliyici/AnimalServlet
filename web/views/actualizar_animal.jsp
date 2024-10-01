<%-- 
Document   : actualizar_usuario.jsp
Created on : 22/09/2024, 04:56:05 PM
Author     : ALEJANDRO DIAZ
--%>

<%@page import="java.sql.Time"%>
<%@page import="java.sql.Date"%>
<%@page import="configuration.ConnectionBD"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.PreparedStatement, java.sql.ResultSet" %> 

<!DOCTYPE html> 
<html> 
    <head> 
        <meta charset="UTF-8"> 
        <title>Actualizar Animal</title> 
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    </head> 
    <body class="container mt-2"> 
        <button type="button" class="btn btn-warning my-3">
            <a href="../animal" style="text-decoration:none; color:#000; font-weight: 500"><----</a>
        </button>
        <h2>Actualizar Animal</h2> 
        <%
            String id = request.getParameter("id");
            String color = "";
            String especie = "";
            String tipo_animal = "";
            String tipo_alimento = "";
            Double peso = 0.0;
            String habitat = "";
            String altura = "";
            ConnectionBD conexion = new ConnectionBD();
            Connection connection = conexion.getConnectionBD();
            PreparedStatement statement = null;
            ResultSet resultSet = null;
            try {
                // Consulta para obtener los datos del animal por ID 
                String sql = "SELECT color, especie, tipo_animal, tipo_alimento, peso, habitat, altura"
                        + " FROM animal WHERE id LIKE ?";
                statement = connection.prepareStatement(sql);
                statement.setString(1, id);
                resultSet = statement.executeQuery();
                if (resultSet.next()) {
                    color = resultSet.getString("color");
                    especie = resultSet.getString("especie");
                    tipo_animal = resultSet.getString("tipo_animal");
                    tipo_alimento = resultSet.getString("tipo_alimento");
                    peso = resultSet.getDouble("peso");
                    habitat = resultSet.getString("habitat");
                    altura = resultSet.getString("altura");
                }
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                try {
                    if (resultSet != null) {
                        resultSet.close();
                    }
                    if (statement != null) {
                        statement.close();
                    }
                    if (connection != null) {
                        connection.close();
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        %> 

        <!-- Formulario con los datos del usuario para actualizar --> 
        <form id="formActualizarAnimal"> 
            <div class="form-floating mb-3">
              <input type="text" name="txt_color" class="form-control" id="txt_color" placeholder=".." value="<%= color%>">
              <label for="floatingInput">Color</label>
            </div>
            <div class="form-floating mb-3">
              <input type="text" name="txt_especie" class="form-control" id="txt_especie" placeholder=".." value="<%= especie%>">
              <label for="floatingS">Especie</label>
            </div>
            <div class="form-floating mb-3">
              <input type="text" name="txt_tipo_animal" class="form-control" id="txt_tipo_animal" placeholder=".." value="<%= tipo_animal%>">
              <label for="floatingA">Tipo de animal</label>
            </div> 
            <div class="form-floating mb-3">
              <input type="text" name="txt_tipo_alimento" class="form-control" id="txt_tipo_alimento" placeholder=".." value="<%= tipo_alimento%>">
              <label for="floatingTA">Tipo de alimentación</label>
            </div>
            <div class="form-floating mb-3">
              <input type="number" name="txt_peso" class="form-control" id="txt_peso" placeholder=".." value="<%= peso%>">
              <label for="floatingP">Peso</label>
            </div>
            <div class="form-floating mb-3">
              <input type="text" name="txt_habitat" class="form-control" id="txt_habitat" placeholder=".." value="<%= habitat%>">
              <label for="floatingH">Habitat</label>
            </div>
            <div class="form-floating mb-3">
              <input type="text" name="txt_altura" class="form-control" id="txt_altura" placeholder=".." value="<%= altura%>">
              <label for="floatingAl">Altura</label>
            </div>
            <button onclick="actualizarAnimal()" type="button" name="accion" class="btn btn-warning mt-3 ">
                Actualizar
            </button>
        </form> 
        <div id="resultado" class="mb-4"></div> 
        <script>
            function actualizarAnimal() {
                const id = "<%= id %>";
                const color = document.getElementById("txt_color").value;
                const especie = document.getElementById("txt_especie").value;
                const tipo_animal = document.getElementById("txt_tipo_animal").value;
                const tipo_alimento = document.getElementById("txt_tipo_alimento").value;
                const peso = document.getElementById("txt_peso").value;
                const habitat = document.getElementById("txt_habitat").value;
                const altura = document.getElementById("txt_altura").value;

                const datos = {
                    color: color,
                    especie: especie,
                    tipo_animal: tipo_animal,
                    tipo_alimento: tipo_alimento,
                    peso: peso,
                    habitat: habitat,
                    altura: altura,
                    id: id
                };

                fetch(`${pageContext.request.contextPath}/animal`, {
                    method: "PUT",
                    body: JSON.stringify(datos),
                    headers: {
                        'Content-Type': 'application/json'
                    }
                })
                
                .then(response => response.text())
                .then(data => {
                    alert("Animal actualizado")
                })
                .catch(error => {
                    document.getElementById("resultado").innerText = "Error al actualizar animal.";
                    console.error('Error:', error);
                });
            }

        </script> 
    </body> 
</html> 