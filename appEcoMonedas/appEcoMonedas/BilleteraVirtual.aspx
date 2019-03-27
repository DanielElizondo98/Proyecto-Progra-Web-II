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
        <%--<section class="bar background-pentagon no-mb">--%>
        <div class="container">
            <div class="row showcase text-center">
                <div class="col-md-4 col-sm-4">
                    <div class="item">
                        <div class="icon-outlined icon-sm icon-thin"><i class="fa fa-money"></i></div>
                        <h4>
                            <asp:Label runat="server" ID="lblGeneradas" CssClass="h1 counter"></asp:Label><br />
                            Ecomonedas Generadas</h4>
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
                <%--<div class="col-md-3 col-sm-6">
              <div class="item">
                <div class="icon-outlined icon-sm icon-thin"><i class="fa fa-font"></i></div>
                <h4><span class="h1 counter">923</span><br>Magazines and Brochures</h4>
              </div>
            </div>--%>
            </div>
        </div>
        <%--</section>--%>
    </section>

</asp:Content>
