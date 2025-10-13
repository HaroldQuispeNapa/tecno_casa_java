import { toast, Preguntar } from "./exports/sweet.js";
import { enviarPeticionPost } from "./exports/post_component.js";

const form = document.getElementById("formReclamos");

const URL = "http://localhost:8081/tecno_casa/ControladorReclamo";

async function registrarReclamo(formulario_enviar) {
    const success = await enviarPeticionPost(formulario_enviar, "registrar", URL);
    success ?
            (toast("success", "Registrado Correctamente"), form.reset()) :
            toast("warning", "Error al registrar");

}

form.addEventListener("submit", async (e) => {
    e.preventDefault();
      console.log("Formulario enviado");
    await registrarReclamo(form);
});