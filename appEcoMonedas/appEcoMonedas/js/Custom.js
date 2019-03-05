function Pintar(color) {
    document.getElementById('divImagenMaterial').style.background = color;
}

function limpiar() {
    document.getElementById('txtNombre').value = "";
    document.getElementById('txtPrecio').value = "";
    document.getElementById('txtColor').value = "#fff";
    document.getElementById('divImagenMaterial').style.background = "#fff";
    document.getElementById('archivoImagen').value = "";
    document.getElementById('hiddenID').value = "";
    document.getElementById('imgMaterial').src = "#";
}