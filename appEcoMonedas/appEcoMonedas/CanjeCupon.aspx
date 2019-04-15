<%@ Page Title="" Language="C#" MasterPageFile="~/PrincipalCliente.Master" AutoEventWireup="true" CodeBehind="CanjeCupon.aspx.cs" Inherits="appEcoMonedas.CanjeCupon" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="content">
        <div class="container">
            <div class="row bar" style="padding-top:.5em;">
                <div class="col-lg-12">
                    <asp:Label ID="lblfecha" runat="server" CssClass="h3 text-secondary float-lg-right" ><i class="fa fa-calendar">   </i></asp:Label>           
                </div>
                <br />
                <div class="panel-heading">
                    <h3>Canje de Cupón</h3>
                </div>
                <p class="lead">En esta página se le muestra información acerca del canje del cupón seleccionado, verifique dicha información sea correcta y que los sus datos peronales (principalmente la dirección) esté actualizada.</p>
                <div class="row" style="margin-bottom:1em;">
                    <div class="col-lg-12">
                        <asp:Label ID="lblMensaje" runat="server" CssClass="alert alert-dismissible alert-warning" Visible="false" Text=""></asp:Label>
                    </div>
                </div><br />
                <asp:Image ID="imgCupon" runat="server" CssClass="img-fluid" ImageUrl='<%# Eval("Imagen", "~/imagenes/cupon/{0}")%>' />
                                        
                <div class="col-lg-8" id="divInfo">

                    <div class="panel-heading">
                        <h3>Datos del Cupón</h3>
                    </div>
                    <asp:ListView ID="gvCupon" runat="server"
                        ItemType="Contexto.Cupon"
                        SelectMethod="ObtenerCupon">
                        <ItemTemplate>

                            <div class="box" style="margin-top: 1em; margin-bottom: 1em;">
                                <div class="row">
                                    <div class="col-md-4">
                                        <div class="image w-100">
                                            <asp:Image ID="imgCupon" runat="server" CssClass="img-fluid" ImageUrl='<%# Eval("Imagen", "~/imagenes/cupon/{0}")%>' />
                                        </div>
                                    </div>
                                    <div class="col-md-8">
                                        <div>
                                            <asp:Label runat="server" ID="lblNombreCupon" CssClass="heading-light h2" ForeColor="#4FBFA8"><strong><%#:Item.Nombre%></strong></asp:Label>
                                        </div>
                                        <br />
                                        <div>
                                            <asp:Label runat="server" ID="lblDescripcionCupon" CssClass="heading-light h4"><strong>Descripción</strong></asp:Label><br />
                                            <p><%#:Item.Descripcion%></p>
                                        </div>
                                        <br />
                                        <div>
                                            <asp:Label runat="server" ID="lblPrecio" CssClass="heading-light h4"><strong>Precio:</strong></asp:Label><br />
                                            <p><%#:String.Format("‎{0:N2} Ecomonedas", Item.Precio_Canje)%></p>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="box-footer d-flex justify-content-between align-items-center">
                                <div class="row">
                                    <div class="col-12">
                                        <p>
                                            <asp:HiddenField ID="hfCuponID" Value='<%# Eval("ID")%>' runat="server" />
                                            <asp:LinkButton ID="btnCancelar" CssClass="btn btn-danger" OnClick="btnCancelar_Click" runat="server"><i class="fa fa-chevron-left"></i>Cancelar</asp:LinkButton>
                                            <asp:LinkButton ID="btnConfirmaCanje" CssClass="btn btn-primary" OnClick="btnConfirmaCanje_Click" runat="server">Confirmar el canje <i class="fa fa-chevron-right"></i></asp:LinkButton>
                                            
                                        </p>

                                    </div>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:ListView>
                </div>

                <div class="col-lg-4">

                    <div class="panel-heading">
                        <h3>Datos de Usuario</h3>
                    </div>
                    <div class="box" style="margin-top: 1em; margin-bottom: 1em;">
                        <div>
                            <asp:Label runat="server" ID="lblNombreUsuario" CssClass="heading-light h2" ForeColor="#4FBFA8"></asp:Label>
                        </div>
                        <br />
                        <div>
                            <asp:Label runat="server" ID="lblCorreo" CssClass="heading-light h4"><strong>Correo Electrónico</strong></asp:Label><br />
                            <asp:Label runat="server" ID="txtCorreo"></asp:Label>
                        </div>
                        <br />
                        <div>
                            <asp:Label runat="server" ID="lblDireccion" CssClass="heading-light h4"><strong>Dirección</strong></asp:Label><br />
                            <asp:Label runat="server" ID="txtDireccion"></asp:Label>
                        </div>
                        <br />
                        <br />
                        <div>
                            <asp:Label runat="server" ID="lblEcomonedas" CssClass="heading-light h4"><strong>Ecomonedas Disponibles Para la transacción</strong></asp:Label><br />
                            <asp:Label runat="server" ID="txtEcomonedas"></asp:Label>
                        </div>

                    </div>
                </div>

            </div>
        </div>
    </div>




</asp:Content>
