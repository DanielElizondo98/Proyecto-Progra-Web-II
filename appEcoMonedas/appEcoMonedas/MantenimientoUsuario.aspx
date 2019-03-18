<%@ Page Title="" Language="C#" MasterPageFile="~/PrincipalAdministrador.Master" AutoEventWireup="true" CodeBehind="MantenimientoUsuario.aspx.cs" Inherits="appEcoMonedas.MantenimientoUsuario" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="js/filtroTablas.js"></script>
    <script src="js/Custom.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <main>
        <div class="container border-top pt-5">
            <div class="col-12 mb-4 text-center">
                <asp:Label ID="lblMensaje" runat="server" CssClass="row alert alert-dismissible alert-danger" Visible="false" Text=""></asp:Label>
            </div>
            <div class="row mb-3">
                <div class="col-lg-4 col-md-4 col-sm-12">
                    <div class="row">
                        <div class="panel-heading text-center w-100">
                            <h3 class="panel-title w-100">Datos del Usuario</h3>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12">
                            <div class="form-group row ">
                                <asp:Label ID="lblCorreo" runat="server" Text="Correo"></asp:Label>
                                <asp:TextBox ID="txtCorreo" CssClass="form-control" ToolTip="Correo" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="* El correo del usuario es requerido" ControlToValidate="txtCorreo" SetFocusOnError="true" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1"
                                    runat="server"
                                    ErrorMessage="* El correo no cumple con un formato válido. (Formato correo@correo.com)"
                                    ControlToValidate="txtCorreo"
                                    SetFocusOnError="true" ForeColor="Red" Display="Dynamic"
                                    ValidationExpression="^([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?){255}$"></asp:RegularExpressionValidator>
                            </div>
                            <div class="form-group row">
                                <asp:Label ID="lblNombre" runat="server" Text="Nombre"></asp:Label>
                                <asp:TextBox ID="txtNombre" CssClass="form-control" ToolTip="Nombre" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="* El nombre del usuario es requerido" ControlToValidate="txtNombre" SetFocusOnError="true" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator2"
                                    runat="server"
                                    ErrorMessage="* El nombre debe de ser maximo de 30 letras."
                                    ControlToValidate="txtNombre"
                                    SetFocusOnError="true" ForeColor="Red" Display="Dynamic"
                                    ValidationExpression="^[ A-Za-zñÑäÄëËïÏöÖüÜáéíóúáéíóúÁÉÍÓÚÂÊÎÔÛâêîôûàèìòùÀÈÌÒÙ-]{1,30}$"></asp:RegularExpressionValidator>
                            </div>
                            <div class="form-group row">
                                <asp:Label ID="lblApellido1" runat="server" Text="Primer Apellido"></asp:Label>
                                <asp:TextBox ID="txtApellido1" CssClass="form-control" ToolTip="Primer apellido" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="* El primer apellido del usuario es requerido" ControlToValidate="txtApellido1" SetFocusOnError="true" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator3"
                                    runat="server"
                                    ErrorMessage="* El primer apellido debe de ser maximo de 30 letras."
                                    ControlToValidate="txtApellido1"
                                    SetFocusOnError="true" ForeColor="Red" Display="Dynamic"
                                    ValidationExpression="^[ A-Za-zñÑäÄëËïÏöÖüÜáéíóúáéíóúÁÉÍÓÚÂÊÎÔÛâêîôûàèìòùÀÈÌÒÙ-]{1,30}$"></asp:RegularExpressionValidator>
                            </div>
                            <div class="form-group row">
                                <asp:Label ID="lblApellido2" runat="server" Text="Segundo Apellido"></asp:Label>
                                <asp:TextBox ID="txtApellido2" CssClass="form-control" ToolTip="Segundo apellido" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="* El segundo apellido del usuario es requerido" ControlToValidate="txtApellido2" SetFocusOnError="true" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator4"
                                    runat="server"
                                    ErrorMessage="* El segundo apellido debe de ser maximo de 30 letras."
                                    ControlToValidate="txtApellido2"
                                    SetFocusOnError="true" ForeColor="Red" Display="Dynamic"
                                    ValidationExpression="^[ A-Za-zñÑäÄëËïÏöÖüÜáéíóúáéíóúÁÉÍÓÚÂÊÎÔÛâêîôûàèìòùÀÈÌÒÙ-]{1,30}$"></asp:RegularExpressionValidator>
                            </div>
                            <div class="form-group row">
                                <asp:Label ID="lblDireccion" runat="server" Text="Dirección. (Es una breve descripción de la ubicacion donde vive)"></asp:Label>
                                <asp:TextBox ID="txtDireccion" CssClass="form-control" TextMode="MultiLine" Rows="3" ToolTip="Dirección" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="* La direccion del usuario es requerido" ControlToValidate="txtDireccion" SetFocusOnError="true" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                            </div>
                            <div class="form-group row">
                                <asp:Label ID="lblTelefono" runat="server" Text="Telefono: (Sin guiones)"></asp:Label>
                                <asp:TextBox ID="txtTelefono" CssClass="form-control" ToolTip="Telefono" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="* El telefono del usuario es requerido" ControlToValidate="txtTelefono" SetFocusOnError="true" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator5"
                                    runat="server"
                                    ErrorMessage="* El teléfono solo debe contener números (Sin guiones)."
                                    ControlToValidate="txtTelefono"
                                    SetFocusOnError="true" ForeColor="Red" Display="Dynamic"
                                    ValidationExpression="^\d{8}$"></asp:RegularExpressionValidator>
                            </div>
                            <div class="form-group row">
                                <label for="ddlRol">Rol del usuario</label>
                                <asp:DropDownList ID="ddlRol" Enabled="false" CssClass="form-control" runat="server" DataTextField="Descripcion" DataValueField="ID">
                                </asp:DropDownList>
                            </div>
                            <div class="form-group form-check row">
                                <asp:Label ID="lblGenerarContrasenia" CssClass="form-check-label h4" AssociatedControlID="chkGenerarContrasenia" runat="server" Text="Generar una nueva contraseña: "></asp:Label>
                                <asp:CheckBox ID="chkGenerarContrasenia" CssClass="form-check-inline" runat="server" />
                            </div>
                            <div class="form-group row">
                                <asp:HiddenField ID="hiddenCorreo" runat="server" />
                                <asp:Button ID="btnGuardar" CssClass="btn btn-primary mr-2" runat="server"
                                    Text="Guardar" OnClick="btnGuardar_Click" />
                                <input id="btnLimpia" type="button" value="Limpiar" class="btn btn-secondary" onclick="javascript: limpiarManteUsuario();" />
                            </div>
                        </div>
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
                                            runat="server" CssClass="form-control" 
                                            DataTextField="Descripcion" DataValueField="ID"
                                            OnSelectedIndexChanged="ddlFiltroTipoUsuario_SelectedIndexChanged"
                                            AutoPostBack="true">
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-4 col-sm-12">
                                    <div class="form-group form-check">
                                        <asp:Label ID="lblBuscarInactivos" CssClass="form-check-label h4" AssociatedControlID="chkCargarInactivos" runat="server" Text="Cargar Inactivos"></asp:Label>
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
                                    <div class="table-responsive" style="max-height: 36.5em !important; overflow: auto;">
                                        <asp:GridView ID="grvListado" runat="server"
                                            CssClass="table table-hover table-list-search" GridLines="none"
                                            AutoGenerateColumns="false" DataKeyNames="Correo" ItemType="Contexto.Usuario"
                                            OnSelectedIndexChanged="grvListado_SelectedIndexChanged" OnRowEditing="grvListado_RowEditing" ShowHeaderWhenEmpty="true">

                                            <Columns>
                                                <asp:BoundField DataField="Nombre" HeaderText="Nombre"></asp:BoundField>
                                                <asp:BoundField DataField="Apellido1" HeaderText="Primer Apellido"></asp:BoundField>
                                                <asp:BoundField DataField="Apellido2" HeaderText="Segundo Apellido"></asp:BoundField>

                                                <asp:BoundField DataField="Rol.Descripcion" HeaderText="Rol"></asp:BoundField>
                                                <asp:BoundField DataField="Correo" HeaderText="Correo"></asp:BoundField>
                                                <asp:TemplateField HeaderText="Estado">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblEstado" runat="server" Text='<%# Convert.ToInt32(Eval("Log_Activo"))==0? "Inactivo":"Activo" %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:CommandField ShowEditButton="true" HeaderText="Cambiar el Estado" EditText="Cambiar Estado" />
                                                <asp:CommandField ShowSelectButton="true" HeaderText="Modificar" SelectText="Modificar" />
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
