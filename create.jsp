<%@ page import="java.io.*, java.net.*, org.json.*" %>
<%@ page import="java.io.BufferedReader, java.io.InputStreamReader, java.net.HttpURLConnection, java.net.URL, org.json.JSONObject, org.json.JSONArray, java.io.IOException, java.util.Map, java.util.HashMap, java.util.List, java.util.ArrayList" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Crear Departamento, Provincia y Distrito</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #F8F9FA; /* Light grayish blue */
            color: #2B2B2B; /* Very dark gray */
            margin: 20px;
        }

        h1 {
            color: #093D77; /* Dark moderate blue */
            margin-bottom: 20px;
        }

        form {
            background-color: #FFFFFF; /* White */
            border: 1px solid #ddd; /* Light gray border */
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            max-width: 500px;
            margin: auto;
        }

        label {
            display: block;
            margin-bottom: 8px;
            color: #093D77; /* Dark moderate blue */
        }

        input[type="text"] {
            width: 100%;
            padding: 8px;
            margin-bottom: 12px;
            border: 1px solid #ddd; /* Light gray border */
            border-radius: 4px;
            box-sizing: border-box;
        }

        input[type="text"]:focus {
            border-color: #3A7CA5; /* Dark moderate blue */
            outline: none;
            box-shadow: 0 0 4px rgba(58, 124, 165, 0.5);
        }

        input[type="submit"] {
            background-color: #093D77; /* Dark moderate blue */
            color: #FFFFFF; /* White text */
            border: none;
            padding: 10px 15px;
            cursor: pointer;
            border-radius: 4px;
            transition: background-color 0.3s;
        }

        input[type="submit"]:hover {
            background-color: #3A7CA5; /* Dark moderate blue */
        }

        a {
            color: #DAAA52; /* Deep saffron */
            text-decoration: none;
            font-weight: bold;
            display: block;
            text-align: center;
            margin-top: 20px;
        }

        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <h1>Crear Departamento, Provincia y Distrito</h1>
    <form action="processCreate.jsp" method="POST">
        <label for="departamento">Departamento:</label>
        <input type="text" id="departamento" name="departamento" required>
        <br>
        <label for="provincia">Provincia:</label>
        <input type="text" id="provincia" name="provincia" required>
        <br>
        <label for="distrito">Distrito:</label>
        <input type="text" id="distrito" name="distrito" required>
        <br>
        <input type="submit" value="Guardar">
    </form>
    <br>
    <a href="read.jsp">Ver Listado</a>
</body>
</html>
