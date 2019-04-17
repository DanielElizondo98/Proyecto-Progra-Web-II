<%@ Page Title="" Language="C#" MasterPageFile="~/PrincipalCliente.Master" AutoEventWireup="true" CodeBehind="ImprimirCupon.aspx.cs" Inherits="appEcoMonedas.ImprimirCupon" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="content">
        <div class="container">
            <div class="row bar" style="padding-top: .5em;">
                <div class="panel-heading">
                    <h3>Impresión del Cupón</h3>
                </div>
                <p class="lead">En esta página se le muestra información acerca del cupón seleccionado para ser impreso,
                     el cupón se imprime con el fin de presentarlo en los respectivos centros 
                    (tiendas, establecimientos y servicios) asociados al programa ECO-Monedas, 
                    en los cuales usted podrá consumirlos o intercambiarlos por el artículo detallado en la descripción del cupón. 
                    Verifique que la información aquí brindada sea correcta ya que una vez impreso dicho cupón no podrá cambiarlo.</p>
                <div class="row" style="margin-bottom: 1em; width:100%">
                    <div class="col-lg-12">
                        <asp:Label ID="lblMensaje" runat="server" CssClass="alert alert-dismissible alert-warning" Visible="false" Text="" Width="100%"></asp:Label>
                    </div>
                </div>
                <br />
                <asp:Image ID="imgCupon" runat="server" CssClass="img-fluid" ImageUrl='<%# Eval("Imagen", "~/imagenes/cupon/{0}")%>' />

                <div class="col-lg-12" id="divInfo">
                    <div class="panel-heading">
                        <h3>Datos del Canje</h3>
                    </div>
                    <asp:ListView ID="gvCupon" runat="server"
                        ItemType="Contexto.Canje"
                        SelectMethod="ObtenerCanje">
                        <ItemTemplate>

                            <div class="box" style="margin-top: 1em; margin-bottom: 1em;">
                                <div class="row">
                                    <div class="col-md-4">
                                        <div>
                                            <asp:Label runat="server" ID="lblNombreCupon" CssClass="heading-light h2" ForeColor="#4FBFA8"><%#:Item.Cupon.Nombre%></asp:Label>
                                        </div>
                                        <br />
                                        <div>
                                            <asp:Label runat="server" ID="lblDescripcionCupon" CssClass="heading-light h4"><strong>Descripción</strong></asp:Label><br />
                                            <p><%#:Item.Cupon.Descripcion%></p>
                                        </div>
                                        <div>
                                            <asp:Label runat="server" ID="lblPrecio" CssClass="heading-light h4"><strong>Precio:</strong></asp:Label><br />
                                            <p><%#:String.Format("‎{0:N2} Ecomonedas", Item.Cupon.Precio_Canje)%></p>
                                        </div>
                                    </div>

                                    <div class="col-md-4">
                                        <div>
                                            <asp:Label runat="server" ID="lblNombreUsuario" CssClass="heading-light h2" ForeColor="#4FBFA8"><%#: (Item.Usuario.Nombre).ToString()+" "%> <%#: (Item.Usuario.Apellido1).ToString()+" " %>  <%#:Item.Usuario.Apellido2 %></asp:Label>
                                        </div>
                                        <br />
                                        <div>
                                            <asp:Label runat="server" ID="lblCorreo" CssClass="heading-light h4"><strong>Correo Electrónico</strong></asp:Label><br />
                                            <asp:Label runat="server" ID="txtCorreo"><%#: Item.Usuario.Correo %></asp:Label>
                                        </div>
                                        <br />
                                        <div>
                                            <asp:Label runat="server" ID="lblFechaCompra" CssClass="heading-light h4"><strong>Fecha de Compra:</strong></asp:Label>
                                            <asp:Label runat="server" ID="txtFechaCompra" CssClass="h4 text-secondary"><%#:Item.FechaCanje.ToShortDateString() %>  <i class="fa fa-calendar"></i></asp:Label>
                                        </div>
                                        <br />
                                        <div>
                                            <asp:Label runat="server" ID="lblFechaImprime" CssClass="heading-light h4"><strong>Fecha de Impresión:</strong></asp:Label>
                                            <asp:Label runat="server" ID="txtFechaImprime" CssClass="h4 text-secondary"><%#:DateTime.Now.ToShortDateString() %>  <i class="fa fa-calendar"></i></asp:Label>
                                        </div>
                                    </div>

                                    <div class="col-md-4">Imagen</div>

                                </div>
                            </div>

                            <div class="box-footer d-flex justify-content-between align-items-center">
                                <div class="row">
                                    <div class="col-12">
                                        <p>
                                            <asp:HiddenField ID="hfCanjeID" Value='<%# Eval("ID")%>' runat="server" />
                                            <asp:LinkButton ID="btnCancelar" CssClass="btn btn-danger" OnClick="btnCancelar_Click" runat="server"><i class="fa fa-chevron-left"></i>  Cancelar</asp:LinkButton>
                                            <asp:LinkButton ID="btnAceptar" CssClass="btn btn-primary" OnClick="btnAceptar_Click" runat="server">Confirmar el canje  <i class="fa fa-chevron-right"></i></asp:LinkButton>

                                        </p>

                                    </div>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:ListView>
                </div>

            </div>
        </div>
    </div>
</asp:Content>
