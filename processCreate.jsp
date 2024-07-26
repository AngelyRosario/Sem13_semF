<%@ page import="java.io.*, java.net.*, org.json.*" %>
<%
    String departamento = request.getParameter("departamento");
    String provincia = request.getParameter("provincia");
    String distrito = request.getParameter("distrito");

    try {
        // Crear un nuevo departamento
        URL url = new URL("http://localhost:8081/api/departamentos"); // URL del endpoint de creación de departamentos
        HttpURLConnection conn = (HttpURLConnection) url.openConnection(); // Abrir conexión HTTP
        conn.setRequestMethod("POST"); // Método HTTP POST para crear un nuevo recurso
        conn.setRequestProperty("Content-Type", "application/json; utf-8"); // Establecer el tipo de contenido de la solicitud
        conn.setDoOutput(true); // Habilitar salida para enviar datos

        // Crear JSON con el nombre del departamento
        String jsonInputString = new JSONObject().put("name", departamento).toString();
        // Enviar JSON en el cuerpo de la solicitud
        try(OutputStream os = conn.getOutputStream()) {
            byte[] input = jsonInputString.getBytes("utf-8");
            os.write(input, 0, input.length);           
        }

        // Leer la respuesta del servidor
        BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "utf-8"));
        StringBuilder departamentoResponse = new StringBuilder();
        String responseLine;
        while ((responseLine = br.readLine()) != null) {
            departamentoResponse.append(responseLine.trim());
        }
        // Convertir la respuesta a JSON y obtener el ID del nuevo departamento
        JSONObject departamentoJson = new JSONObject(departamentoResponse.toString());
        Long departamentoId = departamentoJson.getLong("id");

        // Crear una nueva provincia
        url = new URL("http://localhost:8081/api/provincias"); // URL del endpoint de creación de provincias
        conn = (HttpURLConnection) url.openConnection(); // Abrir conexión HTTP
        conn.setRequestMethod("POST"); // Método HTTP POST para crear un nuevo recurso
        conn.setRequestProperty("Content-Type", "application/json; utf-8"); // Establecer el tipo de contenido de la solicitud
        conn.setDoOutput(true); // Habilitar salida para enviar datos

        // Crear JSON con el nombre de la provincia y el ID del departamento asociado
        jsonInputString = new JSONObject().put("name", provincia).put("departamento_id", departamentoId).toString();
        // Enviar JSON en el cuerpo de la solicitud
        try(OutputStream os = conn.getOutputStream()) {
            byte[] input = jsonInputString.getBytes("utf-8");
            os.write(input, 0, input.length);           
        }

        // Leer la respuesta del servidor
        br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "utf-8"));
        StringBuilder provinciaResponse = new StringBuilder();
        while ((responseLine = br.readLine()) != null) {
            provinciaResponse.append(responseLine.trim());
        }
        // Convertir la respuesta a JSON y obtener el ID de la nueva provincia
        JSONObject provinciaJson = new JSONObject(provinciaResponse.toString());
        Long provinciaId = provinciaJson.getLong("id");

        // Crear un nuevo distrito
        url = new URL("http://localhost:8081/api/distritos"); // URL del endpoint de creación de distritos
        conn = (HttpURLConnection) url.openConnection(); // Abrir conexión HTTP
        conn.setRequestMethod("POST"); // Método HTTP POST para crear un nuevo recurso
        conn.setRequestProperty("Content-Type", "application/json; utf-8"); // Establecer el tipo de contenido de la solicitud
        conn.setDoOutput(true); // Habilitar salida para enviar datos

        // Crear JSON con el nombre del distrito y el ID de la provincia asociada
        jsonInputString = new JSONObject().put("name", distrito).put("provincia_id", provinciaId).toString();
        // Enviar JSON en el cuerpo de la solicitud
        try(OutputStream os = conn.getOutputStream()) {
            byte[] input = jsonInputString.getBytes("utf-8");
            os.write(input, 0, input.length);           
        }

        // Leer la respuesta del servidor
        br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "utf-8"));
        StringBuilder distritoResponse = new StringBuilder();
        while ((responseLine = br.readLine()) != null) {
            distritoResponse.append(responseLine.trim());
        }

        // Redirigir a la página de lectura después de crear el distrito
        response.sendRedirect("read.jsp");
    } catch (Exception e) {
        e.printStackTrace(); // Manejar excepciones y errores
    }
%>

