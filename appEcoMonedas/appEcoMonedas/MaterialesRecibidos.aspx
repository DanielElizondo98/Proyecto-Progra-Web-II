<%@ Page Title="" Language="C#" MasterPageFile="~/PrincipalInicio.Master" AutoEventWireup="true" CodeBehind="MaterialesRecibidos.aspx.cs" Inherits="appEcoMonedas.MaterialesRecibidos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/MaterialCSS.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="heading-breadcrumbs">
        <div class="container">
            <div class="row d-flex align-items-center flex-wrap">
                <div class="col-md-7">
                    <h1 class="h2">¿Qué materiales recibimos?</h1>
                </div>
                <div class="col-md-5">
                </div>
            </div>
        </div>
    </div>
    <div id="content">
        <div class="container">
            <div class="row bar">
                <div class="col-md-12">
                    <p class="text-muted lead text-center">Listado de los materiales que podés ingresar en nuestros centros de acopio.</p>
                    <div class="products-big">
                        <div class="row products">
                            <asp:ListView ID="lvMateriales" runat="server"
                                DataKeyNames="ID" GroupItemCount="3"
                                ItemType="Contexto.Material" SelectMethod="listadoMateriales">
                                <EmptyDataTemplate>
                                    <div class="row">
                                        <div class="text-center">
                                            <h3>No hay datos</h3>
                                        </div>
                                    </div>
                                </EmptyDataTemplate>
                                <EmptyItemTemplate>
                                    <div class="col-lg-3">
                                    </div>
                                </EmptyItemTemplate>
                                <GroupTemplate>
                                    <div class="row">
                                        <asp:PlaceHolder ID="itemPlaceholder" runat="server"></asp:PlaceHolder>
                                    </div>
                                </GroupTemplate>
                                <ItemTemplate>
                                    <div class="col-lg-3 col-md-4">
                                        <div class="product">
                                            <div class="card-header <%#Item.Color.ClaseCss%>">
                                                <h4 class="my-0 font-weight-normal" style="font-weight: 800 !important;"><%#:Item.Nombre%></h4>
                                            </div>
                                            <div class="image" style="border: 1px solid;">
                                                <a href="#">
                                                    <asp:Image ID="Image2" runat="server" CssClass="img-fluid image1" ImageUrl='<%# Eval("Imagen", "~/imagenes/material/{0}")%>' /></a>
                                            </div>
                                            <div class="text">
                                                <h3 class="h5"><a href="#"><%#:Item.Nombre%></a></h3>
                                                <p class="price">Precio <strong><%#:String.Format("‎{0:N2} Ecomonedas", Item.Precio)%></a></strong></p>
                                            </div>
                                            <div class="ribbon-holder">
                                                <div class="ribbon <%#Item.Color.ClaseCss%>">Color</div>
                                            </div>
                                        </div>
                                    </div>
                                </ItemTemplate>
                                <LayoutTemplate>
                                    <div class="container">
                                        <asp:PlaceHolder ID="groupPlaceHolder" runat="server"></asp:PlaceHolder>
                                    </div>
                                </LayoutTemplate>
                            </asp:ListView>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12 banner mb-small text-center">
                            <img src="img/banner2.jpg" alt="" class="img-fluid" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
