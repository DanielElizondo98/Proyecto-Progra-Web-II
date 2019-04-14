<%@ Page Title="" Language="C#" MasterPageFile="~/PrincipalAdministrador.Master" AutoEventWireup="true" CodeBehind="ReporteEcomonedasGeneradas.aspx.cs" Inherits="appEcoMonedas.ReporteEcomonedasGeneradas" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=12.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        table img {
            max-width: inherit !important;
            max-height: inherit !important;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container bar">
        <div class="row">
            <div class="col-lg-3 col-md-6 col-sm-12 mb-4">
                <div class="card border-left-primary shadow h-100 py-2">
                    <div class="card-body">
                        <div class="row no-gutters align-items-center">
                            <div class="col mr-2">
                                <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">Total de clientes</div>
                                <div class="h5 mb-0 font-weight-bold text-gray-800">15 clientes</div>
                            </div>
                            <div class="col-auto">
                                <i class="fa fa-user fa-2x text-gray-300"></i>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 col-sm-12 mb-4">
                <div class="card border-left-success shadow h-100 py-2">
                    <div class="card-body">
                        <div class="row no-gutters align-items-center">
                            <div class="col mr-2">
                                <div class="text-xs font-weight-bold text-success text-uppercase mb-1">Total de centros de acopio</div>
                                <div class="h5 mb-0 font-weight-bold text-gray-800">12 Centros</div>
                            </div>
                            <div class="col-auto">
                                <i class="fa fa-home fa-2x text-gray-300"></i>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 col-sm-12 mb-4">
                <div class="card border-left-info shadow h-100 py-2">
                    <div class="card-body">
                        <div class="row no-gutters align-items-center">
                            <div class="col mr-2">
                                <div class="text-xs font-weight-bold text-info text-uppercase mb-1">Total de materiales</div>
                                <div class="h5 mb-0 font-weight-bold text-gray-800">12 Centros</div>
                            </div>
                            <div class="col-auto">
                                <i class="fa fa-recycle fa-2x text-gray-300"></i>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 col-sm-12 mb-4">
                <div class="card border-left-warning shadow h-100 py-2">
                    <div class="card-body">
                        <div class="row no-gutters align-items-center">
                            <div class="col mr-2">
                                <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">Total de cupones canjeables</div>
                                <div class="h5 mb-0 font-weight-bold text-gray-800">18 cupones</div>
                            </div>
                            <div class="col-auto">
                                <i class="fa fa-qrcode fa-2x text-gray-300"></i>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="box row">
            <div class="col-12">
                <div class="heading text-center">
                    <h2>Informe de ecomonedas generadas por centro de acopio</h2>
                </div>
                <div class="row text-center">
                    <div class="col-lg-6 col-md-6 col-sm-12">
                        <div class="form-group">
                            <label class="float-left">
                                Fecha Inicio
                 
                                <i class="text-primary fa fa-calendar-minus-o"></i>
                            </label>
                            <asp:TextBox ID="txtFechaMin" TextMode="Date" CssClass="form-control" Text="<%#Convert.ToDateTime(DateTime.Now).ToShortDateString()%>" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ValidationGroup="ValidaFechas" ErrorMessage="* Debe seleccionar la fecha de incio" ControlToValidate="txtFechaMin" SetFocusOnError="true" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>

                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6 col-sm-12">
                        <div class="form-group">
                            <label class="float-left">Fecha Fin <i class="text-primary fa fa-calendar-plus-o"></i></label>
                            <asp:TextBox ID="txtFechaMax" TextMode="Date" CssClass="form-control" Text="<%#Convert.ToDateTime(DateTime.Now).ToShortDateString()%>" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ValidationGroup="ValidaFechas" ErrorMessage="* Debe seleccionar la fecha de fin" ControlToValidate="txtFechaMax" SetFocusOnError="true" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                            <asp:CompareValidator ID="cmpVal1" ControlToCompare="txtFechaMin"
                                ControlToValidate="txtFechaMax" ValidationGroup="ValidaFechas" Display="Dynamic" Type="Date" Operator="GreaterThanEqual"
                                ErrorMessage="* La fecha de fin no puede ser menor a la de inicio" ForeColor="Red" runat="server"></asp:CompareValidator>

                        </div>
                    </div>
                    <div class="col-lg-3 col-md-3 col-sm-12">
                        <asp:LinkButton ID="btnBuscar" ValidationGroup="ValidaFechas" CssClass="btn btn-primary btn-block" OnClick="btnBuscar_Click" runat="server">Cargar Reporte <i class="fa fa-search"></i></asp:LinkButton>
                    </div>
                </div>

            </div>
            <div class="col-12 mt-3">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <div class="table-responsive">
                            <rsweb:ReportViewer ID="ReportViewer1" Width="100%" runat="server" Font-Names="Verdana" Font-Size="10pt" WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" SizeToReportContent="true">

                                <LocalReport ReportPath="ReporteEcomonedasGeneradas.rdlc">
                                    <DataSources>
                                        <rsweb:ReportDataSource Name="DataSet1" DataSourceId="ObjectDataSource1"></rsweb:ReportDataSource>
                                    </DataSources>
                                </LocalReport>
                            </rsweb:ReportViewer>
                            <asp:ObjectDataSource runat="server" SelectMethod="ListaReporteEcomonedasGeneradas" TypeName="LogicaNegocios.TransaccionMaterialLN" ID="ObjectDataSource1">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="txtFechaMin" DefaultValue=" " PropertyName="Text" Name="fechaMin" Type="String"></asp:ControlParameter>
                                    <asp:ControlParameter ControlID="txtFechaMax" DefaultValue=" " PropertyName="Text" Name="fechaMax" Type="String"></asp:ControlParameter>
                                </SelectParameters>
                            </asp:ObjectDataSource>
                        </div>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="btnBuscar" EventName="Click" />
                    </Triggers>
                </asp:UpdatePanel>
            </div>
        </div>
    </div>
</asp:Content>
