<%@ Page Title="" Language="C#" MasterPageFile="~/PrincipalInicio.Master" AutoEventWireup="true" CodeBehind="InicioSesion.aspx.cs" Inherits="appEcoMonedas.InicioSesion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        body {
            background: #f9f9f9;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="no-padding-top no-padding-bottom">
        <div class="container-fluid">
            <div class="row">
                <div class="container">
                    <div class="row mt-5">
                        <div class="card col-lg-6 offset-lg-3 col-md-6 offset-md-3 col-sm-12">
                            <article class="card-body">
                                <div class="text-center">
                                    <i class="fa fa-user" style="font-size: 72px;"></i>
                                </div>
                                <h4 class="card-title text-center mb-4 mt-1">Iniciar Sesion</h4>
                                <asp:Label ID="lblMensaje" CssClass="row alert alert-dismissible alert-danger" runat="server" Text="" Visible="false"></asp:Label>
                                <hr />
                                <div class="form-group">
                                    <asp:Label ID="lblCorreo" runat="server" Text="Correo"></asp:Label>
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text"><i class="fa fa-user"></i></span>
                                        </div>
                                        <asp:TextBox ID="txtCorreo" placeholder="Ingrese su correo" CssClass="form-control" ToolTip="Correo" runat="server"></asp:TextBox>
                                    </div>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="* Introduce un correo" ControlToValidate="txtCorreo" SetFocusOnError="true" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>        
                                </div>
                                <div class="form-group">
                                    <asp:Label ID="lblContrasenia" runat="server" Text="Contraseña"></asp:Label>
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text"><i class="fa fa-lock"></i></span>
                                        </div>
                                        <asp:TextBox ID="txtContrasenia" placeholder="Ingrese su contraseña" CssClass="form-control" type="password" ToolTip="Contraseña" runat="server"></asp:TextBox>
                                    </div>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="* Introduce la contraseña" ControlToValidate="txtContrasenia" SetFocusOnError="true" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                </div>
                                <div class="form-group">
                                    <asp:Button ID="btnIniciarSesion" CssClass="btn btn-primary btn-block" runat="server"
                                        Text="Iniciar Sesión" OnClick="btnIniciarSesion_Click" />
                                </div>
                                <p class="text-center">
                                    ¿Aún no te haz registrado?
                                <asp:HyperLink ID="hpLnkIniciarSesion" NavigateUrl="~/Registro.aspx" runat="server">Registrarse</asp:HyperLink>
                                </p>
                            </article>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </section>
</asp:Content>
