<%@ Page Title="" Language="C#" MasterPageFile="~/PrincipalInicio.Master" AutoEventWireup="true" CodeBehind="NuestrosCentrosAcopio.aspx.cs" Inherits="appEcoMonedas.NuestrosCentrosAcopio" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="heading-breadcrumbs" class="border-top-0 border-bottom-0">
        <div class="container">
            <div class="row d-flex align-items-center flex-wrap">
                <div class="col-12">
                    <h1 class="h2">Centros de Acopio</h1>
                </div>
            </div>
        </div>
    </div>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div id="content">
                <div class="container bar">
                    <div class="row">
                        <asp:Label ID="lblMensaje" runat="server" CssClass="col-12 alert alert-dismissible alert-danger" Visible="false" Text=""></asp:Label>
                        <div class="col-lg-5 col-md-5 col-sm-12">
                            <div class="form-group">
                                <asp:Label ID="lblProvincias" AssociatedControlID="ddlProvincias" CssClass="text-primary" Font-Size="18px" runat="server" Text="Estos son nuestros centros de acopio registrados por provincia"></asp:Label>
                                <asp:DropDownList ID="ddlProvincias"
                                    runat="server" OnSelectedIndexChanged="ddlProvincias_SelectedIndexChanged"
                                    CssClass="form-control" AutoPostBack="true"
                                    DataTextField="Descripcion"
                                    DataValueField="ID">
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="col-lg-7 col-md-7 col-sm-12 text-center">
                            <asp:Image ID="imgProvincia" CssClass="img-fluid Img-maxSizes" runat="server" ImageUrl="img/Iconos/NoImagen.png" />

                        </div>
                    </div>
                    <div class="row box" style="margin: 40px 0 !important;">
                        <asp:ListView ID="lvCentros" runat="server"
                            DataKeyNames="ID" GroupItemCount="4"
                            ItemType="Contexto.Centro">
                            <EmptyDataTemplate>
                                <div class="col-12">
                                    <div class="text-center">
                                        <h3>Aún no hay centros en esta provincia</h3>
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
                                <section class="post">
                                    <div class="row">
                                        <div class="col-md-4">
                                            <div class="image text-center">
                                                <asp:Image ID="Image2" runat="server" CssClass="img-fluid image1" ImageUrl="imagenes/Varias/Centro.png" />
                                            </div>
                                        </div>
                                        <div class="col-md-8 p-5">
                                            <h2 class="h3 mt-0"><span style="color: #555; text-transform: uppercase; letter-spacing: 0.1em;"><%#:Item.Nombre%></span></h2>
                                            <div class="d-flex flex-wrap text-xs">
                                                <p class="author-category">Administrador <span class="text-primary"><%#:Item.ID_Administrador_Centro%></span></p>
                                                <p class="date-comments" style="color: #999; margin-left: 25px;">
                                                    <span>Provincia</span> <%#:Item.Provincia.Descripcion%> <i class="fa fa-map-marker"></i>
                                                </p>
                                            </div>
                                            <p class="intro">Dirección: <%#:Item.Otras_Senias%>. <i class="fa fa-map-o"></i></p>
                                        </div>
                                    </div>
                                </section>
                            </ItemTemplate>
                            <LayoutTemplate>
                                <div class="col-12" id="blog-listing-medium">
                                    <asp:PlaceHolder ID="groupPlaceHolder" runat="server"></asp:PlaceHolder>
                                </div>
                            </LayoutTemplate>
                        </asp:ListView>

                    </div>
                    <div class="row">
                        <div class="col-md-12 banner mb-small text-center">
                            <img src="imagenes/Varias/BannerCentrosAcopio.png" alt="" class="img-fluid" />
                            <h1 class="mt-4">Proyecto EcoMonedas</h1>
                        </div>
                    </div>
                </div>
            </div>
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="ddlProvincias" EventName="SelectedIndexChanged" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>
