<%@ Page Title="" Language="C#" MasterPageFile="~/PrincipalAdministrador.Master" AutoEventWireup="true" CodeBehind="InicioAdministrador.aspx.cs" Inherits="appEcoMonedas.InicioAdministrador" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="background: url('img/Iconos/ReciclajeBackground.png') center center repeat; background-size: cover;" class="jumbotron relative-positioned color-white text-md-center">
        <div class="dark-mask mask-primary"></div>
        <div class="container">
            <div class="row mb-small">
                <div class="col-md-12 text-center">
                    <h1 class="text-uppercase">¡Bienvenido a la Página del Administrador</h1>
                    <h2 class="text-uppercase">En esta página usted podrá accesar a los mantenimientos de: </h2>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6 mb-small" style="text-align:right">
                    <img src="img/Iconos/Mantenimientos.png" alt="..." class="img-fluid" style=" width: 24em;" /></div>
                <div class="col-md-6 text-center-sm">
                    <p class="text-uppercase text-bold">Centros de Acopio<br/>
                        Cupones<br/>
                        Materiales<br/>
                        Usuarios
                    </p><br/><br/>
                    <p class="no-letter-spacing">Además de poder generar reportes acerca de las ecomonedas generadas por Centro de Acopio</p>
                </div>
            </div>
        </div>
    </div>
    <section class="bar background-white">
        <div class="container text-center">
            <div class="row d-flex align-items-stretch same-height">
                <div class="col-lg-3 col-md-3 col-sm-12">
                    <div class="box-simple box-white same-height">
                        <div class="icon" style="margin-bottom:0";>
                            <img src="img/Iconos/miuser.png" class="img-fluid" style="width:2.5em"/></div>
                        <h4>Usuario</h4>
                        <p>En este mantenimiento usted podrá agregar nuevos administradores de centro de acopio y gestionar usuarios existentes.</p>
                    </div>
                </div>
                <div class="col-lg-3 col-md-3 col-sm-12">
                    <div class="box-simple box-white same-height">
                        <div class="icon">
                            <img src="img/Iconos/micentro.png" class="img-fluid" style="width:2em"/></div>
                        <h4>Centros de Acopio</h4>
                        <p>En este mantenimiento usted podrá ingresar, editar y deshabilitar centros de acopio pertenecientes al proyecto Eco-monedas.</p>
                    </div>
                </div>
                <div class="col-lg-3 col-md-3 col-sm-12">
                    <div class="box-simple box-white same-height">
                        <div class="icon" style="margin-bottom:0";>
                            <img src="img/Iconos/mimaterial.png" class="img-fluid" style="width:2.5em"/></div>
                        <h4>Materiales</h4>
                        <p>En este mantenimiento usted podrá ingresar, editar y deshabilitar materiales utilizados por los centros de acopio.</p>
                    </div>
                </div>
                <div class="col-lg-3 col-md-3 col-sm-12">
                    <div class="box-simple box-white same-height">
                        <div class="icon">
                            <img src="img/Iconos/canjee.png" class="img-fluid" style="width:2em"/></div>
                        <h4>Cupones</h4>
                        <p>En este mantenimiento usted podrá ingresar, editar y deshabilitar los cupones que ofrece el proyecto Eco-monedas a cambio de los materiales reciclables.</p>
                    </div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
