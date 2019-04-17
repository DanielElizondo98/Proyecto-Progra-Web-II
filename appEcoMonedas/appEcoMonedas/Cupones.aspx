<%@ Page Title="" Language="C#" MasterPageFile="~/PrincipalCliente.Master" AutoEventWireup="true" CodeBehind="Cupones.aspx.cs" Inherits="appEcoMonedas.Cupones" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div id="heading-breadcrumbs">
        <div class="container">
            <div class="row d-flex align-items-center flex-wrap">
                <div class="col-md-12">
                    <h1 class="h2">Listado de Cupones</h1>
                </div>
            </div>
        </div>
    </div>

    <div id="content">
        <div class="container">
            <div class="row bar">

                <div id="blog-listing-medium" class="col-md-9">
                    <asp:ListView ID="lvCupones" runat="server"
                        DataKeyNames="ID" GroupItemCount="1"
                        ItemType="Contexto.Cupon" SelectMethod="ListadoCupones">

                        <EmptyDataTemplate>
                            <div class="row">
                                <div class="text-center">
                                    No hay datos.
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
                                    <div class="col-md-4">
                                        <div class="image">
                                            <asp:Image ID="imgCupon" runat="server" class="img-fluid" ImageUrl='<%#Eval("Imagen", "~/imagenes/cupon/{0}") %>' />
                                        </div>
                                    </div>
                                    <div class="col-md-8">
                                        <h2 class="h3 mt-0 " style="color: #4fbfa8;"><%#:Item.Nombre%></h2>
                                        <div class="d-flex flex-wrap justify-content-between text-xs">
                                            <p class="author-category"><%#:String.Format("‎{0:N2} Ecomonedas", Item.Precio_Canje)%></p>
                                        </div>
                                        <p class="intro"><%#:Item.Descripcion%></p>



                                        <p class="text-right">
                                            <asp:HiddenField ID="hfCuponID" Value='<%# Eval("ID")%>' runat="server" />
                                            <asp:HyperLink ID="HyperLink1"
                                                runat="server"
                                                CssClass="btn btn-template-outlined"
                                                NavigateUrl='<%# Eval("ID","~/CanjeCupon.aspx?id={0}")%>'>Canjear este Cupón</asp:HyperLink>
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

                <div class="col col-md-3">
                    <div class="panel panel-default sidebar-menu">
                        <div class="panel-heading">
                            <h3 class="h4 panel-title">Acerca de los Cupones</h3>
                        </div>
                        <div class="panel-body text-widget">
                            <p>Los cupones que se muestran en la lista están disponibles para ser canjeados por ecomonedas en su cuenta, cada uno posee un precio diferente que se encuentra detallado el la información del cupón. No todos los cupones (cupones de vales en establecimientos) son para cualquier establecimiento, tienda o local, es por ello que debe leer cuidadosamente en qué local puede canjear el cupón. Los productos serán enviados a la dirección detallada en su perfil o llegarán directamente al centro de acopio más cercano.</p>
                        </div>
                    </div>
                    <div class="panel panel-default sidebar-menu">
                        <div class="panel-heading">
                            <h3 class="h4 panel-title">Buscar</h3>
                        </div>
                        <div class="panel-body">
                            <div class="input-group">
                                <input type="text" placeholder="Buscar" class="form-control" /><span class="input-group-btn">
                                    <button type="submit" class="btn btn-template-main"><i class="fa fa-search"></i></button>
                                </span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
