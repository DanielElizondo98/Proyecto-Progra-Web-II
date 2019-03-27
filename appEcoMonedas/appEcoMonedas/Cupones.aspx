<%@ Page Title="" Language="C#" MasterPageFile="~/PrincipalCliente.Master" AutoEventWireup="true" CodeBehind="Cupones.aspx.cs" Inherits="appEcoMonedas.Cupones" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div id="heading-breadcrumbs">
        <div class="container">
            <div class="row d-flex align-items-center flex-wrap">
                <div class="col-md-7">
                    <h1 class="h2">Listado de Cupone</h1>
                </div>
                <div class="col-md-5">
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
                            <section class="post">
                                <div class="row">
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
                                            <asp:LinkButton runat="server" ID="btnCanjear" CssClass="btn btn-template-outlined" OnClick="btnCanjear_Click">Canjear Cupón</asp:LinkButton>
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
                            <form role="search">
                                <div class="input-group">
                                    <input type="text" placeholder="Buscar" class="form-control"><span class="input-group-btn">
                                        <button type="submit" class="btn btn-template-main"><i class="fa fa-search"></i></button>
                                    </span>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>





    <!--____________________________________________________________________________________________________-->

    <%--<div id="heading-breadcrumbs1" class="border-top-0 border-bottom-0">
        <div class="container">
            <div class="row d-flex align-items-center flex-wrap">
                <div class="col-md-7">
                    <h1 class="h2">Blog Listing: Medium</h1>
                </div>
                <div class="col-md-5">
                    <ul class="breadcrumb d-flex justify-content-end">
                        <li class="breadcrumb-item"><a href="index.html">Home</a></li>
                        <li class="breadcrumb-item active">Blog Listing: Medium</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>--%>
    <%--<div id="content1">
        <div class="container">
            <div class="row bar">
                <div id="blog-listing-medium(paradiferenciar)" class="col-md-9">
                    <section class="post">
                        <div class="row">
                            <div class="col-md-4">
                                <div class="image">
                                    <a href="blog-post.html">
                                        <img src="img/blog-medium.jpg" alt="Example blog post alt" class="img-fluid"></a>
                                </div>
                            </div>
                            <div class="col-md-8">
                                <h2 class="h3 mt-0"><a href="post.htmls">Fashion now</a></h2>
                                <div class="d-flex flex-wrap justify-content-between text-xs">
                                    <p class="author-category">By <a href="#">John Snow</a> in <a href="blog.html">Webdesign</a></p>
                                    <p class="date-comments"><a href="blog-post.html"><i class="fa fa-calendar-o"></i>June 20, 2013</a><a href="blog-post.html"><i class="fa fa-comment-o"></i> 8 Comments</a></p>
                                </div>
                                <p class="intro">Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.</p>
                                <p class="read-more text-right"><a href="blog-post.html" class="btn btn-template-outlined">Continue reading</a></p>
                            </div>
                        </div>
                    </section>
                    <section class="post">
                        <div class="row">
                            <div class="col-md-4">
                                <div class="video">
                                    <div class="embed-responsive embed-responsive-4by3">
                                        <iframe src="//www.youtube.com/embed/upZJpGrppJA" class="embed-responsive-item"></iframe>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-8">
                                <h2 class="h3 mt-0"><a href="post.htmls">Post with video</a></h2>
                                <div class="d-flex flex-wrap justify-content-between text-xs">
                                    <p class="author-category">By <a href="#">John Snow</a> in <a href="blog.html">Webdesign</a></p>
                                    <p class="date-comments"><a href="blog-post.html"><i class="fa fa-calendar-o"></i>June 20, 2013</a><a href="blog-post.html"><i class="fa fa-comment-o"></i> 8 Comments</a></p>
                                </div>
                                <p class="intro">Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.</p>
                                <p class="read-more text-right"><a href="blog-post.html" class="btn btn-template-outlined">Continue reading</a></p>
                            </div>
                        </div>
                    </section>
                    <section class="post">
                        <div class="row">
                            <div class="col-md-4">
                                <div class="image">
                                    <a href="blog-post.html">
                                        <img src="img/blog-medium.jpg" alt="Example blog post alt" class="img-fluid"></a>
                                </div>
                            </div>
                            <div class="col-md-8">
                                <h2 class="h3 mt-0"><a href="post.htmls">Fashion now</a></h2>
                                <div class="d-flex flex-wrap justify-content-between text-xs">
                                    <p class="author-category">By <a href="#">John Snow</a> in <a href="blog.html">Webdesign</a></p>
                                    <p class="date-comments"><a href="blog-post.html"><i class="fa fa-calendar-o"></i>June 20, 2013</a><a href="blog-post.html"><i class="fa fa-comment-o"></i> 8 Comments</a></p>
                                </div>
                                <p class="intro">Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.</p>
                                <p class="read-more text-right"><a href="blog-post.html" class="btn btn-template-outlined">Continue reading</a></p>
                            </div>
                        </div>
                    </section>
                    <ul class="pager d-flex align-items-center justify-content-between list-unstyled">
                        <li class="previous"><a href="#" class="btn btn-template-outlined">← Older</a></li>
                        <li class="next disabled"><a href="#" class="btn btn-template-outlined">Newer →</a></li>
                    </ul>
                </div>
                <div class="col-md-3">
                    <div class="panel panel-default sidebar-menu">
                        <div class="panel-heading">
                            <h3 class="h4 panel-title">Text widget</h3>
                        </div>
                        <div class="panel-body text-widget">
                            <p>Improved own provided blessing may peculiar domestic. Sight house has never. No visited raising gravity outward subject my cottage mr be. Hold do at tore in park feet near my case.</p>
                        </div>
                    </div>
                    <div class="panel panel-default sidebar-menu">
                        <div class="panel-heading">
                            <h3 class="h4 panel-title">Search</h3>
                        </div>
                        <div class="panel-body">
                            <form role="search">
                                <div class="input-group">
                                    <input type="text" placeholder="Search" class="form-control"><span class="input-group-btn">
                                        <button type="submit" class="btn btn-template-main"><i class="fa fa-search"></i></button>
                                    </span>
                                </div>
                            </form>
                        </div>
                    </div>
                    <div class="panel panel-default sidebar-menu">
                        <div class="panel-heading">
                            <h3 class="h4 panel-title">Categories</h3>
                        </div>
                        <div class="panel-body">
                            <ul class="nav nav-pills flex-column text-sm">
                                <li class="nav-item"><a href="blog.html" class="nav-link">Webdesign</a></li>
                                <li class="nav-item"><a href="blog.html" class="nav-link active">Tutorials</a></li>
                                <li class="nav-item"><a href="blog.html" class="nav-link">Print</a></li>
                                <li class="nav-item"><a href="blog.html" class="nav-link">Our tips</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="panel sidebar-menu">
                        <div class="panel-heading">
                            <h3 class="h4 panel-title">Tags</h3>
                        </div>
                        <div class="panel-body">
                            <ul class="tag-cloud list-inline">
                                <li class="list-inline-item"><a href="#"><i class="fa fa-tags"></i>html5</a></li>
                                <li class="list-inline-item"><a href="#"><i class="fa fa-tags"></i>css3</a></li>
                                <li class="list-inline-item"><a href="#"><i class="fa fa-tags"></i>jquery</a></li>
                                <li class="list-inline-item"><a href="#"><i class="fa fa-tags"></i>ajax</a></li>
                                <li class="list-inline-item"><a href="#"><i class="fa fa-tags"></i>php</a></li>
                                <li class="list-inline-item"><a href="#"><i class="fa fa-tags"></i>responsive</a></li>
                                <li class="list-inline-item"><a href="#"><i class="fa fa-tags"></i>visio</a></li>
                                <li class="list-inline-item"><a href="#"><i class="fa fa-tags"></i>bootstrap</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>--%>
</asp:Content>
