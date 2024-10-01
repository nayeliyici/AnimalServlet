<%-- 
    Document   : registro_usuarios
    Created on : 21/09/2024, 07:25:52 PM
    Author     : ALEJANDRO DIAZ
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    </head>
    <body class="container mt-3">
        <button type="button" class="btn btn-warning my-3">
            <a href="../animal" style="text-decoration:none; color:#000; font-weight: 500"><----</a>
        </button>
        <h1>Registro Animales</h1>
        <form action="${pageContext.request.contextPath}/animal" method="POST" style="width: 500px">
            <div class="form-floating mb-3">
              <input type="text" name="txt_color" class="form-control" id="floatingInput" placeholder="..">
              <label for="floatingInput">Color</label>
            </div>
            <div class="form-floating mb-3">
              <input type="text" name="txt_especie" class="form-control" id="floatingS" placeholder="..">
              <label for="floatingS">Especie</label>
            </div>
            <div class="form-floating mb-3">
              <input type="text" name="txt_tipo_animal" class="form-control" id="floatingA" placeholder="..">
              <label for="floatingA">Tipo de animal</label>
            </div> 
            <div class="form-floating mb-3">
              <input type="text" name="txt_tipo_alimento" class="form-control" id="floatingTA" placeholder="..">
              <label for="floatingTA">Tipo de alimentación</label>
            </div>
            <div class="form-floating mb-3">
              <input type="number" name="txt_peso" class="form-control" id="floatingP" placeholder="..">
              <label for="floatingP">Peso</label>
            </div>
            <div class="form-floating mb-3">
              <input type="text" name="txt_habitat" class="form-control" id="floatingH" placeholder="..">
              <label for="floatingH">Habitat</label>
            </div>
            <div class="form-floating mb-3">
              <input type="text" name="txt_altura" class="form-control" id="floatingAl" placeholder="..">
              <label for="floatingAl">Altura</label>
            </div>
            <button type="submit" name="accion" class="btn btn-warning my-3">
                Agregar
            </button>
        </form>
    </body>
</html>
