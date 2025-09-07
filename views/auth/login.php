    <main class="contenedor seccion contenido-centrado">
        <h1>Iniciar Sesión</h1>

        <?php foreach($errores as $error):?>
            <div class="alerta error">
                <?php echo $error; ?>
            </div>
        <?php endforeach; ?>    
        

        <form method="POST" action="/login" class="formulario">
            <fieldset>
                <legend>E-mail y Contraseña</legend>

                <label for="email">E-mail</label>
                <input type="email" name = "email" placeholder="Tu E-mail" id="email">

                <label for="password">Contraseña</label>
                <input type="password" name = "password" placeholder="Tu Contraseña" id="password">
            </fieldset>

            <input type="submit" value="Iniciar Sesión" class="boton boton-verde">
        </form>
    </main>
