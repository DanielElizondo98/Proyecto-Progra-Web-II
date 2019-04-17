<%@ Page Title="" Language="C#" MasterPageFile="~/PrincipalCliente.Master" AutoEventWireup="true" CodeBehind="CuponesUsuario.aspx.cs" Inherits="appEcoMonedas.CuponesUsuario" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div id="heading-breadcrumbs">
        <div class="container">
            <div class="row d-flex align-items-center flex-wrap">
                <div class="col-md-12">
                    <h1 class="h2">Mis Cupones</h1>
                </div>
            </div>
        </div>
    </div>

    <div class="content">
        <div class="container">
            <div class="row bar" style="width: 100%">
                <div id="blog-listing-medium" class="col-md-9">
                    <asp:ListView ID="lvCuponesCanjear" runat="server"
                        DataKeyNames="ID" GroupItemCount="1"
                        ItemType="Contexto.Canje" SelectMethod="ListadoCanjear">

                        <EmptyDataTemplate>
                            <div class="row">
                                <div class="col-lg-12">
                                    <asp:Label ID="lblMensaje" runat="server" Width="100%" CssClass="alert alert-dismissible alert-info" Text="No hay cupones consumibles"></asp:Label>
                                </div>
                            </div>
                        </EmptyDataTemplate>
                        <EmptyItemTemplate>
                            <div class="col-lg-6"></div>
                        </EmptyItemTemplate>
                        <GroupTemplate>
                            <div class="row">
                                <asp:PlaceHolder ID="itemPlaceholder" runat="server"></asp:PlaceHolder>
                            </div>
                        </GroupTemplate>
                        <ItemTemplate>
                            <section class="post" style="width: 100%;">
                                <div class="row" style="width: 100%;">
                                    <div class="col-md-3">
                                        <div class="image">
                                            <asp:Image ID="imgCupon" runat="server" class="img-fluid" ImageUrl='<%# Eval("Cupon.Imagen", "~/imagenes/cupon/{0}")%>' />
                                        </div>
                                    </div>
                                    <div class="col-md-9">
                                        <asp:Label ID="Label2" runat="server" CssClass="h3 text-secondary float-lg-left"><i class="fa fa-calendar"> <%#:Item.FechaCanje.ToShortDateString()%>  </i></asp:Label>
                                        <br />
                                        <br />

                                        <h2 class="h3 mt-0 " style="color: #4fbfa8;"><%#:Item.Cupon.Nombre%></h2>
                                        <p class="intro">Descripción del Cupón:   <%#:Item.Cupon.Descripcion%></p>

                                        <div class="d-flex flex-wrap justify-content-between text-xs">
                                            <p class="author-category">Costo del Cupón:   <%#:String.Format("‎{0:N2} Ecomonedas", Item.Cupon.Precio_Canje)%></p>
                                        </div>

                                        <p class="text-right">
                                            <asp:HiddenField ID="hfCanjeID" Value='<%# Eval("ID")%>' runat="server" />
                                            <asp:LinkButton ID="btnImprimir" runat="server" CssClass="btn btn-template-outlined" OnClick="btnImprimir_Click1">Imprimir este Cupón  <i class="fa fa-chevron-right"></i></asp:LinkButton>
                                        </p>
                                    </div>
                                </div>
                            </section>
                        </ItemTemplate>
                        <LayoutTemplate>
                            <div class="container">
                                <asp:PlaceHolder ID="groupPlaceHolder" runat="server"></asp:PlaceHolder>
                            </div>
                        </LayoutTemplate>
                    </asp:ListView>
                </div>

                <div class="row">
                    <hr />
                </div>

                <div class="col col-md-3">
                    <div class="panel panel-default sidebar-menu">
                        <div class="panel-heading">
                            <h3 class="h4 panel-title">Cupones Consumibles</h3>
                        </div>
                        <div class="panel-body text-widget">
                            <p>
                                Los cupones que se muestran en esta lista se encuentran disponibles para ser consumidos, 
                                solo debe imprimirlo y presentarlo en los establecimientos que acepten el cupón 
                                (establecimientos, tiendas y servicios sociados al proyecto ECO-Monedas). 
                                Una vez impreso el cupón este será marcado como consumido inmediatamente.
                            </p>
                        </div>
                    </div>
                </div>
            </div>


            <div class="row bar" style="width: 100%">
                <div id="blog-listing-medium1" class="col-md-9">
                    <asp:ListView ID="ListView1" runat="server"
                        DataKeyNames="ID" GroupItemCount="1"
                        ItemType="Contexto.Canje" SelectMethod="ListadoCanjeados">

                        <EmptyDataTemplate>
                            <div class="row">
                                <div class="col-lg-12">
                                    <asp:Label ID="lblMensaje" runat="server" Width="100%" CssClass="alert alert-dismissible alert-info" Text="No hay Cupones Consumidos"></asp:Label>
                                </div>
                            </div>
                        </EmptyDataTemplate>
                        <EmptyItemTemplate>
                            <div class="col-lg-6"></div>
                        </EmptyItemTemplate>
                        <GroupTemplate>
                            <div class="row">
                                <asp:PlaceHolder ID="itemPlaceholder" runat="server"></asp:PlaceHolder>
                            </div>
                        </GroupTemplate>
                        <ItemTemplate>
                            <section class="post" style="width: 100%;margin-bottom:3em;">
                                <div class="row" style="width: 100%;">
                                    <div class="col-md-3">
                                        <div class="image">
                                            <asp:Image ID="imgCupon" runat="server" class="img-fluid" ImageUrl='<%# Eval("Cupon.Imagen", "~/imagenes/cupon/{0}")%>' />
                                        </div>
                                    </div>
                                    <div class="col-md-9">
                                        <asp:Label ID="Label1" runat="server" CssClass="h3 text-secondary float-lg-left"><i class="fa fa-calendar"> <%#:Item.FechaCanje.ToShortDateString()%>  </i></asp:Label>
                                        <br />
                                        <br />

                                        <h2 class="h3 mt-0 " style="color: #4fbfa8;"><%#:Item.Cupon.Nombre%></h2>
                                        <p class="intro">Descripción del Cupón:   <%#:Item.Cupon.Descripcion%></p>

                                        <div class="d-flex flex-wrap justify-content-between text-xs">
                                            <p class="author-category">Costo del Cupón:   <%#:String.Format("‎{0:N2} Ecomonedas", Item.Cupon.Precio_Canje)%></p>
                                        </div>
                                    </div>
                                </div>
                            </section><br /><br />
                        </ItemTemplate>
                        <LayoutTemplate>
                            <div class="container">
                                <asp:PlaceHolder ID="groupPlaceHolder" runat="server"></asp:PlaceHolder>
                            </div>
                        </LayoutTemplate>
                    </asp:ListView>
                </div>

                <div class="col col-md-3">
                    <div class="panel panel-default sidebar-menu">
                        <div class="panel-heading">
                            <h3 class="h4 panel-title">Cupones Consumidos</h3>
                        </div>
                        <div class="panel-body text-widget">
                            <p>
                                Los cupones que se muestran en esta lista ya han sido consumidos por lo tanto no se encuentran disponibles para su impresión. 
                                Un cupón es consumido al momento que después de su compra se imprime para su uso.
                            </p>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>

</asp:Content>
