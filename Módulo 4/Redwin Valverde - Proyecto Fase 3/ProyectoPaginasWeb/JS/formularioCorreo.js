const txtCont = document.getElementById('txtCont');
const inputs = document.querySelectorAll('#txtCont input');



const expresiones = {
	usuario: /^[a-zA-Z0-9\_\-]{4,16}$/, // Letras, numeros, guion y guion_bajo
	comentario: /^[a-zA-ZÀ-ÿ0-9.,!"#$%&/()=?¡¿'-_*+¨;:|°<>\s]{4,150}$/, // Letras, números y espacios, pueden llevar acentos.
}


const campos = {
	usuario: false,
    comentario: false
}


const validarFormulario = (e) => {
	switch (e.target.name) {
		case "usuario":
			validarCampo(expresiones.usuario, e.target, 'usuario');
		break;
		case "comentario":
			validarCampo(expresiones.comentario, e.target, 'comentario');
		break;
	}
}


const validarCampo = (expresion, input, campo) => {
	if(expresion.test(input.value)){
		document.getElementById(`error_${campo}`).classList.remove('error-activo');

		campos[campo] = true;
	} else {
		document.getElementById(`error_${campo}`).classList.add('error-activo');

		campos[campo] = false;
	}
}


inputs.forEach((input) => {
	input.addEventListener('keyup', validarFormulario);
	input.addEventListener('blur', validarFormulario);
});


txtCont.addEventListener('submit', (e) => {
	// e.preventDefault();

	if(campos.usuario == true && campos.comentario == true && usuario.value != "" && comentario.value != ""){
        
        
		// txtCont.reset();
		
		document.getElementById('enviado').classList.add('enviado-activo');
		setTimeout(() => {
			document.getElementById('enviado').classList.remove('enviado-activo');
		}, 5000);
		
	} else {

		document.getElementById('error_enviar').classList.add('error-activo');

        setTimeout(() => {
            document.getElementById('error_enviar').classList.remove('error-activo');
        }, 5000);
	}
});
