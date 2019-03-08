function Pintar(color) {
    document.getElementById('divImagenMaterial').style.background = color;
}

function limpiarManteMaterial() {
    document.getElementById('txtNombre').value = "";
    document.getElementById('txtPrecio').value = "";
    document.getElementById('ddlColores').selectedIndex = 0;
    document.getElementById('divImagenMaterial').style.background = "#fff";
    document.getElementById('archivoImagen').value = "";
    document.getElementById('hiddenID').value = "";
    document.getElementById('imgMaterial').removeAttribute("src");
}

function limpiarManteUsuario() {
    
}