<%@ Page Title="" Language="C#" MasterPageFile="~/PrincipalAdminCentro.Master" AutoEventWireup="true" CodeBehind="DetalleCanjeCentro.aspx.cs" Inherits="appEcoMonedas.DetalleCanjeCentro" %>

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
                                Nombre: <asp:Label ID="lblClienteCanje" CssClass="text-muted h5" runat="server" Text=""></asp:Label><br />
                                Teléfono: <asp:Label ID="lblTelCliente" CssClass="text-muted h5" runat="server" Text=""></asp:Label><br />
                                Correo: <asp:HyperLink ID="hlnkCorreoCliente" CssClass="text-muted h5 text-primary" runat="server"></asp:HyperLink><br />
                            </p>
                        </div>
                        <div class="col-md-6 text-right">
                            <h3 class="text-uppercase">Centro de Acopio</h3>
                            <p>
                                Nombre: <asp:Label ID="lblNombreCentro" CssClass="text-muted h5" runat="server" Text=""></asp:Label><br />
                                Administrador: <asp:Label ID="lblAdminCentro" CssClass="text-muted h5" runat="server" Text=""></asp:Label><br />
                                Direccion: <asp:Label ID="lblDireccionCentro" CssClass="text-muted h5" runat="server" Text=""></asp:Label><br />
                            </p>
                        </div>
                    </div>
                    <div class="box" style="margin: 0px 0 !important;">
                        <div class="table-responsive">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th colspan="2" class="border-top-0">Product</th>
                                        <th class="border-top-0">Quantity</th>
                                        <th class="border-top-0">Unit price</th>
                                        <th class="border-top-0">Discount</th>
                                        <th class="border-top-0">Total</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td><a href="#">
                                            <img src="img/detailsquare.jpg" alt="White Blouse Armani" class="img-fluid" /></a></td>
                                        <td><a href="#">White Blouse Armani</a></td>
                                        <td>2</td>
                                        <td>$123.00</td>
                                        <td>$0.00</td>
                                        <td>$246.00</td>
                                    </tr>
                                    <tr>
                                        <td><a href="#">
                                            <img src="img/basketsquare.jpg" alt="Black Blouse Armani" class="img-fluid" /></a></td>
                                        <td><a href="#">Black Blouse Armani</a></td>
                                        <td>1</td>
                                        <td>$200.00</td>
                                        <td>$0.00</td>
                                        <td>$200.00</td>
                                    </tr>
                                </tbody>
                            </table>
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
                                <li class="nav-item"><a href="ListaCanjesCentro.aspx" class="nav-link active"><i class="fa fa-files-o"></i>Canjes</a></li>
                                <li class="nav-item"><a href="#" class="nav-link"><i class="fa fa-leaf"></i>EcoMonedas Generadas</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
