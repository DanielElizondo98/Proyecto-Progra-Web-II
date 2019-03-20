<%@ Page Title="" Language="C#" MasterPageFile="~/PrincipalAdminCentro.Master" AutoEventWireup="true" CodeBehind="Carrito.aspx.cs" Inherits="appEcoMonedas.Carrito" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="heading-breadcrumbs">
        <div class="container">
            <div class="row d-flex align-items-center flex-wrap">
                <div class="col-md-7">
                    <h1 class="h2">Carrito de compra</h1>
                </div>
            </div>
        </div>
    </div>

    <div id="content">
        <div class="container">
            <div class="row bar">
                <div class="col-lg-12">
                    <p class="text-muted lead">Actualmente tienes <span id="CantActual" runat="server"></span>  material(es) en el carrito.</p>
                </div>
                <div id="basket" class="col-lg-9">
                    <div class="box mt-0 pb-0 no-horizontal-padding">
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                            <ContentTemplate>
                                <div class="table-responsive">
                                    <asp:GridView ID="grvCarrito" runat="server"
                                        AutoGenerateColumns="false" DataKeyNames="IDMaterial"
                                        GridLines="none" CellPadding="4"
                                        CssClass="table"
                                        OnRowDeleting="grvCarrito_RowDeleting">

                                        <Columns>
                                            <asp:TemplateField HeaderText="Material">

                                                <ItemTemplate>
                                                    <asp:Label
                                                        runat="server"
                                                        Text='<%# Eval("material.Nombre")%>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField>
                                                <ItemTemplate>
                                                    <asp:Image ID="Image1" runat="server" BorderWidth="5" BorderColor='<%# System.Drawing.ColorTranslator.FromHtml(Eval("material.ID_Color").ToString()) %>' CssClass="img-fluid image1 p-1" ImageUrl='<%# Eval("material.Imagen", "~/imagenes/material/{0}")%>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Cantidad" FooterText="a">
                                                <ItemTemplate>
                                                    <asp:TextBox
                                                        ID="CantidadComprar"
                                                        Width="40"
                                                        runat="server" type="number"
                                                        OnTextChanged="CantidadComprar_TextChanged"
                                                        Text='<%# Eval("cantidad")%>' AutoPostBack="true"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                                                        ErrorMessage="* Debe ingresar la cantidad de materiales" ControlToValidate="CantidadComprar"
                                                        SetFocusOnError="true" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                                    <asp:RegularExpressionValidator
                                                        ID="RegularExpressionValidator1"
                                                        runat="server"
                                                        Text="* Solo debe digitar números"
                                                        ControlToValidate="CantidadComprar"
                                                        SetFocusOnError="true" ForeColor="Red" Display="Dynamic"
                                                        ValidationExpression="^\d+$"></asp:RegularExpressionValidator>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                            <asp:BoundField HeaderText="Precio Unitario" DataField="precioUnitario" DataFormatString="{0:N2} EcoMonedas"></asp:BoundField>
                                            <asp:TemplateField HeaderText="Total">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblTotal" runat="server" Text='<%#: String.Format("{0:c}", ((Convert.ToDouble(Eval("cantidad"))) *  Convert.ToDouble(Eval("precioUnitario"))))%>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:CommandField ShowDeleteButton="true" ButtonType="Image" DeleteImageUrl="imagenes/Varias/Eliminar.png" />
                                        </Columns>
                                    </asp:GridView>
                                </div>
                                <div class="float-right">
                                    <strong>
                                        <asp:Label ID="LabelTotalText" runat="server" Text="Total generado: "></asp:Label>
                                        <asp:Label ID="lblTotal" runat="server" Text="" Width="150px"></asp:Label>
                                    </strong>
                                </div>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                        <div class="box-footer d-flex justify-content-between align-items-center">
                            <div class="row">
                                <div class="col-12">
                                    <asp:LinkButton ID="btnConfirmaCanje" CssClass="btn btn-primary" OnClick="btnConfirmaCanje_Click" ValidationGroup="validaCanje" runat="server">Confirmar el canje <i class="fa fa-chevron-right"></i></asp:LinkButton>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3">
                    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                        <ContentTemplate>
                            <div id="order-summary" class="box mt-0 mb-4 p-0">
                                <div class="box-header mt-0">
                                    <h3>Resúmen del canje</h3>
                                </div>
                                Centro de Acopio:
                <p class="text-muted">
                    <asp:Label ID="lblCentroDeAcopio" runat="server" Text=""></asp:Label>
                                </p>
                                Administrador del centro:
                <p class="text-muted">Sr./ Sra.
                    <asp:Label ID="lblNombreAdminCentro" runat="server" Text=""></asp:Label></p>
                                <div class="table-responsive">
                                    <table class="table">
                                        <tbody>
                                            <tr>
                                                <td>Subtotal del Canje</td>
                                                <th>
                                                    <asp:Label ID="lblSubtotalCanje" runat="server" Text=""></asp:Label></th>
                                            </tr>
                                            <tr class="total">
                                                <td>Total</td>
                                                <th>
                                                    <asp:Label ID="lblTotalCanje" runat="server" Text=""></asp:Label></th>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
