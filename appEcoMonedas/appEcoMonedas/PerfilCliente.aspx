<%@ Page Title="" Language="C#" MasterPageFile="~/PrincipalCliente.Master" AutoEventWireup="true" CodeBehind="PerfilCliente.aspx.cs" Inherits="appEcoMonedas.PerfilCliente" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="content">
        <div class="container">
            <div class="row bar">
                <div id="customer-account" class="col-lg-9 clearfix">
                    <p class="lead">Edita tus datos personales o cambia tu contraseña.</p>
                    <div class="box mt-5">
                        <div class="heading">
                            <h3 class="text-uppercase">Cambiar contraseña <i class="fa fa-lock"></i></h3>
                        </div>
                        <div class="row">
                            <div class="col-lg-6 col-md-6 col-sm-12">
                                <div class="form-group">
                                    <asp:Label ID="lblContraseniaActual" AssociatedControlID="txtContraseniaActual" runat="server" Text="Contraseña actual"></asp:Label>
                                    <asp:TextBox ID="txtContraseniaActual" type="password" placeholder="Ingrese su contraseña actual" CssClass="form-control" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ValidationGroup="validaContra" runat="server" ErrorMessage="* Para cambiar la contraseña debe digitar su contraseña anterior" ControlToValidate="txtContraseniaActual" SetFocusOnError="true" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                    <asp:CustomValidator ID="cvContraseniaAnterior" runat="server" ValidationGroup="validaContra" ErrorMessage="* La contraseña digitada no coincide con la contraseña actual" ControlToValidate="txtContraseniaActual" OnServerValidate="cvContraseniaAnterior_ServerValidate" SetFocusOnError="true" ForeColor="Red" Display="Dynamic"></asp:CustomValidator>

                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-6 col-md-6 col-sm-12">
                                <div class="form-group">
                                    <asp:Label ID="lblContraseniaNueva" AssociatedControlID="txtContraseniaNueva" runat="server" Text="Contraseña Nueva"></asp:Label>
                                    <asp:TextBox ID="txtContraseniaNueva" type="password" placeholder="Ingrese su nueva contraseña" CssClass="form-control" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ValidationGroup="validaContra" runat="server" ErrorMessage="* Para modificar la contraseña debe digitar una nueva" ControlToValidate="txtContraseniaNueva" SetFocusOnError="true" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="col-lg-6 col-md-6 col-sm-12">
                                <div class="form-group">
                                    <asp:Label ID="lblConfirmaContrasenia" AssociatedControlID="txtConfirmaContrasenia" runat="server" Text="Confirmar contraseña Nueva"></asp:Label>
                                    <asp:TextBox ID="txtConfirmaContrasenia" type="password" placeholder="Confirme su nueva contraseña" CssClass="form-control" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ValidationGroup="validaContra" runat="server" ErrorMessage="* Debe confirmar la nueva contraseña" ControlToValidate="txtConfirmaContrasenia" SetFocusOnError="true" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                    <asp:CompareValidator ID="CompareValidator1" runat="server"
                                        ControlToValidate="txtConfirmaContrasenia"
                                        CssClass="ValidationError" SetFocusOnError="true" ForeColor="Red" Display="Dynamic"
                                        ControlToCompare="txtContraseniaNueva"
                                        ErrorMessage="* Las contraseñas no coinciden" />
                                </div>
                            </div>
                        </div>
                        <div class="text-center">
                            <asp:LinkButton ID="btnGuardarContraseña" OnClick="btnGuardarContraseña_Click" ValidationGroup="validaContra" CssClass="btn btn-template-outlined" runat="server"><i class="fa fa-save"></i> Guardar nueva contraseña</asp:LinkButton>
                        </div>
                    </div>
                    <div class="bo3">
                        <div class="heading">
                            <h3 class="text-uppercase">Detalles personales <i class="fa fa-id-card-o"></i></h3>
                        </div>
                        <div class="row">
                            <div class="col-lg-8 col-md-8 col-sm-12">
                                <div class="form-group">
                                    <asp:Label ID="lblCorreoEdita" AssociatedControlID="txtCorreoEdita" runat="server" Text="Correo"></asp:Label>
                                    <asp:TextBox ID="txtCorreoEdita" placeholder="Ingrese su Correo" Enabled="false" CssClass="form-control" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ValidationGroup="ValidaDetallesPersonales" runat="server" ErrorMessage="* Debe digitar el correo" ControlToValidate="txtCorreoEdita" SetFocusOnError="true" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1"
                                        runat="server" ValidationGroup="ValidaDetallesPersonales"
                                        ErrorMessage="* El correo no cumple con un formato válido. (Formato correo@correo.com)"
                                        ControlToValidate="txtCorreoEdita"
                                        SetFocusOnError="true" ForeColor="Red" Display="Dynamic"
                                        ValidationExpression="^([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?){255}$"></asp:RegularExpressionValidator>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-8 col-md-8 col-sm-12">
                                <div class="form-group">
                                    <asp:Label ID="lblNombreEdita" AssociatedControlID="txtNombreEdita" runat="server" Text="Nombre"></asp:Label>
                                    <asp:TextBox ID="txtNombreEdita" placeholder="Ingrese su nombre" CssClass="form-control" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server"
                                         ErrorMessage="* Debe indicar su nombre" ValidationGroup="ValidaDetallesPersonales"
                                         ControlToValidate="txtNombreEdita" SetFocusOnError="true"
                                         ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2"
                                        runat="server" ValidationGroup="ValidaDetallesPersonales"
                                        ErrorMessage="* El nombre debe de ser maximo de 30 letras."
                                        ControlToValidate="txtNombreEdita"
                                        SetFocusOnError="true" ForeColor="Red" Display="Dynamic"
                                        ValidationExpression="^[ A-Za-zñÑäÄëËïÏöÖüÜáéíóúáéíóúÁÉÍÓÚÂÊÎÔÛâêîôûàèìòùÀÈÌÒÙ-]{1,30}$"></asp:RegularExpressionValidator>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-4 col-md-4 col-sm-12">
                                <div class="form-group">
                                    <asp:Label ID="lblApellido1Edita" AssociatedControlID="txtApellido1Edita" runat="server" Text="Primer Apellido"></asp:Label>
                                    <asp:TextBox ID="txtApellido1Edita" placeholder="Ingrese su primer apellido" CssClass="form-control" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server"
                                         ErrorMessage="* Debe indicar su primer apellido" ValidationGroup="ValidaDetallesPersonales"
                                         ControlToValidate="txtApellido1Edita" SetFocusOnError="true"
                                         ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3"
                                        runat="server" ValidationGroup="ValidaDetallesPersonales"
                                        ErrorMessage="* El primer apellido debe de ser maximo de 30 letras."
                                        ControlToValidate="txtApellido1Edita"
                                        SetFocusOnError="true" ForeColor="Red" Display="Dynamic"
                                        ValidationExpression="^[ A-Za-zñÑäÄëËïÏöÖüÜáéíóúáéíóúÁÉÍÓÚÂÊÎÔÛâêîôûàèìòùÀÈÌÒÙ-]{1,30}$"></asp:RegularExpressionValidator>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-4 col-sm-12">
                                <div class="form-group">
                                    <asp:Label ID="lblApellido2Edita" AssociatedControlID="txtApellido2Edita" runat="server" Text="Segundo Apellido"></asp:Label>
                                    <asp:TextBox ID="txtApellido2Edita" placeholder="Ingrese su segundo apellido" CssClass="form-control" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server"
                                         ErrorMessage="* Debe indicar su segundo apellido" ValidationGroup="ValidaDetallesPersonales"
                                         ControlToValidate="txtApellido2Edita" SetFocusOnError="true"
                                         ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator4"
                                        runat="server" ValidationGroup="ValidaDetallesPersonales"
                                        ErrorMessage="* El segundo apellido debe de ser maximo de 30 letras."
                                        ControlToValidate="txtApellido2Edita"
                                        SetFocusOnError="true" ForeColor="Red" Display="Dynamic"
                                        ValidationExpression="^[ A-Za-zñÑäÄëËïÏöÖüÜáéíóúáéíóúÁÉÍÓÚÂÊÎÔÛâêîôûàèìòùÀÈÌÒÙ-]{1,30}$"></asp:RegularExpressionValidator>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-8 col-md-8 col-sm-12">
                                <div class="form-group">
                                    <asp:Label ID="lblTelefonoEdita" AssociatedControlID="txtTelefonoEdita" runat="server" Text="Teléfono"></asp:Label>
                                    <asp:TextBox ID="txtTelefonoEdita" placeholder="Ingrese su teléfono" CssClass="form-control" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                                        ErrorMessage="* Debe digitar el número de teléfono de contacto" 
                                        ControlToValidate="txtTelefonoEdita" ValidationGroup="ValidaDetallesPersonales"
                                         SetFocusOnError="true" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator5"
                                        runat="server" ValidationGroup="ValidaDetallesPersonales"
                                        ErrorMessage="* El teléfono solo debe contener números (Sin guiones)."
                                        ControlToValidate="txtTelefonoEdita"
                                        SetFocusOnError="true" ForeColor="Red" Display="Dynamic"
                                        ValidationExpression="^\d{8}$"></asp:RegularExpressionValidator>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-8 col-md-8 col-sm-12">
                                <div class="form-group">
                                    <asp:Label ID="lblDireccionEdita" AssociatedControlID="txtDireccionEdita" runat="server" Text="Dirección"></asp:Label>
                                    <asp:TextBox ID="txtDireccionEdita" placeholder="Ingrese su dirección" TextMode="MultiLine" Rows="3" CssClass="form-control" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" 
                                        ErrorMessage="* Debe digitar una breve descripcion sobre su ubicacion de residencia" 
                                        ControlToValidate="txtDireccionEdita" ValidationGroup="ValidaDetallesPersonales"
                                         SetFocusOnError="true" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <asp:LinkButton ID="btnGuardarCambios" ValidationGroup="ValidaDetallesPersonales" OnClick="btnGuardarCambios_Click" CssClass="btn btn-template-outlined" runat="server"><i class="fa fa-save"></i> Guardar cambios</asp:LinkButton>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-3 col-sm-12 mt-4 mt-lg-0">
                    <div class="panel panel-default sidebar-menu">
                        <div class="panel-heading">
                            <h3 class="h4 panel-title">Mi perfil</h3>
                        </div>
                        <div class="panel-body">
                            <ul class="nav nav-pills flex-column text-sm">
                                <li class="nav-item"><a href="PerfilCliente.aspx" class="nav-link active"><i class="fa fa-id-card-o"></i>Editar Perfil</a></li>
                                <li class="nav-item"><a href="customer-wishlist.html" class="nav-link"><i class="fa fa-money"></i>Billetera</a></li>
                                <li class="nav-item"><a href="customer-account.html" class="nav-link"><i class="fa fa-exchange"></i>Historial de canjes</a></li>
                                <li class="nav-item">
                                    <asp:LinkButton ID="btnCerrarSesion" CssClass="nav-link" OnClick="btnCerrarSesion_Click" runat="server"><i class="fa fa-sign-out"></i>
                                    <span class="d-none d-md-inline-block">Cerrar Sesión</span></asp:LinkButton></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
