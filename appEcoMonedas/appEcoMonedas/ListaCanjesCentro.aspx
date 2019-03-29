<%@ Page Title="" Language="C#" MasterPageFile="~/PrincipalAdminCentro.Master" AutoEventWireup="true" CodeBehind="ListaCanjesCentro.aspx.cs" Inherits="appEcoMonedas.ListaCanjesCentro" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="js/filtroTablas.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="heading-breadcrumbs">
        <div class="container">
            <div class="row d-flex align-items-center flex-wrap">
                <div class="col-12">
                    <h1 class="h2">Canjes en
                        <asp:Label ID="lblNombreCentroCabecera" runat="server" Text=""></asp:Label></h1>
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
                        Lista de todos los canjes realizadas por 
                        <asp:Label ID="lblNombreCentroInformacion" runat="server" Text=""></asp:Label>.<span class="text-muted">
                            <br />
                            Contiene el cliente y el administrador que la realizó, la fecha entre otros valores.</span>
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
                                            <asp:HyperLink ID="HyperLink1" CssClass="btn btn-template-outlined btn-sm" NavigateUrl='<%# Eval("ID", "~/DetalleCanjeCentro.aspx?IDCanje={0}") %>' runat="server">Ver <i class="fa fa-eye"></i></asp:HyperLink>
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
                            <h3 class="h4 panel-title">Canje de Materiales</h3>
                        </div>
                        <div class="panel-body">
                            <ul class="nav nav-pills flex-column text-sm">
                                <li class="nav-item"><a href="ListaCanjesCentro.aspx" class="nav-link active"><i class="fa fa-files-o"></i>Canjes</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
