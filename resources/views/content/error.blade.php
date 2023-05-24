<!-- resources/views/error.blade.php -->

<!DOCTYPE html>
<html lang="es">

<head>
    <title>Error</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background: #f1f1f1;
        }

        .container {
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .error-header {
            text-align: center;
        }

        .error-body {
            text-align: center;
            padding: 10px;
        }
    </style>
</head>

<body>
    <div class="container">
        <div class="error-header">
            <h1>Error: <img src="/img/logo.png" alt="Logo" width="50px">CyberAcademy tiene problemas en su servicio</h1>
        </div>
        <div class="error-body">
            <p>Lo sentimos, estamos experimentando problemas técnicos. Por favor, inténtelo de nuevo más tarde.</p>

            <ul>
                <li>Compruebe la conexión o configuración de las Bases de Datos</li>
                <li>Compruebe que el servidor web está en funcionamiento</li>
            </ul>
            <a href="/login">Reintentar inicio de sesión</a>
        </div>
    </div>
</body>

</html>
