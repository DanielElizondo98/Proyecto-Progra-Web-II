<%@ Page Title="" Language="C#" MasterPageFile="~/PrincipalAdministrador.Master" AutoEventWireup="true" CodeBehind="InicioAdministrador.aspx.cs" Inherits="appEcoMonedas.InicioAdministrador" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="background: url('img/reciclajeparalax.jpg') center center repeat; background-size: cover;" class="jumbotron relative-positioned color-white text-md-center">
        <div class="dark-mask mask-primary"></div>
        <div class="container">
            <div class="row mb-small">
                <div class="col-md-12 text-center">
                    <h1 class="text-uppercase">Descripcion de bienvenida a la pag de mante Admin</h1>
                    <h2 class="text-uppercase">Last week more than 100 companies signed up to help them in their projects.</h2>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6 mb-small">
                    <img src="img/template-mac.png" alt="..." class="img-fluid"/></div>
                <div class="col-md-6 text-center-sm">
                    <p class="text-uppercase text-bold">Business. Corporate. Agency.<br/>
                        Portfolio. Blog. E-commerce.<br/>
                        We have covered everything.</p>
                    <p class="no-letter-spacing">See our current packages comparison<br/>
                        to choose the right one for you.</p>
                </div>
            </div>
        </div>
    </div>
    <section class="bar background-white">
        <div class="container text-center">
            <div class="row d-flex align-items-stretch same-height">
                <div class="col-lg-3 col-md-3 col-sm-12">
                    <div class="box-simple box-white same-height">
                        <div class="icon"><i class="fa fa-desktop"></i></div>
                        <h4>Usuario</h4>
                        <p>En este mantenimiento usted podrá agregar nuevos administradores de centro de acopio y gestionar usuarios existentes.</p>
                    </div>
                </div>
                <div class="col-lg-3 col-md-3 col-sm-12">
                    <div class="box-simple box-white same-height">
                        <div class="icon"><i class="fa fa-print"></i></div>
                        <h4>Centros de Acopio</h4>
                        <p>En este mantenimiento usted podrá ingresar, editar y deshabilitar centros de acopio pertenecientes al proyecto Eco-monedas.</p>
                    </div>
                </div>
                <div class="col-lg-3 col-md-3 col-sm-12">
                    <div class="box-simple box-white same-height">
                        <div class="icon"><i class="fa fa-globe"></i></div>
                        <h4>Materiales</h4>
                        <p>En este mantenimiento usted podrá ingresar, editar y deshabilitar materiales utilizados por los centros de acopio.</p>
                    </div>
                </div>
                <div class="col-lg-3 col-md-3 col-sm-12">
                    <div class="box-simple box-white same-height">
                        <div class="icon"><i class="fa fa-globe"></i></div>
                        <h4>Cupones</h4>
                        <p>En este mantenimiento usted podrá ingresar, editar y deshabilitar los cupones que ofrece el proyecto Eco-monedas a cambio de los materiales reciclables.</p>
                    </div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
