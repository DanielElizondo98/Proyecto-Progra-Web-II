<%@ Page Title="" Language="C#" MasterPageFile="~/PrincipalAdministrador.Master" AutoEventWireup="true" CodeBehind="MantenimientoCentro.aspx.cs" Inherits="appEcoMonedas.MantenimientoCentro" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="js/filtroTablas.js"></script>
    <script src="js/Custom.js"></script>
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
                            <h3 class="panel-title w-100">Datos del Centro</h3>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12">
                            <div class="form-group row mb-4">
                                <asp:Label ID="lblNombre" runat="server" Text="Nombre"></asp:Label>
                                <asp:TextBox ID="txtNombre" CssClass="form-control" ToolTip="Nombre del Centro de Acopio" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="* Debe ingresar el nombre del centro de acopio" ControlToValidate="txtNombre" SetFocusOnError="true" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1"
                                    runat="server"
                                    ErrorMessage="El nombre solo puede contener letras"
                                    ControlToValidate="txtNombre"
                                    ValidationExpression="[ A-Za-zñÑäÄëËïÏöÖüÜáéíóúáéíóúÁÉÍÓÚÂÊÎÔÛâêîôûàèìòùÀÈÌÒÙ-]+"></asp:RegularExpressionValidator>
                            </div>
                            <div class="form-group row mb-4">
                                <asp:Label ID="lblProvincia" runat="server" Text="Provincia"></asp:Label>
                                <asp:DropDownList ID="ddlProvincias"
                                    runat="server"
                                    CssClass="form-control"
                                    DataTextField="Descripcion"
                                    DataValueField="ID">
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="* Debe seleccionar la provincia a la que pertenece el centro de acopio" ControlToValidate="ddlProvincias" SetFocusOnError="true" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                            </div>
                            <div class="form-group row mb-4">
                                <asp:Label ID="lblOtrasSenas" runat="server" Text="Otras señas (dirección exacta)"></asp:Label>
                                <asp:TextBox ID="txtOtrasSenas" CssClass="form-control" TextMode="MultiLine" ToolTip="Otras señas (dirección exacta donde se encuentra el centro de acopio)" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="* Debe ingresar una dirección detallada de dónde se encuentra el centro de acopio" ControlToValidate="txtOtrasSenas" SetFocusOnError="true" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                            </div>
                            <div class="form-group row mb-4">
                                <asp:Label ID="lblAdminAcopio" runat="server" Text="Administrador de Centro de Acopio"></asp:Label>
                                <asp:DropDownList ID="ddlAdminsAcopio"
                                    runat="server"
                                    CssClass="form-control" 
                                    DataTextField="Correo"
                                    DataValueField="Correo">
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="* Debe seleccionar el administrador del centro de acopio" ControlToValidate="ddlAdminsAcopio" SetFocusOnError="true" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                            </div>
                            <div class="form-group row">
                                <asp:HiddenField ID="hiddenID" runat="server" />
                                <asp:Button ID="btnGuardar" CssClass="btn btn-primary mr-2" runat="server"
                                    Text="Guardar" OnClick="btnGuardar_Click" />
                                <asp:Button ID="btnLimpiar" CssClass="btn btn-secondary" runat="server"
                                    Text="Limpiar" OnClick="btnLimpiar_Click" />
                            </div>
                        </div>
                    </div>
                </div>

                <!--Lista-->
                <div class="offset-lg-1 offset-md-1 col-lg-7 col-md-7 col-sm-12">
                    <div class="row">
                        <div class="panel-heading w-100 text-center">
                            <h3 class="panel-title w-100">Lista de Centros de Acopio</h3>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12">
                            <div class="row mb-3">
                                <div class="col-lg-8 col-md-8 col-sm-12">
                                    <div class="input-group">
                                        <input class="form-control" id="system-search" name="q" placeholder="Filtrar por..." />
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-4 col-sm-12">
                                    <div class="form-group form-check">
                                        <asp:Label ID="lblBuscarInactivos" CssClass="form-check-label" AssociatedControlID="chkCargarInactivos" runat="server" Text="Cargar Inactivos"></asp:Label>
                                        <asp:CheckBox ID="chkCargarInactivos" CssClass="form-check-inline" OnCheckedChanged="chkCargarInactivos_CheckedChanged" AutoPostBack="true" runat="server" />
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-12">
                                    <div class="table-responsive" style="height: 36.5em !important; overflow: auto;">
                                        <asp:GridView ID="grvListado" runat="server"
                                            CssClass="table table-hover table-list-search" GridLines="none"
                                            AutoGenerateColumns="false" DataKeyNames="ID"
                                            OnSelectedIndexChanged="grvListado_SelectedIndexChanged" OnRowEditing="grvListado_RowEditing" ShowHeaderWhenEmpty="true">
                                            <Columns>
                                                <asp:BoundField DataField="Nombre" HeaderText="Nombre"></asp:BoundField>
                                                <asp:BoundField DataField="Usuario.Nombre" HeaderText="Administrador"></asp:BoundField>
                                                <asp:BoundField DataField="Provincia.Descripcion" HeaderText="Provincia"></asp:BoundField>
                                                <asp:BoundField DataField="Otras_Senias" HeaderText="Otras señas"></asp:BoundField>
                                                <asp:CommandField ShowSelectButton="true" HeaderText="Modificar" SelectText="Modificar" />
                                                <asp:CommandField ShowEditButton="true" HeaderText="Cambiar el Estado" EditText="Cambiar Estado" />
                                            </Columns>
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
