<%@ Page Title="" Language="C#" MasterPageFile="~/PrincipalAdministrador.Master" AutoEventWireup="true" CodeBehind="MantenimientoCupon.aspx.cs" Inherits="appEcoMonedas.MantenimientoCupon" %>

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

            <div class="row">
                <div class="col-lg-4 col-md-4 col-sm-12">
                    <div class="row">
                        <div class="panel-heading text-center w-100">
                            <h3 class="panel-title w-100">Datos del Cupón</h3>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12">
                            <div class="form-group row mb-4">
                                <asp:Label ID="lblNombre" runat="server" Text="Nombre"></asp:Label>
                                <asp:TextBox ID="txtNombre" CssClass="form-control" ToolTip="Nombre del Cupón" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="* Debe ingresar el nombre del cupón" ControlToValidate="txtNombre" SetFocusOnError="true" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1"
                                    runat="server"
                                    ErrorMessage="El nombre solo puede contener letras"
                                    ControlToValidate="txtNombre"
                                    ValidationExpression="[ A-Za-zñÑäÄëËïÏöÖüÜáéíóúáéíóúÁÉÍÓÚÂÊÎÔÛâêîôûàèìòùÀÈÌÒÙ-]+"></asp:RegularExpressionValidator>
                            </div>
                            <div class="form-group row mb-4">
                                <asp:Label ID="lblDescripcion" runat="server" Text="Descripción"></asp:Label>
                                <asp:TextBox ID="txtDescripcion" CssClass="form-control" TextMode="MultiLine" ToolTip="Descripción del Cupón" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="* Debe ingresar una Descripción para el cupón" ControlToValidate="txtDescripcion" SetFocusOnError="true" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                            </div>
                            <div class="form-group row">
                                <asp:Label ID="lblPrecio" runat="server" Text="Precio de Canje"></asp:Label>
                                <div class="form-group w-100">
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text"><i class="fa fa-money"></i></span>
                                        </div>
                                        <asp:TextBox ID="txtPrecio" runat="server" CssClass="form-control" ToolTip="Precio que costará el Canje del mismo"></asp:TextBox>
                                        <div class="input-group-append">
                                            <span class="input-group-text">.00</span>
                                        </div>
                                    </div>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="* Debe ingresar el precio de canje del cupón" ControlToValidate="txtPrecio" SetFocusOnError="true" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator
                                        ID="RegularExpressionValidator2"
                                        runat="server"
                                        Text="* El precio solo debe contener números"
                                        ControlToValidate="txtPrecio"
                                        SetFocusOnError="true" ForeColor="Red" Display="Dynamic"
                                        ValidationExpression="^[0-9]*(\.)?[0-9]?[0-9]?$"></asp:RegularExpressionValidator>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="archivoImagen" class="control-label col-12">Imagen</label>
                                <asp:Image ID="imgMaterial" CssClass="col-12 img-fluid img-thumbnail" AlternateText="Imagen del Cupón" Height="16em" runat="server" />
                                <asp:FileUpload ID="archivoImagen" CssClass="form-control-file" runat="server" />
                                <asp:RequiredFieldValidator ID="rqvArchivoImagen" runat="server" ErrorMessage="* Debe seleccionar la imagen representativa del Cupón" ControlToValidate="archivoImagen" SetFocusOnError="true" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                            </div>
                            <div class="form-group row">
                                <asp:HiddenField ID="hiddenID" runat="server" />
                                <asp:Button ID="btnGuardar" CssClass="btn btn-primary mr-2" runat="server"
                                    Text="Guardar" OnClick="btnGuardar_Click" />
                                <asp:Button ID="btnLimpiar" CssClass="btn btn-secondary" runat="server" CausesValidation="false"
                                    Text="Limpiar" OnClick="btnLimpiar_Click" />
                            </div>
                        </div>
                    </div>
                </div>

                <!--Lista-->
                <div class="offset-lg-1 offset-md-1 col-lg-7 col-md-7 col-sm-12">
                    <div class="row">
                        <div class="panel-heading w-100 text-center">
                            <h3 class="panel-title w-100">Lista de Cupones</h3>
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
                                            AutoGenerateColumns="false" DataKeyNames="ID" OnRowDataBound="grvListado_RowDataBound"
                                            OnSelectedIndexChanged="grvListado_SelectedIndexChanged" OnRowEditing="grvListado_RowEditing" ShowHeaderWhenEmpty="true">
                                            <Columns>
                                                <asp:BoundField DataField="Nombre" HeaderText="Nombre"></asp:BoundField>
                                                <asp:BoundField DataField="Descripcion" HeaderText="Descripción"></asp:BoundField>
                                                <asp:BoundField DataField="Precio_Canje" HeaderText="Precio"></asp:BoundField>
                                                <asp:TemplateField HeaderText="Estado">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblEstado" runat="server" Text='<%# Convert.ToInt32(Eval("Log_Activo"))==0? "Inactivo":"Activo" %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
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
