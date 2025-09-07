document.addEventListener('DOMContentLoaded', function(){
    eventListeners();

    darkMode();
});

function darkMode(){
 
    let miStorage = window.localStorage; //Objeto para controlar el Local-Storage de Windows
    let prefiereDarkMode = window.matchMedia('(prefers-color-scheme: dark)'); //DEVUELVE VERDADERO SI EL VALOR POR DEFECTO DEL SISTEMA ES DARK
    
    if (miStorage.getItem('oscuro')==null) { // SI NO  EXISTE ALGUNA VARIABLE GUARDADA EN STORAGE CON LA CLAVE OSCURO
        if (prefiereDarkMode.matches) { //COMO EL VALOR POR DEFECTO DEL SISTEMA ES OSCURO LE ASIGNAMOS ESE VALOR
            miStorage.setItem('oscuro',1); //CREAMOS ESA VARIABLE EN STORAGE CON VALOR 1=OSCURO
            document.body.classList.add('dark-mode');
        }else{ //POR DEFECTO EL SSITEMA ESTA EN CLARO , DEVUELVE FALSO
            miStorage.setItem('oscuro',0); //CREAMOS ESA VARIABLE EN STORAGE CON VALOR 0=CLARO
            document.body.classList.remove('dark-mode');
        }
    }
    else{ //SI YA EXISTE ALGUNA VARIABLE ALMACENADA CON ESE NOMBRE Y UN VALOR 
        if (miStorage.getItem('oscuro')==1) { //VERIFICAMOS SI EL VALOR ES 1 =OSCURO
            document.body.classList.add('dark-mode'); //PONEMOS MODO OSCURO
        }else{                                     //SI EL VALOR ES BLANCO
            document.body.classList.remove('dark-mode'); //PONENMOS MODO CLARO
        }
    }
 
    prefiereDarkMode.addEventListener('change',function(){ //FUNCION SI EXISTE CAMBIO EN PREFERENCIA DE TEMA POR EL USARIO
        if (prefiereDarkMode.matches) { //EL TEMA SIGUE SIENDO OSCURO
            miStorage.setItem('oscuro',1); //NUEVO VALOR PARA OSCURO=1
            document.body.classList.add('dark-mode');
        }else{ //TEMA BLANCO
            miStorage.setItem('oscuro',0); //NUEVO VALOR PARA OSCURO=0
            document.body.classList.remove('dark-mode');
        }
    })
 
    const botonDarkMode=document.querySelector('.dark-mode-boton'); //EVENTO PARA EL BOTON
    botonDarkMode.addEventListener('click',function(){ //AÑÁDIMOS EVENTO
        if (document.body.classList.contains('dark-mode')) { //SI CAMBIAMOS A MODO CLARO
            miStorage.setItem('oscuro',0); //NUEVO VALOR PARA STORAGE OSCURO=0 
            document.body.classList.remove('dark-mode'); //
        }else{ //SI CAMBIAMOS A MODO OSCURO
            miStorage.setItem('oscuro',1); //NUEVO VALOR PARA STORAGE OSCURO=1
            document.body.classList.add('dark-mode');
        }
    })  
}

function eventListeners(){
    const mobileMenu = document.querySelector('.mobile-menu');

    mobileMenu.addEventListener('click', navegacionResponsive);

    // Muestra campos condicionales en la página de contacto
    const metodoContacto = document.querySelectorAll('input[name="contacto[contacto]"]');
    metodoContacto.forEach(input => input.addEventListener('click', mostrarMetodosContacto));

}

function navegacionResponsive(){
    const navegacion = document.querySelector('.navegacion');
    // toggle si no tiene la clase la agrega y si la tiene la quita
    navegacion.classList.toggle('mostrar');
}

function mostrarMetodosContacto(e){
    const contactoDiv = document.querySelector('#contacto');

    if(e.target.value === 'telefono'){
        contactoDiv.innerHTML = `
            <label for="telefono">Número de Teléfono</label>
            <input type="tel" placeholder="Tu Teléfono" id="telefono" name="contacto[telefono]">

            <p>Elija la fecha y la hora para la llamada</p>

            <label for="fecha">Fecha</label>
            <input type="date" id="fecha" name="contacto[fecha]">

            <label for="hora">Hora</label>
            <input type="time" id="hora" min="09:00" max="18:00" name="contacto[hora]">
        `;
    } else {
        contactoDiv.innerHTML = `
            <label for="email">E-mail</label>
            <input type="email" placeholder="Tu E-mail" id="email" name="contacto[email]" required>

        `;
    }
}