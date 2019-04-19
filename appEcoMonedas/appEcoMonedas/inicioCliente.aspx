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
                                    <img src="img/Iconos/Recolecte.png" alt="" class="img-fluid" style="margin: auto; margin-top: 0em; width: 20em;"/>
                                </div>
                                <div class="col-md-5">
                                    <h1>Recolecte Los Materiales</h1>
                                    <p>
                                        Recolecte residuos como plástico, cartón, aluminio, metales, etc.<br />
                                        Recuerde separarlos correctamente para agilizar el proceso de reciclaje.<br />
                                        Además de asegurarse de que que los mismos se encuentren limpios sin residuos de comida o similares.
                                    </p>
                                </div>
                            </div>
                        </div>
                        <div class="item">
                            <div class="row">
                                <div class="col-md-7 text-center">
                                    <img src="img/Iconos/centroAcopio.png" alt="" class="img-fluid" style="margin: auto; margin-top: 0em; width: 26em;"/>
                                </div>
                                <div class="col-md-5">
                                    <h2>Entregue al Centro de Acopio</h2>
                                    <ul class="list-unstyled">
                                        <li>Entregue sus materiales al centro de acopio más cercano.</li>
                                        <li>Muchos de ellos ofrecen servicio de transporte de los materiales, 
                                            consulte con el administrador del centro de acopio.</li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="item">
                            <div class="row">
                                <div class="col-md-7">
                                    <img src="img/Iconos/genere.png" alt="" class="img-fluid" style="margin: auto; margin-top: 0em; width: 20em;"/>
                                </div>
                                <div class="col-md-5">
                                    <h1>Genere y Ahorre</h1>
                                    <ul class="list-unstyled">
                                        <li>Con cada transacción realizada generará EcoMonedas</li>
                                        <li>Las mismas podrán ser acumuladas en su Billetera Virtual para compras futuras.</li>
                                        <li>Cada transacción generará una cantidad de EcoMonedas relativa a lo que usted recicle.</li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="item">
                            <div class="row">
                                <div class="col-md-7">
                                    <img src="img/Iconos/canjee.png" alt="" class="img-fluid" style="margin: auto; margin-top: 0em; width: 20em;"/>
                                </div>
                                <div class="col-md-5">
                                    <h1>Canjee sus Ecomonedas por Cupones</h1>
                                    <ul class="list-unstyled">
                                        <li>Con las EcoMonedas que usted genere podrá acceder a la compra de una gran cantidad de Cupones</li>
                                        <li>Elija entre las muchas opciones los cupones que le resulten más atractivos e intercámbielos por sus EcoMonedas disponibles</li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="item">
                            <div class="row">
                                <div class="col-md-7">
                                    <img src="img/Iconos/compre.png" alt="" class="img-fluid" style="margin: auto; margin-top: 0em; width: 20em;"/>
                                </div>
                                <div class="col-md-5">
                                    <h1>Presente sus Cupones en los Establecimientos Asociados</h1>
                                    <ul class="list-unstyled">
                                        <li>Cada cupón que adquiera le brindará diversas opciones, algunas de ellas son servicios y descuentos</li>
                                        <li>Otros los podrá intercambiar por productos en los establecimientos Asociados a nuestro Programa</li>
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
                <div class="col-md-8">
                    <h2 class="text-uppercase">¿Por qué es importante el Reciclaje?</h2>
                    <p class="lead mb-small">Un Hogar Limpio y Sano para Todos</p>
                    <p class="mb-small"><strong>Cada día se producen miles de toneladas de desechos en todo el planeta, 
                        la mayoría de estos desechos acaban contaminando el suelo, el aire y el agua, 
                        todo esto causado por el egoísmo de las sociedades capitalistas y todas esas personas cegadas por la ignorancia. 
                        En un planeta donde el contaminar es lo normal el reciclar se vuelve en un acto rebelde y de valentía, 
                        estamos fomentanto nuestra propia extinción. Entonces la verdadera pregunta es ¿Por qué no hacerlo?, 
                        si es la solución al creciente problema de exceso de residuos contaminantes, ¿Qué nos detiene?</strong></p>
                    <p class="mb-small"><strong>Con el proyecto EcoMonedas buscamos fomentar esa rebeldía y valentía de la que hablamos, 
                        un envase a la vez. Al crear este programa queremos premiar a todas esas personas que fomentan realmente al cambio.</strong></p>
                </div>
                <div class="col-md-4 text-center">
                    <img src="img/Iconos/recycling.png" alt="" class="img-fluid" />
                </div>
            </div>
        </div>
    </section>
    <section class="bar no-mb color-white padding-big text-md-center bg-primary">
        <div class="container">
            <div class="row">
                <div class="col-md-4 text-center">
                    <img src="img/Iconos/personas4.jpg" alt="" class="img-fluid" />
                </div>
                <div class="col-md-8">
                    <h2 class="text-uppercase">Acerca del Proceso pre-Entrega</h2>
                    <p class="lead mb-small">¿Cómo clasificar y tratar los residuos?</p>
                    <p class="mb-small"><strong>Los Materiales que usted vaya a entregar 
                        al centro de acopio deberán ir sin rastros de comida u otros desechos, 
                        es decir deben ir limpios y secos en el caso que se hayan lavado, 
                        esto con el fin de agilizar el proceso de reciclaje. 
                        deberán también ir correctamente clasificados por tipo, 
                        según lo indica la lista de materiales aceptados en nuestros Centro de Acopio</strong></p>
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
