<%@ Page Title="" Language="C#" MasterPageFile="~/PrincipalInicio.Master" AutoEventWireup="true" CodeBehind="Registro.aspx.cs" Inherits="appEcoMonedas.Registro" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/font.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons" />
    <!---https://bootsnipp.com/snippets/kEPlV-->
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="no-padding-top no-padding-bottom" style="background: #f9f9f9;">
        <div class="container-fluid">
            <div class="row">
                <div class="container">
                    <div class="text-center">
                        <i class="icon-paper-and-pencil" style="font-size: 72px;"></i>
                        <h2>Autoregistro</h2>
                        <p class="lead">LLená este formulario, y se parte del cambio, hacia un país más verde.</p>
                    </div>
                    <div class="row">
                        <div class="col-lg-8 col-md-8 offset-lg-2 offset-md-2 col-sm-12">
                            <div class="form-group input-group">
                                <label class="control-label col-sm-3">Correo <span class="text-danger">*</span></label>
                                <div class="col-md-8 col-sm-9">
                                    <div class="form-group input-group">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text"><i class="fa fa-envelope"></i></span>
                                        </div>
                                        <input name="" class="form-control" placeholder="Email address" type="email"/>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    
                   
                    <!-- form-group// -->
                    <div class="form-group">
                        <button type="submit" class="btn btn-primary btn-block">Create Account  </button>
                    </div>
                    <!-- form-group// -->
                    <p class="text-center">Have an account? <a href="">Log In</a> </p>

                </div>
            </div>

        </div>
    </section>
</asp:Content>
