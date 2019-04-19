<%@ Page Title="" Language="C#" MasterPageFile="~/PrincipalAdminCentro.Master" AutoEventWireup="true" CodeBehind="InicioAdminCentro.aspx.cs" Inherits="appEcoMonedas.InicioAdminCentro" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section style="background: url('img/Iconos/ReciclajeBackground.png') center center repeat; background-size: cover;" class="bar background-white relative-positioned">
        <div class="container">
            <!-- Carousel Start-->
            <div class="home-carousel">
                <div class="dark-mask mask-primary"></div>
                <div class="container">
                    <div class="homepage owl-carousel">
                        <div class="item">
                            <div class="row">
                                <div class="col-md-7">
                                    <img src="img/Iconos/308833.png" alt="" class="img-fluid" style="margin: auto; margin-top: 0em; width: 20em;" />
                                </div>
                                <div class="col-md-5">
                                    <h1>Canje de Materiales</h1>
                                    <p>
                                        Realice los procesos de Canje de materiales de una mánera fácil y ágil.<br />
                                        Acceda a la lista de Materiales y agregue los necesarios al carrito. <br />
                                        Defina la cantidad de materiales que se están procesando en el canje y el cliente al que pertenece.
                                    </p>
                                </div>
                            </div>
                        </div>
                        <div class="item">
                            <div class="row">
                                <div class="col-md-7 text-center">
                                    <img src="img/Iconos/lupa.png" alt="" class="img-fluid" style="margin: auto; margin-top: 0em; width: 20em;" />
                                </div>
                                <div class="col-md-5">
                                    <h2>Consulte</h2>
                                    <ul class="list-unstyled">
                                        <li>Podrá consultar el estado del Centro de Acopio a cargo de su persona</li>
                                        <li>Consultar la lista actual de los materiales que se reciben en los centros de acopio asociados al programa</li>
                                        <li>Además de los Canjes realizados en el Centro de Acopio a su cargo.</li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Carousel End-->
        </div>
    </section>

    <section class="bar no-mb no-padding-bottom">
        <div data-animate="fadeInUp" class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="heading text-center">
                        <h2>Descripción del Centro de Acopio</h2>
                    </div>
                    <div class="row portfolio-showcase">
                        <div class="col-md-6">
                            <div class="image">
                                <asp:Image ID="Image2" runat="server" CssClass="img-fluid image1" ImageUrl="imagenes/Varias/BannerCentrosAcopio.png" />
                            </div>
                        </div>
                        <div class="col-md-6 px-5">
                            <h3 class="text-primary"><asp:Label ID="lblNombreCentro" runat="server" Text=""></asp:Label></h3>
                            <p class="lead">
                                <ul class="list-unstyled">
                                    <li><i class="fa fa-user"></i> Administrador <asp:Label ID="lblNombreAdminCentro" CssClass="text-muted" runat="server" Text=""></asp:Label></li>
                                    <li><i class="fa fa fa-map-marker"></i> Ubicación: <asp:Label ID="lblProvinciaCentro" CssClass="text-muted"  runat="server" Text=""></asp:Label> </li>
                                    <li class="text-muted"><i class="fa fa-map-o"></i> <asp:Label ID="lblOtrasSenias" CssClass="text-muted" runat="server" Text=""></asp:Label></li>
                                    <li><i class="fa fa fa-map-marker fa fa-money"></i> Cantidad EcoMonedas Generadas: <asp:Label ID="lblTotalEcoMonedasGeneradas" CssClass="text-muted" runat="server" Text=""></asp:Label> <i class="fa fa-leaf"></i>
                                    </li>
                                </ul>
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section class="bar bg-gray">
        <div class="container">
            <div class="heading text-center">
                <h2>Nuestros Cooperadores</h2>
            </div>
            <ul class="list-unstyled owl-carousel customers no-mb">
                <li class="item">
                    <img src="img/Iconos/gollo.png" alt="" class="img-fluid" /></li>
                <li class="item">
                    <img style="margin-top: 15px" src="img/Iconos/LogoCapullo.png" alt="" class="img-fluid" /></li>
                <li class="item">
                    <img style="margin-top: 45px" src="img/Iconos/Sardimar.png" alt="" class="img-fluid" /></li>
                <li class="item">
                    <img style="margin-top: 18px" src="img/Iconos/numar.png" alt="" class="img-fluid" /></li>
                <li class="item">
                    <img style="margin-top: 23px" src="img/Iconos/FIFCO.png" alt="" class="img-fluid" /></li>
                <li class="item">
                    <img src="img/Iconos/1820.png" alt="" class="img-fluid" /></li>
            </ul>
        </div>
    </section>
</asp:Content>
