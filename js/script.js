
function verificarTexto(verificar){
if (form.password.value == "" || form.User.value == "")
{
    alert ("Algum dos campos esta vazio!");
}else{
    document.getElementById("myModal").style.display = "none";
    //alert ("Bem Vindo ao Nosso Site SOS-MINOXIDIL");
    document.getElementById("BemVindo").style.display = "block";
}
}
//verifica se os campos de register esta vazio
function verificarRegistro(verificar1){
if (form1.password1.value == "" || form1.User1.value == "" || form1.email.value == "")
{
    alert ("Algum dos campos esta vazio!");
}else{
    document.getElementById("IDRegister").style.display = "none";
    //alert ("Bem Vindo ao Nosso Site SOS-MINOXIDIL");
    document.getElementById("myModal").style.display = "block";
}
}

// Open and close sidebar
function w3_open() {
document.getElementById("mySidebar").style.display = "block";
document.getElementById("myOverlay").style.display = "block";
}

function w3_close() {
document.getElementById("mySidebar").style.display = "none";
document.getElementById("myOverlay").style.display = "none";
}