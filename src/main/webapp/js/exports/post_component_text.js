export async function enviarPeticionPostTexto(form, accion, URL) {
  let parametros;

  if (form instanceof HTMLFormElement) {
    parametros = new URLSearchParams(new FormData(form));
  } else if (form instanceof FormData) {
    parametros = new URLSearchParams(form);
  }

  parametros.append("accion", accion);

  const res = await fetch(URL, {
    method: "POST",
    headers: { "Content-Type": "application/x-www-form-urlencoded" },
    body: parametros.toString()
  });

  const text = await res.text();
  return text === "true";
}
