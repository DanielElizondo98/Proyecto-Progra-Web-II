﻿<%@ Page Title="" Language="C#" MasterPageFile="~/PrincipalInicio.Master" AutoEventWireup="true" CodeBehind="Inicio.aspx.cs" Inherits="appEcoMonedas.Inicio" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section style="background: url('img/Iconos/ReciclajeBackground.png') center center repeat; background-size: cover;" class="bar background-white relative-positioned">
        <div class="container">
            <!-- Inicio Carousel -->
            <div class="home-carousel">
                <div class="dark-mask mask-primary"></div>
                <div class="container">
                    <div class="homepage owl-carousel">
                        <div class="item">
                            <div class="row">
                                <div class="col-md-7">
                                    <img src="img/Iconos/788779_label_512x512.png" alt="" class="img-fluid" style="margin: auto; margin-top: 0em; width: 20em;" />
                                </div>
                                <div class="col-md-5">
                                    <asp:Label runat="server" ID="lblContCupones" CssClass="h1"></asp:Label><br /><br />
                                    <p>
                                        Que podrá canjear en las diferentes
                                        <br />
                                        tiendas, comercios y servicios afiliados al proyecto
                                        <br />
                                        Compra de artículos, rebajas en comercios, ofertas en tiendas y mucho más.
                                    </p>
                                </div>
                            </div>
                        </div>
                        <div class="item">
                            <div class="row">
                                <div class="col-md-7 text-center">
                                    <img src="img/Iconos/29d7965ff1402d8795c9f42991ae58fd-papelera-de-reciclaje-icono-redondo-by-vexels.png" alt="" class="img-fluid" style="margin: auto; margin-top: 0em; width: 22em;" />
                                </div>
                                <div class="col-md-5">
                                    <asp:Label runat="server" ID="lblContCentros" CssClass="h1 "></asp:Label><br /><br />
                                    <ul class="list-unstyled">
                                        <li>Ubicados alrededor de toda Costa Rica </li>
                                        <li>para brindar un mejor servicio. </li>
                                        <li>Comprometidos enteramente con el mejoramiento del planeta</li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="item">
                            <div class="row">
                                <div class="col-md-7">
                                    <img src="img/Iconos/b399ae18a71607fa2f98a3097abb2583.png" alt="" class="img-fluid" style="margin: auto; margin-top: 0em; width: 22em;" />
                                </div>
                                <div class="col-md-5">
                                    <asp:Label runat="server" ID="lblContUsuarios" CssClass="h1"></asp:Label><br /><br />
                                    <ul class="list-unstyled">
                                        <li>Que actualmente utilizan nuestra plataforma para ayudar al planeta</li>
                                        <li>Con la alternativa de ganancia al reciclar, 
                                            que los incentiva a continuar con prácticas ECO-Amigables</li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="item">
                            <div class="row">
                                <div class="col-md-7">
                                    <img src="img/Iconos/a0dd403cf7e60164807d8a336577f340-icono-de-pulgares-arriba-c--rculo-by-vexels.png" alt="" class="img-fluid" style="margin: auto; margin-top: 0em; width: 22em;" />
                                </div>
                                <div class="col-md-5">
                                    <h1>Nuestro cooperadores</h1>
                                    <ul class="list-unstyled">
                                        <li>Esta inciativa cuenta con mas de 100 empresas</li>
                                        <li>como supermecados, salones de belleza, centros comerciales, entre otros establecimientos </li>
                                        <li>que cooperan en conjunto con el programa.</li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Fin Carousel -->
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
                    <img src="img/Iconos/destacado-ecoapp-266x176.png" alt="" class="img-fluid" />
                </div>
            </div>
        </div>
    </section>
    <section class="bar no-mb color-white padding-big text-md-center bg-primary">
        <div class="container">
            <div class="row">
                <div class="col-md-6 text-center">
                    <img src="img/Iconos/PROYECTOS-02.png" alt="" class="img-fluid" />
                </div>
                <div class="col-md-6">
                    <h2 class="text-uppercase">¿Cómo nació el programa Eco-Monedas?</h2>
                    <p class="lead mb-small">Menos desechos, ganancia para todos</p>
                    <p class="mb-small"><strong>Nació como solución, ante la creciente problemática relacionada con el exceso de desechos inorgánicos, y el abstencionismo de los costarricense en lo que a materia de reciclaje se refiere.</strong></p>
                </div>
            </div>
        </div>
    </section>

    <section style="background: url(img/Iconos/Eco.jpg) center top no-repeat; background-size: cover;" class="bar no-mb color-white text-center bg-fixed relative-positioned">
        <div class="dark-mask"></div>
        <div class="container">
            <div class="icon icon-outlined2 icon-lg">
                <img src="img/usuario.png" style="width: 3em;" alt="" class="img-fluid rounded-circle" />
            </div>
            <h3 class="text-uppercase">¿Deseas ser parte de esta iniciativa?</h3>
            <p class="lead">Llena el siguiente formulario con tus datos personales, y listo.</p>
            <p class="text-center"><a href="Registro.aspx" class="btn btn-template-outlined-white btn-lg">Formulario</a></p>
        </div>
    </section>
    <section class="bar no-mb">
        <div class="container">
            <div class="col-md-12">
                <div class="heading text-center">
                    <h2>Nuestro Equipo de Desarrollo</h2>
                </div>
                <div class="row text-center">
                    <div class="col-md-3">
                    </div>
                    <!-- /.team-member-->
                    <div data-animate="fadeInUp" class="col-md-3">
                        <div class="team-member">
                            <div class="image">
                                <img src="img/person-2.jpg" alt="" class="img-fluid rounded-circle" />
                            </div>
                            <h3>Jarod Elizondo Herrera</h3>
                            <p class="role">Programador</p>
                            <ul class="social list-inline">
                                <li class="list-inline-item"><a href="#" class="external facebook"><i class="fa fa-facebook"></i></a></li>
                                <li class="list-inline-item"><a href="#" class="external gplus"><i class="fa fa-google-plus"></i></a></li>
                                <li class="list-inline-item"><a href="#" class="external twitter"><i class="fa fa-twitter"></i></a></li>
                                <li class="list-inline-item"><a href="#" class="email"><i class="fa fa-envelope"></i></a></li>
                            </ul>
                            <div class="text">
                                <p>Estudiante de Ingeniería del Software la Universidad Técnica Nacional, de Costa Rica.</p>
                            </div>
                        </div>
                    </div>
                    <!-- /.team-member-->
                    <div data-animate="fadeInUp" class="col-md-3">
                        <div class="team-member">
                            <div class="image">
                                <img src="img/person-2.jpg" alt="" class="img-fluid rounded-circle" />
                            </div>
                            <h3>Sharon Sequeira González</h3>
                            <p class="role">Programadora</p>
                            <ul class="social list-inline">
                                <li class="list-inline-item"><a href="#" class="external facebook"><i class="fa fa-facebook"></i></a></li>
                                <li class="list-inline-item"><a href="#" class="external gplus"><i class="fa fa-google-plus"></i></a></li>
                                <li class="list-inline-item"><a href="#" class="external twitter"><i class="fa fa-twitter"></i></a></li>
                                <li class="list-inline-item"><a href="#" class="email"><i class="fa fa-envelope"></i></a></li>
                            </ul>
                            <div class="text">
                                <p>Estudiante de Ingeniería del Software la Universidad Técnica Nacional, de Costa Rica.</p>
                            </div>
                        </div>
                    </div>
                    <!-- /.team-member-->
                    <div data-animate="fadeInUp" class="col-md-3">
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
