<%@ Page Title="" Language="C#" MasterPageFile="~/PrincipalCliente.Master" AutoEventWireup="true" CodeBehind="DetalleCuponImprimir.aspx.cs" Inherits="appEcoMonedas.ImprimirCupon" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=12.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="content">
        <div class="container">
            <div class="row bar" style="padding-top: .5em;">
                <div class="panel-heading">
                    <h3>Impresión del Cupón</h3>
                </div>
                <p class="lead">
                    En esta página se le muestra información acerca del cupón seleccionado para ser impreso,
                     el cupón se imprime con el fin de presentarlo en los respectivos centros 
                    (tiendas, establecimientos y servicios) asociados al programa ECO-Monedas, 
                    en los cuales usted podrá consumirlos o intercambiarlos por el artículo detallado en la descripción del cupón. 
                    Verifique que la información aquí brindada sea correcta ya que una vez impreso dicho cupón no podrá cambiarlo.
                </p>
                <div class="row" style="margin-bottom: 1em; width: 100%">
                    <div class="col-lg-12">
                        <asp:Label ID="lblMensaje" runat="server" CssClass="alert alert-dismissible alert-warning" Visible="false" Text="" Width="100%"></asp:Label>
                    </div>
                </div>
                <br />

                <div class="col-lg-12 col-md-12 col-sm-12" id="divInfo">
                    <div class="panel-heading">
                        <h3>Datos del Canje</h3>
                    </div>
                    <div class="box" style="margin-top: 1em; margin-bottom: 1em;">
                        <div class="row">
                            <div class="col-md-4">
                                <div>
                                    <asp:Label runat="server" ID="lblNombreCupon" CssClass="heading-light h2" ForeColor="#4FBFA8"></asp:Label>
                                </div>
                                <br />
                                <div>
                                    <asp:Label runat="server" ID="label1" CssClass="heading-light h4"><strong>Descripción</strong></asp:Label><br />
                                    <p>
                                        <asp:Label ID="lblDescripcionCupon" runat="server" Text="Label"></asp:Label>
                                    </p>
                                </div>
                                <div>
                                    <asp:Label runat="server" ID="label2" CssClass="heading-light h4"><strong>Precio:</strong></asp:Label><br />
                                    <p>
                                        <asp:Label ID="lblPrecio" runat="server" Text="Label"></asp:Label>

                                    </p>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <div>
                                    <asp:Label runat="server" ID="lblNombreUsuario" CssClass="heading-light h2" ForeColor="#4FBFA8"></asp:Label>
                                </div>
                                <br />
                                <div>
                                    <asp:Label runat="server" ID="label5" CssClass="heading-light h4"><strong>Correo Electrónico</strong></asp:Label><br />
                                    <asp:Label runat="server" ID="lblCorreo"></asp:Label>
                                </div>
                                <br />
                                <div>
                                    <asp:Label runat="server" ID="label6" CssClass="heading-light h4"><strong>Fecha de Compra:</strong></asp:Label>
                                    <span>
                                        <asp:Label ID="lblFechaCompra" CssClass="h4 text-secondary" runat="server" Text="Label"></asp:Label><i class="fa fa-calendar"></i></span>
                                </div>
                                <br />
                                <div>
                                    <asp:Label runat="server" ID="lblFechaImprime" CssClass="heading-light h4"><strong>Fecha de Impresión:</strong></asp:Label>
                                    <asp:Label runat="server" ID="txtFechaImprime" CssClass="h4 text-secondary"><%#:DateTime.Now.ToShortDateString() %>  <i class="fa fa-calendar"></i></asp:Label>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <asp:Image ID="imgCupon" runat="server" CssClass="img-fluid" />
                            </div>

                        </div>
                    </div>

                    <div class="box-footer d-flex justify-content-between align-items-center">
                        <div class="w-100">
                            <div class="col-12">
                                <div class="row">
                                    <asp:HiddenField ID="hfCanjeID" Value='<%# Eval("ID")%>' runat="server" />

                                    <div class="col-lg-4 col-md-4 col-sm-12">
                                        <asp:LinkButton ID="btnCancelar" CssClass="btn btn-success" OnClick="btnCancelar_Click" runat="server"><i class="fa fa-chevron-left"></i>  Volver al Historial de Cupones</asp:LinkButton>
                                    </div>

                                    <div class="col-lg-4 offset-lg-4 text-lg-right col-md-4 offset-md-4 text-md-right col-sm-12">
                                        <asp:LinkButton ID="btnAceptar" CssClass="btn btn-primary" OnClick="btnAceptar_Click" runat="server">Imprimir el Cupón  <i class="fa fa-chevron-right"></i></asp:LinkButton>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-12 col-md-12 col-sm-12 mt-4">
                    <div class="panel-heading">
                        <h3>Cupon Imprimible</h3>
                    </div>
                    <div class="w-100">
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                            <ContentTemplate>
                                <div class="table-responsive" id="divReporte" runat="server">
                                    <rsweb:ReportViewer ID="ReportViewer1" ZoomMode="PageWidth" Width="100%" runat="server" Font-Names="Verdana" Font-Size="8pt" WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt">
                                        <LocalReport ReportPath="ReporteCuponCanjeado.rdlc">
                                            <DataSources>
                                                <rsweb:ReportDataSource Name="DataSet1" DataSourceId="ObjectDataSource1"></rsweb:ReportDataSource>
                                            </DataSources>
                                        </LocalReport>
                                    </rsweb:ReportViewer>

                                    <asp:ObjectDataSource runat="server" SelectMethod="ObtenerCuponCanjeado" TypeName="LogicaNegocios.CanjeLN" ID="ObjectDataSource1">
                                        <SelectParameters>
                                            <asp:SessionParameter DefaultValue="0" Name="idCanje" SessionField="IDCanje" Type="Int32"></asp:SessionParameter>
                                        </SelectParameters>
                                    </asp:ObjectDataSource>
                                </div>
                            </ContentTemplate>
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="btnAceptar" EventName="Click" />
                            </Triggers>
                        </asp:UpdatePanel>
                    </div>
                </div>

            </div>
        </div>
    </div>
</asp:Content>
