<%@ Page Title="" Language="C#" MasterPageFile="~/PrincipalAdministrador.Master" AutoEventWireup="true" CodeBehind="ReporteEcomonedasGeneradas.aspx.cs" Inherits="appEcoMonedas.ReporteEcomonedasGeneradas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container bar">

        <div class="row">
            <div class="col-xl-3 col-md-6 mb-4">
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
            <div class="col-xl-3 col-md-6 mb-4">
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
            <div class="col-xl-3 col-md-6 mb-4">
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
            <div class="col-xl-3 col-md-6 mb-4">
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
            <div class="col-md-12">
                <div class="heading text-center">
                    <h2>Informe de ecomonedas generadas por centro de acopio</h2>
                </div>
                <div class="row text-center">
                    <div class="col-lg-6 col-md-6 col-xs-12 col-sm-12">
                        <div class="form-group">
                            <label class="float-left">
                                Fecha Inicio
                  <i class="text-primary fa fa-calendar-minus-o"></i>
                            </label>
                            <input type="date" class="form-control timepicker" value="14:00"/>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6 col-xs-12 col-sm-12">
                        <div class="form-group">
                            <label class="float-left">Fecha Fin <i class="text-primary fa fa-calendar-plus-o"></i></label>
                            <input type="date" class="form-control timepicker" value="14:00"/>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-3 col-xs-12 col-sm-12">
                        <button type="button" class="btn btn-primary btn-block">Cargar Reporte <i class="fa fa-search"></i></button>
                    </div>
                </div>
            </div>
            <div class="col-12">
            </div>
        </div>
    </div>
</asp:Content>
