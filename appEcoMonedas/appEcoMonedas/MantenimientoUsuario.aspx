<%@ Page Title="" Language="C#" MasterPageFile="~/PrincipalAdministrador.Master" AutoEventWireup="true" CodeBehind="MantenimientoUsuario.aspx.cs" Inherits="appEcoMonedas.MantenimientoUsuario" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <main>
        <div class="container border-top pt-5">
            <div class="col-12 mb-4 text-center">
                <asp:Label ID="lblMensaje" runat="server" CssClass="row alert alert-dismissible alert-dan" Visible="false" Text=""></asp:Label>
            </div>
            <div class="row">
                <div class="col-lg-4 col-md-4 col-sm-12">
                    <div class="row">
                        <div class="panel-heading text-center w-100">
                            <h3 class="panel-title w-100">Datos del Usuario</h3>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12">
                            <div class="form-group row mb-4">
                                <asp:Label ID="lblCorreo" runat="server" Text="Correo"></asp:Label>
                                <asp:TextBox ID="txtCorreo" CssClass="form-control" ToolTip="Nombre del material" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="* El correo del usuario es requerido" ControlToValidate="txtCorreo" SetFocusOnError="true" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1"
                                    runat="server"
                                    ErrorMessage="* El correo no cumple con el un formato válido. (Formato correo@correo.com)"
                                    ControlToValidate="txtCorreo"
                                     SetFocusOnError="true" ForeColor="Red" Display="Dynamic"
                                    ValidationExpression="^([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$"></asp:RegularExpressionValidator>
                            </div>
                        </div>
                        <asp:Button ID="Button1" OnClick="Button1_Click" runat="server" Text="Button" />
                    </div>
                </div>
                <div class="offset-lg-1 offset-md-1 col-lg-7 col-md-7 col-sm-12">
                    <div class="row">
                        <div class="panel-heading w-100 text-center">
                            <h3 class="panel-title w-100">Lista de Usuarios</h3>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12">
                            <div class="row mb-3">
                                <div class="col-lg-8 col-md-8 col-sm-12">
                                    <div class="form-group">
                                        <asp:Label ID="lblFiltroTipoUsuario" AssociatedControlID="" runat="server" Text="Tipo de usuarios a cargar:"></asp:Label>
                                        <asp:DropDownList ID="ddlFiltroTipoUsuario"
                                            runat="server"
                                            DataTextField="Descripcion"
                                            DataValueField="ID"
                                            OnSelectedIndexChanged="ddlFiltroTipoUsuario_SelectedIndexChanged"
                                            AutoPostBack="true">
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-4 col-sm-12">
                                    <div class="form-group form-check">
                                        <asp:Label ID="lblBuscarInactivos" CssClass="form-check-label" AssociatedControlID="chkCargarInactivos" runat="server" Text="Cargar Inactivos"></asp:Label>
                                        <asp:CheckBox ID="chkCargarInactivos" CssClass="form-check-inline" OnCheckedChanged="chkCargarInactivos_CheckedChanged" AutoPostBack="true" runat="server" />
                                    </div>
                                </div>
                                <div class="col-lg-12 col-md-12 col-sm-12">
                                    <div class="input-group">
                                        <input class="form-control" id="system-search" name="q" placeholder="Filtrar por..." />
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-12">
                                    <div class="table-responsive" style="max-height: 36.5em !important;">
                                        <asp:GridView ID="grvListado" runat="server"
                                            CssClass="table table-hover table-list-search" GridLines="none"
                                            AutoGenerateColumns="false" DataKeyNames="ID"
                                            OnSelectedIndexChanged="grvListado_SelectedIndexChanged" OnRowEditing="grvListado_RowEditing" ShowHeaderWhenEmpty="true">
                                        </asp:GridView>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>
</asp:Content>
