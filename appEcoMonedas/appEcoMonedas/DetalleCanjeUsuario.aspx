<%@ Page Title="" Language="C#" MasterPageFile="~/PrincipalCliente.Master" AutoEventWireup="true" CodeBehind="DetalleCanjeUsuario.aspx.cs" Inherits="appEcoMonedas.DetalleCanjeUsuario" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="heading-breadcrumbs">
        <div class="container">
            <div class="row d-flex align-items-center flex-wrap">
                <div class="col-12">
                    <h1 class="h2">Canje #<asp:Label ID="lblCanjeNumeroCabecera" runat="server" Text=""></asp:Label></h1>
                </div>
            </div>
        </div>
    </div>
    <div id="content">
        <div class="container">
            <div class="row bar">
                <div id="customer-order" class="col-lg-9">
                    <p class="lead">
                        Canje #<asp:Label ID="lblCanjeNumeroInfo" runat="server" Text=""></asp:Label>
                        <br />
                        <span class="text-muted">Realizada el <strong>
                            <asp:Label ID="lblFechaCanjeInfo" runat="server" Text=""></asp:Label></strong></span>
                    </p>
                    <div class="row addresses p-4" style="border-top: 1px solid #ddd;">
                        <div class="col-md-6 text-left">
                            <h3 class="text-uppercase">Cliente</h3>
                            <p>
                                Nombre:
                                <asp:Label ID="lblClienteCanje" CssClass="text-muted h5" runat="server" Text=""></asp:Label><br />
                                Teléfono:
                                <asp:Label ID="lblTelCliente" CssClass="text-muted h5" runat="server" Text=""></asp:Label><br />
                                Correo:
                                <asp:HyperLink ID="hlnkCorreoCliente" CssClass="text-muted h5 text-primary" runat="server"></asp:HyperLink><br />
                            </p>
                        </div>
                        <div class="col-md-6 text-right">
                            <h3 class="text-uppercase">Centro de Acopio</h3>
                            <p>
                                Nombre:
                                <asp:Label ID="lblNombreCentro" CssClass="text-muted h5" runat="server" Text=""></asp:Label><br />
                                Administrador:
                                <asp:Label ID="lblAdminCentro" CssClass="text-muted h5" runat="server" Text=""></asp:Label><br />
                                Direccion:
                                <asp:Label ID="lblDireccionCentro" CssClass="text-muted h5" runat="server" Text=""></asp:Label><br />
                            </p>
                        </div>
                    </div>
                    <div class="box" style="margin: 0px 0 !important; padding-bottom: 50px;">
                        <div class="table-responsive">
                            <asp:GridView ID="grvListaMateriales" runat="server"
                                AutoGenerateColumns="false" DataKeyNames="ID"
                                GridLines="none" CellPadding="4"
                                CssClass="table">
                                <Columns>
                                    <asp:BoundField DataField="Material.Nombre" HeaderText="Material"></asp:BoundField>

                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:Image ID="Image1" runat="server" BorderWidth="5" BorderColor='<%# System.Drawing.ColorTranslator.FromHtml(Eval("Material.ID_Color").ToString()) %>' CssClass="img-fluid image1 p-1" ImageUrl='<%# Eval("Material.Imagen", "~/imagenes/material/{0}")%>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="Cantidad" HeaderText="Cantidad"></asp:BoundField>
                                    <asp:BoundField HeaderText="Precio Unitario" DataField="Material.Precio" DataFormatString="{0:N2} EcoMonedas"></asp:BoundField>
                                    <asp:BoundField DataField="Sub_Total" DataFormatString="{0:N2}" HeaderText="Total"></asp:BoundField>
                                </Columns>
                            </asp:GridView>
                        </div>
                        <div class="float-right mb-3">
                            <strong>
                                <asp:Label ID="LabelTotalText" runat="server" Text="Total de EcoMonedas generadas: "></asp:Label>
                                <asp:Label ID="lblTotal" runat="server" Text="" Width="150px"></asp:Label>
                            </strong>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 mt-4 mt-md-0">
                    <div class="panel panel-default sidebar-menu">
                        <div class="panel-heading">
                            <h3 class="h4 panel-title">Canje de Materiales</h3>
                        </div>
                        <div class="panel-body">

                            <ul class="nav nav-pills flex-column text-sm">
                                <li class="nav-item"><a href="PerfilCliente.aspx" class="nav-link"><i class="fa fa-id-card-o"></i>Editar Perfil</a></li>
                                <li class="nav-item"><a href="BilleteraVirtual.aspx" class="nav-link"><i class="fa fa-money"></i>Billetera</a></li>
                                <li class="nav-item"><a href="CuponesUsuario.aspx" class="nav-link"><i class="fa fa-exchange"></i>Historial de Cupones Canjeados</a></li>
                                <li class="nav-item"><a href="ListaCanjesUsuario.aspx" class="nav-link active"><i class="fa fa-exchange"></i>Canjes de materiales</a></li>
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
