<%@ Page Title="" Language="C#" MasterPageFile="~/PrincipalCliente.Master" AutoEventWireup="true" CodeBehind="BilleteraVirtual.aspx.cs" Inherits="appEcoMonedas.BilleteraVirtual" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section style="background: url(img/chancho.jpg) center top no-repeat; background-size: cover;" class="bar no-mb color-white text-center bg-fixed relative-positioned">
        <div class="dark-mask"></div>
        <div class="container">
            <div class="icon icon-outlined icon-lg"><i class="fa fa-balance-scale"></i></div>
            <h1>Esta es su Billetera de Ecomonedas Virtual</h1>
            <p class="lead mb-0">
                En este espacio usted podrá consultar el estado de su billetera, es decir la cantidad total de monedas que ha generado fruto del reciclaje de materiales en nuestros centros de acopio,
                 al igual que las que ha consumido y las disponibles para la compra de cupones.
            </p>
            <br />
        </div>
        <div class="container">
            <div class="row showcase text-center">
                <div class="col-md-4 col-sm-4">
                    <div class="item">
                        <div class="icon-outlined icon-sm icon-thin"><i class="fa fa-money"></i></div>
                        <h4>
                            <asp:Label runat="server" ID="lblGeneradas" CssClass="h1 counter"></asp:Label><br />
                            Ecomonedas Generada</h4>
                        <p class="lead mb-0">Las Ecomonedas Generadas son todas las ganancias que se han recibico debido al intercambio de materiales de reciclaje.</p>
                    </div>
                </div>
                <div class="col-md-4 col-sm-4">
                    <div class="item">
                        <div class="icon-outlined icon-sm icon-thin"><i class="fa fa-database"></i></div>
                        <h4>
                            <asp:Label runat="server" ID="lblDisponibles" CssClass="h1 counter"></asp:Label>
                            <br />
                            Ecomonedas Disponibles</h4>
                        <p class="lead mb-0">Las Ecomonedas Disponibles son todas las ecomonedas libres para ser intercambiadas por cupones.</p>
                    </div>
                </div>
                <div class="col-md-4 col-sm-4">
                    <div class="item">
                        <div class="icon-outlined icon-sm icon-thin"><i class="fa fa-ticket"></i></div>
                        <h4>
                            <asp:Label runat="server" ID="lblGastadas" CssClass="h1 counter"></asp:Label>
                            <br />
                            Ecomonedas Gastadas</h4>
                        <p class="lead mb-0">Las Ecomonedas Gastadas son todas las ecomonedas que han sido intercambiadas por cupones.</p>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <section>

        <div class="row bar col-lg-10 offset-1">
            <div class="panel-heading">
                <h3>Recibo de Cupones Adquiridos</h3>
            </div>
            <p class="lead">En esta parte se le muestra la lista de todos los recibos de los cupones que ha adquirido con sus ecomonedas.</p>

            <div class="col-md-7">
                <div id="accordion" role="tablist" class="mb-5">
                    <asp:ListView ID="lvRecibos" runat="server"
                        ItemType="Contexto.Canje"
                        SelectMethod="ObtenerCanjesUsuario">
                        <EmptyDataTemplate>
                            <div class="row">
                                <div class="col-lg-12">
                                    <asp:Label ID="lblMensaje" runat="server" Width="100%" 
                                        CssClass="alert alert-dismissible alert-info" Text="No hay cupones consumidos hasta el momento. Consulte el Historial de Cupones"></asp:Label>
                                </div>
                            </div>
                        </EmptyDataTemplate>
                        <ItemTemplate>
                            <div class="card">
                                <div role="tab" class="card-header">
                                    <h5 class="mb-0"><a data-toggle="collapse" href="#<%#:Item.ID %>" aria-expanded="false" aria-controls="collapseOne"><%#:Item.Cupon.Nombre %> </a></h5>
                                    <h4 class="text-secondary"><%#:Item.FechaCanje.ToShortDateString()%></h4>
                                </div>

                                <div id="<%#:Item.ID %>" role="tabpanel" aria-labelledby="headingOne" data-parent="#accordion" class="collapse">
                                    <div class="card-body">
                                        <div class="row">
                                            <div class="col-md-3">
                                                <asp:Image ID="imgCupon" runat="server" CssClass="img-fluid" ImageUrl='<%# Eval("Cupon.Imagen", "~/imagenes/cupon/{0}")%>' />
                                            </div>
                                            <div class="col-md-5">
                                                <h4 class="h4" style="color: #4fbfa8">Descripción del Cupón:</h2>
                                                <p class="h5 text-secondary"><%#:Item.Cupon.Descripcion%></p>
                                            </div>
                                            <div class="col-md-4">
                                                <h4 class="h4" style="color: #4fbfa8">EcoMonedas Gastadas:</h2>
                                                <p class="h5 text-secondary"><%#:String.Format("‎{0:N2} Ecomonedas", Item.Cupon.Precio_Canje)%></p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:ListView>
                </div>
            </div>
            <div class="col-md-5">
                <div class="panel mx-auto">
                    <div class="panel-body">
                        <ul class="nav nav-pills flex-column text-sm">
                            <li class="nav-item"><a href="CuponesUsuario.aspx" class="nav-link"><i class="fa fa-file-o"></i>  Historial de Cupones Canjeados</a></li>
                            <li class="nav-item"><a href="ListaCanjesUsuario.aspx" class="nav-link"><i class="fa fa-exchange"></i>  Canjes de materiales</a></li>
                        </ul>
                    </div>
                </div>

                <asp:Image ID="imgCupon" runat="server" CssClass="img-fluid" ImageUrl="img/Iconos/ecoFriendly2.png" />
            </div>
        </div>
    </section>
</asp:Content>
