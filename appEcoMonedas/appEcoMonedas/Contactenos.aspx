<%@ Page Title="" Language="C#" MasterPageFile="~/PrincipalInicio.Master" AutoEventWireup="true" CodeBehind="Contactenos.aspx.cs" Inherits="appEcoMonedas.Contactenos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="contact" class="container">
        <section class="bar">
            <div class="row">
                <asp:Label ID="lblMensaje" runat="server" CssClass="col-12 alert alert-dismissible alert-success" Visible="false" Text=""></asp:Label>
                <div class="col-md-12">
                    <div class="heading">
                        <h2>Estamos para ayudarle</h2>
                    </div>
                    <p class="lead">Sientes curiosidad por algo? Has tenido problema con alguno de nuestros productos? Mandanos tus consultas a través de este medio y nosotros te responderemos lo más pronto posible.</p>
                    <p class="text-sm">Sientete libre de realizarnos cualquier consulta, estamos trabajando en mejorar nuestro trabajo 24/7.</p>
                </div>
            </div>
        </section>
        <section>
            <div class="row text-center">
                <div class="col-md-6 col-lg-6 col-sm-12">
                    <div class="box-simple">
                        <div class="icon-outlined"><i class="fa fa-phone"></i></div>
                        <h3 class="h4">Número de teléfono</h3>
                        <p>Por favor solo utilizar el medio en caso de emergencias, evite realizar bromas o otro tipo de usos inhapropiados.</p>
                        <p><strong>8888-8888</strong></p>
                    </div>
                </div>
                <div class="col-md-6 col-lg-6 col-sm-12">
                    <div class="box-simple">
                        <div class="icon-outlined"><i class="fa fa-envelope"></i></div>
                        <h3 class="h4">Correo Electrónico</h3>
                        <p>Por favor sientase libre de realizar las consultas vía email.</p>
                        <ul class="list-unstyled text-sm">
                            <li><strong><a href="mailto:">ecomonedas.proyectoutn@gmail.com</a></strong></li>
                        </ul>
                    </div>
                </div>
            </div>
        </section>
        <section class="bar pt-0">
            <div class="row">
                <div class="col-md-12">
                    <div class="heading text-center">
                        <h2>Formulario de contacto</h2>
                    </div>
                </div>
                <div class="col-md-8 mx-auto">
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label for="txtNombreEmite">Nombre</label>
                                <asp:TextBox ID="txtNombreEmite" runat="server" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="* Debe indicar sus apellidos"
                                     ControlToValidate="txtNombreEmite" SetFocusOnError="true" ForeColor="Red" ValidationGroup="Contacto" 
                                    Display="Dynamic"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label for="txtApellidos">Apellidos</label>
                                <asp:TextBox ID="txtApellidos" runat="server" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="* Debe indicar sus apellidos"
                                     ControlToValidate="txtApellidos" SetFocusOnError="true" ForeColor="Red" ValidationGroup="Contacto"
                                    Display="Dynamic"></asp:RequiredFieldValidator>
                                    
                            </div>
                        </div>
                        <div class="col-sm-12">
                            <div class="form-group">
                                <label for="txtCorreoEmite">Email</label>
                                <asp:TextBox ID="txtCorreoEmite" runat="server" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ValidationGroup="Contacto"
                                    ErrorMessage="* Debe digitar el correo" ControlToValidate="txtCorreoEmite"
                                    SetFocusOnError="true" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1"
                                    runat="server"
                                    ErrorMessage="* El correo no cumple con un formato válido. (Formato correo@correo.com)"
                                    ControlToValidate="txtCorreoEmite" ValidationGroup="Contacto"
                                    SetFocusOnError="true" ForeColor="Red" Display="Dynamic"
                                    ValidationExpression="^([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?){255}$"></asp:RegularExpressionValidator>
                            </div>
                        </div>
                        <div class="col-sm-12">
                            <div class="form-group">
                                <label for="txtObjetivo">Objetivo</label>
                                <asp:TextBox ID="txtObjetivo" runat="server" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="* Debe indicar sus apellidos"
                                     ControlToValidate="txtObjetivo" SetFocusOnError="true" ForeColor="Red" ValidationGroup="Contacto" 
                                    Display="Dynamic"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div class="col-sm-12">
                            <div class="form-group">
                                <label for="txtMensaje">Mensaje</label>
                                <asp:TextBox ID="txtMensaje" TextMode="MultiLine" Rows="3" runat="server" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="* Debe indicar sus apellidos"
                                     ControlToValidate="txtMensaje" SetFocusOnError="true" ForeColor="Red" ValidationGroup="Contacto" 
                                    Display="Dynamic"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div class="col-sm-12 text-center">
                            <asp:Button ID="btnEnviar" ValidationGroup="Contacto"  OnClick="btnEnviar_Click" class="btn btn-template-outlined" runat="server" Text="Enviar" />
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
</asp:Content>
