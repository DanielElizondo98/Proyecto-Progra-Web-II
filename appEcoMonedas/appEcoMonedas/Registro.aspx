<%@ Page Title="" Language="C#" MasterPageFile="~/PrincipalInicio.Master" AutoEventWireup="true" CodeBehind="Registro.aspx.cs" Inherits="appEcoMonedas.Registro" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/font.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons" />
    <!---https://bootsnipp.com/snippets/kEPlV-->
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="no-padding-top no-padding-bottom" style="background: #f9f9f9;">
        <div class="container-fluid">
            <div class="row">
                <div class="container">
                    <div class="col-12 mt-4 text-center">
                        <asp:Label ID="lblMensaje" runat="server" CssClass="row alert alert-dismissible alert-danger" Visible="false" Text=""></asp:Label>
                    </div>
                    <div class="text-center">
                        <i class="icon-paper-and-pencil" style="font-size: 72px;"></i>
                        <h2>Autoregistro</h2>
                        <p class="lead">LLená este formulario, y se parte del cambio, hacia un país más verde.</p>
                    </div>
                    <div class="row">
                        <div class="col-lg-8 col-md-8 offset-lg-2 offset-md-2 col-sm-12">
                            <div class="form-group input-group">
                                <label class="control-label col-sm-3">Correo <span class="text-danger">*</span></label>
                                <div class="col-md-8 col-sm-9">
                                    <div class="form-group input-group">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text"><i class="fa fa-envelope"></i></span>
                                        </div>
                                        <asp:TextBox ID="txtCorreo" placeholder="Ingrese su correo" CssClass="form-control" ToolTip="Correo" runat="server"></asp:TextBox>
                                    </div>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="* Debe digitar el correo" ControlToValidate="txtCorreo" SetFocusOnError="true" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1"
                                        runat="server"
                                        ErrorMessage="* El correo no cumple con un formato válido. (Formato correo@correo.com)"
                                        ControlToValidate="txtCorreo"
                                        SetFocusOnError="true" ForeColor="Red" Display="Dynamic"
                                        ValidationExpression="^([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?){255}$"></asp:RegularExpressionValidator>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-8 col-md-8 offset-lg-2 offset-md-2 col-sm-12">
                            <div class="form-group input-group">
                                <label class="control-label col-sm-3">Nombre <span class="text-danger">*</span></label>
                                <div class="col-md-8 col-sm-9">
                                    <asp:TextBox ID="txtNombre" placeholder="Ingrese su nombre" CssClass="form-control" ToolTip="Nombre" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="* Debe indicar su nombre" ControlToValidate="txtNombre" SetFocusOnError="true" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2"
                                        runat="server"
                                        ErrorMessage="* El nombre debe de ser maximo de 30 letras."
                                        ControlToValidate="txtNombre"
                                        SetFocusOnError="true" ForeColor="Red" Display="Dynamic"
                                        ValidationExpression="^[ A-Za-zñÑäÄëËïÏöÖüÜáéíóúáéíóúÁÉÍÓÚÂÊÎÔÛâêîôûàèìòùÀÈÌÒÙ-]{1,30}$"></asp:RegularExpressionValidator>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-8 col-md-8 offset-lg-2 offset-md-2 col-sm-12">
                            <div class="form-group input-group">
                                <label class="control-label col-sm-3">Primer Apellido <span class="text-danger">*</span></label>
                                <div class="col-md-8 col-sm-9">
                                    <asp:TextBox ID="txtApellido1" CssClass="form-control" ToolTip="Primer apellido" placeholder="Ingrese su primer apellido" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="* Debe indicar su primer apellido" ControlToValidate="txtApellido1" SetFocusOnError="true" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3"
                                        runat="server"
                                        ErrorMessage="* El primer apellido debe de ser maximo de 30 letras."
                                        ControlToValidate="txtApellido1"
                                        SetFocusOnError="true" ForeColor="Red" Display="Dynamic"
                                        ValidationExpression="^[ A-Za-zñÑäÄëËïÏöÖüÜáéíóúáéíóúÁÉÍÓÚÂÊÎÔÛâêîôûàèìòùÀÈÌÒÙ-]{1,30}$"></asp:RegularExpressionValidator>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-8 col-md-8 offset-lg-2 offset-md-2 col-sm-12">
                            <div class="form-group input-group">
                                <label class="control-label col-sm-3">Segundo Apellido <span class="text-danger">*</span></label>
                                <div class="col-md-8 col-sm-9">
                                    <asp:TextBox ID="txtApellido2" CssClass="form-control" placeholder="Ingrese su segundo apellido" ToolTip="Segundo apellido" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="* Debe indicar su segundo apellido" ControlToValidate="txtApellido2" SetFocusOnError="true" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator4"
                                        runat="server"
                                        ErrorMessage="* El segundo apellido debe de ser maximo de 30 letras."
                                        ControlToValidate="txtApellido2"
                                        SetFocusOnError="true" ForeColor="Red" Display="Dynamic"
                                        ValidationExpression="^[ A-Za-zñÑäÄëËïÏöÖüÜáéíóúáéíóúÁÉÍÓÚÂÊÎÔÛâêîôûàèìòùÀÈÌÒÙ-]{1,30}$"></asp:RegularExpressionValidator>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-8 col-md-8 offset-lg-2 offset-md-2 col-sm-12">
                            <div class="form-group input-group">
                                <label class="control-label col-sm-3">N° de teléfono. <span class="text-danger">*</span></label>
                                <div class="col-md-8 col-sm-8">
                                    <div class="form-group input-group">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text"><i class="fa fa-phone"></i></span>
                                        </div>
                                        <asp:TextBox ID="txtTelefono" placeholder="Ingrese su número de teléfono" CssClass="form-control" ToolTip="Teléfono" runat="server"></asp:TextBox>
                                    </div>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="* Debe digitar el número de teléfono de contacto" ControlToValidate="txtTelefono" SetFocusOnError="true" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator5"
                                        runat="server"
                                        ErrorMessage="* El teléfono solo debe contener números (Sin guiones)."
                                        ControlToValidate="txtTelefono"
                                        SetFocusOnError="true" ForeColor="Red" Display="Dynamic"
                                        ValidationExpression="^\d{8}$"></asp:RegularExpressionValidator>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-8 col-md-8 offset-lg-2 offset-md-2 col-sm-12">
                            <div class="form-group input-group">
                                <label class="control-label col-sm-3">Direccion <span class="text-danger">*</span></label>
                                <div class="col-md-8 col-sm-9">
                                    <asp:TextBox ID="txtDireccion" CssClass="form-control" placeholder="Ingrese su dirección de residencia" TextMode="MultiLine" Rows="3" ToolTip="Dirección" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="* Debe indicar la dirección" ControlToValidate="txtDireccion" SetFocusOnError="true" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-8 col-md-8 offset-lg-2 offset-md-2 col-sm-12">
                            <div class="form-group input-group">
                                <label class="control-label col-sm-3">Contraseña <span class="text-danger">*</span></label>
                                <div class="col-md-8 col-sm-8">
                                    <div class="form-group input-group">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text"><i class="fa fa-lock"></i></span>
                                        </div>
                                        <asp:TextBox ID="txtContrasenia" placeholder="Ingrese su contraseña" CssClass="form-control" type="password" ToolTip="Contraseña" runat="server"></asp:TextBox>

                                    </div>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="* Debe digitar una contraseña" ControlToValidate="txtContrasenia" SetFocusOnError="true" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-8 col-md-8 offset-lg-2 offset-md-2 col-sm-12">
                            <div class="form-group input-group">
                                <label class="control-label col-sm-3">Confirmar contraseña <span class="text-danger">*</span></label>
                                <div class="col-md-8 col-sm-8">
                                    <div class="form-group input-group">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text"><i class="fa fa-lock"></i></span>
                                        </div>
                                        <asp:TextBox ID="txtConfirmaContrasenia" placeholder="Confirme su contraseña" type="password" CssClass="form-control" ToolTip="Confirmar Contraseña" runat="server"></asp:TextBox>

                                    </div>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="* Debe digitar una contraseña" ControlToValidate="txtConfirmaContrasenia" SetFocusOnError="true" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                    <asp:CompareValidator ID="CompareValidator1" runat="server"
                                        ControlToValidate="txtConfirmaContrasenia"
                                        CssClass="ValidationError" SetFocusOnError="true" ForeColor="Red" Display="Dynamic"
                                        ControlToCompare="txtContrasenia"
                                        ErrorMessage="* Las contraseñas no coinciden" />
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-8 col-md-8 offset-lg-2 offset-md-2 col-sm-12">
                            <div class="form-group">
                                <div class="col-sm-offset-3 col-sm-10">
                                    <asp:Button ID="btnRegistrarse" CssClass="btn btn-primary" runat="server"
                                        Text="Registrarse" OnClick="btnRegistrarse_Click" />
                                </div>
                            </div>
                            <p class="text-center">¿Ya tienes una cuenta?
                                <asp:HyperLink ID="hpLnkIniciarSesion" NavigateUrl="~/Registro.aspx" runat="server">Iniciar Sesión</asp:HyperLink></p>
                        </div>
                    </div>

                </div>
            </div>

        </div>
    </section>
</asp:Content>
