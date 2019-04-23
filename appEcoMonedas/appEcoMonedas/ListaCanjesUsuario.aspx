<%@ Page Title="" Language="C#" MasterPageFile="~/PrincipalCliente.Master" AutoEventWireup="true" CodeBehind="ListaCanjesUsuario.aspx.cs" Inherits="appEcoMonedas.ListaCanjesUsuario" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="js/filtroTablas.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="heading-breadcrumbs">
        <div class="container">
            <div class="row d-flex align-items-center flex-wrap">
                <div class="col-12">
                    <h1 class="h2">Ingresos por materiales</h1>
                </div>
            </div>
        </div>
    </div>
    <div id="content">
        <div class="container">
            <div class="row bar mb-0">
                <asp:Label ID="lblMensaje" runat="server" CssClass="col-12 alert alert-dismissible alert-danger" Visible="false" Text=""></asp:Label>
                <div id="customer-orders" class="col-md-9">
                    <p class="lead">
                        Lista de todos los canjes realizadas a su cuenta
                    </p>
                    <p class="lead">
                        Total de Ecomonedas generadas:
                        <span class="badge badge-primary text-white">
                            <asp:Label ID="lblTotalGenerado" runat="server" Text=""></asp:Label>
                            <i class="fa fa-leaf"></i>
                        </span>
                    </p>
                    <div class="row mb-3">
                        <div class="col-12">
                            <div class="input-group">
                                <input class="form-control" id="system-search" name="q" placeholder="Filtrar por..." />
                            </div>
                        </div>
                    </div>
                    <div class="box mt-0 mb-lg-0">
                        <div class="table-responsive">
                            <asp:GridView ID="grvCanjes" runat="server"
                                AutoGenerateColumns="false" DataKeyNames="ID"
                                GridLines="none" CellPadding="4" OnRowDataBound="grvCanjes_RowDataBound"
                                CssClass="table table-hover table-list-search">

                                <Columns>
                                    <asp:BoundField HeaderText="Canje" DataField="ID" DataFormatString="#{0}"></asp:BoundField>
                                    <asp:BoundField HeaderText="Fecha" DataField="Fecha" DataFormatString="{0:dd/MM/yyyy}"></asp:BoundField>
                                    <asp:BoundField HeaderText="Total EcoMonedas" DataField="Total_Ecomonedas" DataFormatString="{0:N2}"></asp:BoundField>
                                    <asp:BoundField DataField="ID_Cliente" HeaderText="Cliente"></asp:BoundField>
                                    <asp:TemplateField HeaderText="Acci&#243;n">
                                        <ItemTemplate>
                                            <asp:HyperLink ID="HyperLink1" CssClass="btn btn-template-outlined btn-sm" NavigateUrl='<%# Eval("ID", "~/DetalleCanjeUsuario.aspx?IDCanje={0}") %>' runat="server">Ver <i class="fa fa-eye"></i></asp:HyperLink>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 mt-4 mt-md-0">

                    <div class="panel panel-default sidebar-menu">
                        <div class="panel-heading">
                            <h3 class="h4 panel-title">Mi perfil</h3>
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
