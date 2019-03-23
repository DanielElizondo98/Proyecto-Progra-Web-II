<%@ Page Title="" Language="C#" MasterPageFile="~/PrincipalAdminCentro.Master" AutoEventWireup="true" CodeBehind="Materiales.aspx.cs" Inherits="appEcoMonedas.Materiales" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="heading-breadcrumbs">
        <div class="container">
            <div class="row d-flex align-items-center flex-wrap">
                <div class="col-md-7">
                    <h1 class="h2">Listado de materiales</h1>
                </div>
                <div class="col-md-5">
                </div>
            </div>
        </div>
    </div>
    <div id="content">
        <div class="container">
            <div class="row bar">
                <asp:Label ID="lblMensaje" runat="server" CssClass="col-12 alert alert-dismissible alert-danger" Visible="false" Text=""></asp:Label>
                <div class="col-md-12">
                    <p class="text-muted lead text-center">Listado de los materiales que podés ingresar en nuestros centros de acopio.</p>
                    <div class="products-big">
                        <div class="row products">
                            <asp:ListView ID="lvMateriales" runat="server"
                                DataKeyNames="ID" GroupItemCount="4"
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
                                                <div class="aClass">
                                                    <asp:Image ID="Image2" runat="server" CssClass="img-fluid image1" ImageUrl='<%# Eval("Imagen", "~/imagenes/material/{0}")%>' />
                                                </div>
                                            </div>
                                            <div class="text">
                                                <h3 class="h5">
                                                    <div class="aClass <%#Item.Color.ClaseCss%> p-1"><%#:Item.Nombre%></div>
                                                </h3>
                                                <p class="price">Precio <strong><%#:String.Format("‎{0:N2} Ecomonedas", Item.Precio)%></a></strong></p>
                                                <p>
                                                    <asp:HiddenField ID="hfMaterialID" Value='<%# Eval("ID")%>' runat="server" />
                                                    <asp:LinkButton ID="btnAgregar" CssClass="btn btn-primary text-white" OnClick="btnAgregar_Click" runat="server">Agregar al carrito <i class="fa fa-shopping-cart"></i></asp:LinkButton>
                                                </p>
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
                </div>
            </div>
        </div>
    </div>
</asp:Content>
