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

            <div class="offset-1 col-md-10">
                <div id="accordion" role="tablist" class="mb-5">
                    <asp:ListView ID="lvRecibos" runat="server"
                        ItemType="Contexto.Canje"
                        SelectMethod="ObtenerCanjesUsuario">
                        <ItemTemplate>
                            <div class="card">
                                <div role="tab" class="card-header">
                                    <h5 class="mb-0"><a data-toggle="collapse" href="#<%#:Item.ID %>" aria-expanded="true" aria-controls="collapseOne"><%#:Item.Cupon.Nombre %> </a></h5>
                                    <h4><%#:Item.FechaCanje.ToShortDateString()%></h4>
                                </div>

                                <div id="<%#:Item.ID %>" role="tabpanel" aria-labelledby="headingOne" data-parent="#accordion" class="collapse show">
                                    <div class="card-body">
                                        <div class="row">
                                            <div class="col-md-4">
                                                <%--<asp:Image ID="imgCupon" runat="server" CssClass="img-fluid" ImageUrl='<%# Eval("Imagen", "~/imagenes/cupon/{0}")%>' />--%>
                                            </div>
                                            <div class="col-md-8">
                                                <p><%#:Item.Cupon.Descripcion%></p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:ListView>
                </div>
            </div>


            <%--<div class="offset-1 col-lg-10">
                <div id="accordion1" role="tablist" class="mb-5">
                    <div class="card">
                        <div id="headingOne" role="tab" class="card-header">
                            <h5 class="mb-0"><a data-toggle="collapse" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">Accordion Item No.1</a></h5>
                        </div>
                        <div id="collapseOne" role="tabpanel" aria-labelledby="headingOne" data-parent="#accordion" class="collapse show">
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-md-4">
                                        <img src="img/template-easy-customize.png" alt="" class="img-fluid">
                                    </div>
                                    <div class="col-md-8">
                                        <p>One morning, when Gregor Samsa woke from troubled dreams, he found himself transformed in his bed into a horrible vermin. He lay on his armour-like back, and if he lifted his head a little he could see his brown belly, slightly domed and divided by arches into stiff sections.</p>
                                        <p>One morning, when Gregor Samsa woke from troubled dreams, he found himself transformed in his bed into a horrible vermin. He lay on his armour-like back, and if he lifted his head a little he could see his brown belly, slightly domed and divided by arches into stiff sections.                                    </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="card">
                        <div id="headingTwo" role="tab" class="card-header">
                            <h5 class="mb-0"><a data-toggle="collapse" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo" class="collapsed">Accordion Item No.2</a></h5>
                        </div>
                        <div id="collapseTwo" role="tabpanel" aria-labelledby="headingTwo" data-parent="#accordion" class="collapse">
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-md-4">
                                        <img src="img/template-easy-code.png" alt="" class="img-fluid">
                                    </div>
                                    <div class="col-md-8">
                                        <p>It showed a lady fitted out with a fur hat and fur boa who sat upright, raising a heavy fur muff that covered the whole of her lower arm towards the viewer. Gregor then turned to look out the window at the dull weather. Drops of rain could be heard hitting the pane, which made him feel quite sad.</p>
                                        <p>It showed a lady fitted out with a fur hat and fur boa who sat upright, raising a heavy fur muff that covered the whole of her lower arm towards the viewer. Gregor then turned to look out the window at the dull weather. Drops of rain could be heard hitting the pane, which made him feel quite sad.</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="card">
                        <div id="headingThree" role="tab" class="card-header">
                            <h5 class="mb-0"><a data-toggle="collapse" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree" class="collapsed">Accordion Item No.3 A little too small</a></h5>
                        </div>
                        <div id="collapseThree" role="tabpanel" aria-labelledby="headingThree" data-parent="#accordion" class="collapse">
                            <div class="card-body">
                                His room, a proper human room although a little too small, lay peacefully between its four familiar walls.<br>
                                A collection of textile samples lay spread out on the table - Samsa was a travelling salesman - and above it there hung a picture that he had recently cut out of an illustrated magazine and housed in a nice, gilded frame.
                            </div>
                        </div>
                    </div>
                </div>--%>
        </div>
        <section class="bar bg-gray mb-0">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <h1>Block with gray background</h1>
                        <p class="lead mb-0">Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.</p>
                    </div>
                </div>
            </div>
        </section>
    </section>
</asp:Content>
