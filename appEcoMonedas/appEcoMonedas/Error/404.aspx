<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="404.aspx.cs" Inherits="appEcoMonedas._404" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Error 404 - Página no encontrada</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="description" content="Aplicación de ecomonedas, para el desarrollo sostenible." />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="robots" content="ecomoneda, Eco-Monedas, eco monedas, basura, reciclaje, plastico" />
    <!-- Bootstrap CSS-->
    <link rel="stylesheet" href="../vendor/bootstrap/css/bootstrap.min.css" />
    <link href="../css/sticky-footer.css" rel="stylesheet" />
    <!-- Font Awesome CSS-->
    <link href="../vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" />
    <!-- Google fonts - Roboto-->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,700" />
    <!-- Bootstrap Select-->
    <link rel="stylesheet" href="../vendor/bootstrap-select/css/bootstrap-select.min.css" />
    <!-- owl carousel-->
    <link rel="stylesheet" href="../vendor/owl.carousel/assets/owl.carousel.css" />
    <link rel="stylesheet" href="../vendor/owl.carousel/assets/owl.theme.default.css" />
    <!-- theme stylesheet-->
    <link rel="stylesheet" href="../css/style.default.css" id="theme" />
    <!-- Custom stylesheet - for your changes-->
    <link rel="stylesheet" href="../css/custom.css" />
    <!-- Favicon-->
    <link rel="shortcut icon" href="../img/Logo-Ico.png" />
</head>
<body>
    <form id="form1" runat="server">

        <div id="content">
            <div class="container">
                <div id="error-page" class="col-md-8 mx-auto text-center">
                    <div class="box">
                        <p class="text-center">
                            <asp:LinkButton ID="btnVolverInicio" OnClick="btnVolverInicio_Click" runat="server">
                                <img src="../img/logo.png" />
                            </asp:LinkButton>
                        </p>
                        <h3>Lo sentimos, la página que estas buscando deshabilitada o no existe.</h3>
                        <h4 class="text-muted">Error 404 - Página no encontrada</h4>
                        <p class="buttons">
                            <asp:LinkButton ID="btnVolver" CssClass="btn btn-template-outlined" OnClick="btnVolverInicio_Click" runat="server">
                                <i class="fa fa-home"></i>Volver al Inicio
                            </asp:LinkButton>
                        </p>
                    </div>
                </div>
            </div>
        </div>
        <footer class="footer main-footer">

            <div class="copyrights">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-4 text-center-md">
                            <p>© 2019. CR-Developers / Universidad Técnica Nacional | I Cuatrimestre</p>
                        </div>
                        <div class="col-lg-8 text-right text-center-md">
                            <p>Template design by <a href="https://bootstrapious.com/free-templates">Bootstrapious Templates </a></p>
                            <!-- Please do not remove the backlink to us unless you support further theme's development at https://bootstrapious.com/donate. It is part of the license conditions. Thank you for understanding :)-->
                        </div>
                    </div>
                </div>
            </div>
        </footer>
        <script src="../vendor/jquery/jquery.min.js"></script>
        <script src="../vendor/popper.js/umd/popper.min.js"> </script>
        <script src="../vendor/bootstrap/js/bootstrap.min.js"></script>
        <script src="../vendor/jquery.cookie/jquery.cookie.js"> </script>
        <script src="../vendor/waypoints/lib/jquery.waypoints.min.js"> </script>
        <script src="../vendor/jquery.counterup/jquery.counterup.min.js"> </script>
        <script src="../vendor/owl.carousel/owl.carousel.min.js"></script>
        <script src="../vendor/owl.carousel2.thumbs/owl.carousel2.thumbs.min.js"></script>
        <script src="../js/jquery.parallax-1.1.3.js"></script>
        <script src="../vendor/bootstrap-select/js/bootstrap-select.min.js"></script>
        <script src="../vendor/jquery.scrollto/jquery.scrollTo.min.js"></script>
        <script src="../js/front.js"></script>
    </form>
</body>
</html>
