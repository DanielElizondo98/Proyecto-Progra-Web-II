<%@ Page Title="" Language="C#" MasterPageFile="~/PrincipalAdminCentro.Master" AutoEventWireup="true" CodeBehind="ProcesarCanje.aspx.cs" Inherits="appEcoMonedas.ProcesarCanje" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="heading-breadcrumbs">
        <div class="container">
            <div class="row d-flex align-items-center flex-wrap">
                <div class="col-md-7">
                    <h1 class="h2">Procesar Canje</h1>
                </div>
            </div>
        </div>
    </div>
    <div id="content">
        <div class="container">
            <div class="row">
                <div id="customer-order" class="col-12">
                    <div class="box" style="margin: 40px 0 !important;">
                        <div class="card-header" style="background: #eae9e9;">
                            <div class="col-sm-6">
                                <label class="lead">Fecha Actual <strong><%= DateTime.Now.ToString("dd/MM/yyyy") %></strong> .</label>
                            </div>
                        </div>
                        <div class="card-body" style="background: #f7f7f7;">
                            <div class="row" style="">
                                <div class="col-lg-6 col-md-6 col-sm-12">
                                    <label for="lblNombreCentro" class="w-100">Nombre del centro de Acopio</label>
                                    <asp:Label ID="txtNombreCentro" CssClass="text-muted" runat="server" Text=""></asp:Label>
                                </div>
                                <div class="col-lg-6 col-md-6 col-sm-12">
                                    <label for="lblNombreAdminCentro" class="w-100">Administrador del Centro de Acopio</label>
                                    <asp:Label ID="txtNombreAdminCentro" CssClass="text-muted" runat="server" Text=""></asp:Label>
                                </div>
                            </div>
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                <ContentTemplate>
                                    <div class="mt-4 row" style="">
                                        <div class="col-lg-6 col-md-6 col-sm-12">
                                            <div class="form-group">
                                                <label for="lblBuscarCliente">Buscar cliente (Correo)</label>
                                                <div class="form-inline my-2 my-lg-0">
                                                    <asp:TextBox ID="txtBuscarCliente" CssClass="form-control mr-sm-2 w-75" placeholder="Correo del cliente" runat="server"></asp:TextBox>
                                                    <asp:LinkButton ID="btnBuscarCliente" CssClass="btn btn-info my-2 my-sm-0" OnClick="btnBuscarCliente_Click" ValidationGroup="ValidaCanje" runat="server"><i class="fa fa-search"></i></asp:LinkButton>
                                                </div>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="* Debe buscar un cliente por su correo" ValidationGroup="ValidaCanje" ControlToValidate="txtBuscarCliente" SetFocusOnError="true" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                                
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="* Busque el cliente para poder realizar el canje de EcoMonedas" ValidationGroup="validaProcesado" ControlToValidate="txtNombreCliente" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1"
                                                    runat="server"
                                                    ErrorMessage="* El correo no cumple con un formato válido. (Formato correo@correo.com)"
                                                    ControlToValidate="txtBuscarCliente" ValidationGroup="ValidaCanje"
                                                    SetFocusOnError="true" ForeColor="Red" Display="Dynamic"
                                                    ValidationExpression="^([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?){255}$"></asp:RegularExpressionValidator>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-6 col-md-6 col-sm-12">
                                            <div class="form-group">
                                                <label for="lblCorreoCliente">Correo del Cliente</label>
                                                <asp:TextBox ID="txtCorreoCliente" Enabled="false" CssClass="form-control" runat="server"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-lg-6 col-md-6 col-sm-12">
                                            <div class="form-group">
                                                <label for="lblNombreCliente">Nombre del Cliente</label>
                                                <asp:TextBox ID="txtNombreCliente" Enabled="false" CssClass="form-control" runat="server"></asp:TextBox>

                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <asp:Label ID="lblMensaje" runat="server" CssClass="col-12 alert alert-dismissible alert-danger" Visible="false" Text=""></asp:Label>
                                    </div>
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="btnBuscarCliente" EventName="Click" />
                                </Triggers>
                            </asp:UpdatePanel>
                        </div>
                    </div>

                    <div class="box" style="margin: 40px 0 !important;">
                        <div class="table-responsive">
                            <asp:GridView ID="grvCarrito" runat="server"
                                AutoGenerateColumns="false" DataKeyNames="IDMaterial"
                                GridLines="none" CellPadding="4"
                                CssClass="table">

                                <Columns>

                                    <asp:BoundField DataField="material.Nombre" HeaderText="Material"></asp:BoundField>

                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:Image ID="Image1" runat="server" BorderWidth="5" BorderColor='<%# System.Drawing.ColorTranslator.FromHtml(Eval("material.ID_Color").ToString()) %>' CssClass="img-fluid image1 p-1" ImageUrl='<%# Eval("material.Imagen", "~/imagenes/material/{0}")%>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:BoundField DataField="cantidad" HeaderText="Cantidad"></asp:BoundField>
                                    <asp:BoundField HeaderText="Precio Unitario" DataField="precioUnitario" DataFormatString="{0:N2} EcoMonedas"></asp:BoundField>
                                    <asp:TemplateField HeaderText="Total">
                                        <ItemTemplate>
                                            <asp:Label ID="lblTotal" runat="server" Text='<%#: String.Format("{0:N2}", ((Convert.ToDouble(Eval("cantidad"))) *  Convert.ToDouble(Eval("precioUnitario"))))%>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </div>
                        <div class="float-right mb-3">
                            <strong>
                                <asp:Label ID="LabelTotalText" runat="server" Text="Total de EcoMonedas generadas: "></asp:Label>
                                <asp:Label ID="lblTotal" runat="server" Text="" Width="150px"></asp:Label>
                            </strong>
                        </div>
                        <div class="box-footer d-flex justify-content-between align-items-center w-100" style="margin-top: 0px !important;">
                            <div class="row">
                                <div class="col-12">
                                <asp:HiddenField ID="hiddenIDCentro" runat="server" />
                                    <asp:HyperLink ID="btnVolverCarrito" CssClass="btn btn-default text-dark" NavigateUrl="~/Carrito.aspx" runat="server">Volver al carrito <i class="fa fa-chevron-left"></i></asp:HyperLink>
                                    <asp:LinkButton ID="btnProcesar" ValidationGroup="validaProcesado" OnClick="btnProcesar_Click" CssClass="btn btn-primary text-white" runat="server"><i class="fa fa-recycle gly-rotate-45"></i>  Procesar Canje</asp:LinkButton>
                                </div>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="* Debe buscar un cliente antes de realizar el canje. Proceda a buscar el cliente para efectuar el canje" ValidationGroup="validaProcesado" ControlToValidate="txtCorreoCliente" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                            </div>
                        </div>

                    </div>
                </div>

            </div>
        </div>
    </div>
</asp:Content>
