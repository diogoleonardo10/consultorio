<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="AcessoSeguro_Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <title>.::Login::.</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic" />

    <!-- Diz ao navegador para responder à largura da tela -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport" />
    <!-- Bootstrap 3.3.7 -->
    <link href="../Adm/bower_components/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet" />
    <!-- Font Awesome -->
    <link href="../Adm/bower_components/font-awesome/css/font-awesome.min.css" rel="stylesheet" />
    <!-- Ionicons -->
    <link rel="stylesheet" href="../Adm/bower_components/Ionicons/css/ionicons.min.css" />
    <!-- style -->
    <link rel="stylesheet" href="../Adm/dist/css/AdminLTE.min.css" />
    <!-- iCheck -->
    <link rel="stylesheet" href="../Adm/plugins/iCheck/square/blue.css" />

</head>
<body class="hold-transition login-page" style="background-color: rgb(65, 103, 214); background-attachment: fixed;">
    <div class="login-box">
       
        <div class="login-box-body">
            <p class="login-box-msg">Faça login para iniciar sua sessão</p>

            <form runat="server" id="form1">
                <div class="form-group has-feedback">
                    <asp:TextBox runat="server" placeholder="E-mail" class="form-control" ID="txtEmail" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Informe seu e-mail de acesso';}" />

                    <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
                </div>
                <div class="form-group has-feedback">
                    <asp:TextBox runat="server" ID="txtSenha" placeholder="Senha" TextMode="Password" class="form-control" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'password';}" />

                    <span class="glyphicon glyphicon-lock form-control-feedback"></span>
                </div>
                <div class="row">
                    <div class="col-xs-8">
                        <asp:Label runat="server" ID="NaoDeu"></asp:Label>
                    </div>
                    <!-- /.col -->
                    <div class="col-xs-4">
                        <asp:Button runat="server" Text="Entrar" ID="btnEntrar" class="btn btn-primary btn-block btn-flat" OnClick="btnEntrar_Click" />

                    </div>
                    <!-- /.col -->
                </div>

            </form>

        </div>
        <!-- /.login-box-body -->
        <br />
        <p class="login-box-msg" style="color: antiquewhite">© <%=System.DateTime.Now.ToString("yyyy") %> Login Admintrativo.</p>
    </div>
    <!-- /.login-box -->

    <!-- jQuery 3 -->
    <script src="../Adm/bower_components/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap 3.3.7 -->
    <script src="../Adm/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
    <!-- iCheck -->
    <script src="../Adm/plugins/iCheck/icheck.min.js"></script>
    <script>
        $(function () {
            $('input').iCheck({
                checkboxClass: 'icheckbox_square-blue',
                radioClass: 'iradio_square-blue',
                increaseArea: '20%' // optional
            });
        });
         </script>

</body>

</html>
