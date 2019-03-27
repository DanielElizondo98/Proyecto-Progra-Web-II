<%@ Page Title="" Language="C#" MasterPageFile="~/PrincipalCliente.Master" AutoEventWireup="true" CodeBehind="InicioCliente.aspx.cs" Inherits="appEcoMonedas.inicioCliente" %>

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
                                    <img src="img/template-homepage.png" alt="" class="img-fluid" />
                                </div>
                                <div class="col-md-5">
                                    <h1>Multipurpose responsive theme</h1>
                                    <p>
                                        Business. Corporate..<br />
                                        Portfolio. Blog. E-commerce.
                                    </p>
                                </div>
                            </div>
                        </div>
                        <div class="item">
                            <div class="row">
                                <div class="col-md-7 text-center">
                                    <img src="img/template-mac.png" alt="" class="img-fluid" />
                                </div>
                                <div class="col-md-5">
                                    <h2>46 HTML pages full of features</h2>
                                    <ul class="list-unstyled">
                                        <li>Sliders and carousels</li>
                                        <li>4 Header variations</li>
                                        <li>Google maps, Forms, Megamenu, CSS3 Animations and much more</li>
                                        <li>+ 11 extra pages showing template features</li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="item">
                            <div class="row">
                                <div class="col-md-7">
                                    <img src="img/template-easy-customize.png" alt="" class="img-fluid" />
                                </div>
                                <div class="col-md-5">
                                    <h1>Design</h1>
                                    <ul class="list-unstyled">
                                        <li>Clean and elegant design</li>
                                        <li>Full width and boxed mode</li>
                                        <li>Easily readable Roboto font and awesome icons</li>
                                        <li>7 preprepared colour variations</li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="item">
                            <div class="row">
                                <div class="col-md-7">
                                    <img src="img/template-easy-code.png" alt="" class="img-fluid" />
                                </div>
                                <div class="col-md-5">
                                    <h1>Easy to customize</h1>
                                    <ul class="list-unstyled">
                                        <li>7 preprepared colour variations.</li>
                                        <li>Easily to change fonts</li>
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
    <section class="bar bg-gray no-mb padding-big text-md-center">
        <div class="container">
            <div class="row">
                <div class="col-md-6">
                    <h2 class="text-uppercase">¿Qué es el proyecto Eco-Monedas?</h2>
                    <p class="lead mb-small">Un proyecto amigable con el ambiente</p>
                    <p class="mb-small"><strong>Eco-monedas es una iniciativa que busca promover el reciclaje, de forma adecuada, con el fin de ayudar al medio ambiente, recibiendo a cambio una bonificación por una buena acción</strong></p>
                </div>
                <div class="col-md-6 text-center">
                    <img src="img/template-easy-customize.png" alt="" class="img-fluid" />
                </div>
            </div>
        </div>
    </section>
    <section class="bar no-mb color-white padding-big text-md-center bg-primary">
        <div class="container">
            <div class="row">
                <div class="col-md-6 text-center">
                    <img src="img/template-easy-code.png" alt="" class="img-fluid" />
                </div>
                <div class="col-md-6">
                    <h2 class="text-uppercase">¿Cómo nació el programa Eco-Monedas?</h2>
                    <p class="lead mb-small">Menos desechos, ganancia para todos</p>
                    <p class="mb-small"><strong>Nació como solución, ante la creciente problemática relacionada con el exceso de desechos inorgánicos, y el abstencionismo de los costarricense en lo que a materia de reciclaje se refiere.</strong></p>
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
