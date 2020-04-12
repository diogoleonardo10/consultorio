<%@ Page Title="" Language="C#" MasterPageFile="~/Adm/MasterPage.master" AutoEventWireup="true" CodeFile="FormularioUsuario.aspx.cs" Inherits="Adm_FormularioUsuario" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <!-- Bootstrap 3.3.7 -->
    <link rel="stylesheet" href="bower_components/bootstrap/dist/css/bootstrap.min.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="bower_components/font-awesome/css/font-awesome.min.css">
    <!-- Ionicons -->
    <link rel="stylesheet" href="bower_components/Ionicons/css/ionicons.min.css">
    <!-- daterange picker -->
    <link rel="stylesheet" href="bower_components/bootstrap-daterangepicker/daterangepicker.css">
    <!-- bootstrap datepicker -->
    <link rel="stylesheet" href="bower_components/bootstrap-datepicker/dist/css/bootstrap-datepicker.min.css">
    <!-- iCheck for checkboxes and radio inputs -->
    <link rel="stylesheet" href="plugins/iCheck/all.css">
    <!-- Bootstrap Color Picker -->
    <link rel="stylesheet" href="bower_components/bootstrap-colorpicker/dist/css/bootstrap-colorpicker.min.css">
    <!-- Bootstrap time Picker -->
    <link rel="stylesheet" href="plugins/timepicker/bootstrap-timepicker.min.css">
    <!-- Select2 -->
    <link rel="stylesheet" href="bower_components/select2/dist/css/select2.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="dist/css/AdminLTE.min.css">
    <!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
    <link rel="stylesheet" href="dist/css/skins/_all-skins.min.css">

   
    <!-- Google Font -->
    <link rel="stylesheet"
        href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>Formulario de usuário
       
            <small><i class="fas fa-user-tie"></i>&nbsp;Cadastro</small>
        </h1>
        <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-home"></i>Home</a></li>
            <li><a href="ListUsuario.aspx">Usuários</a></li>
            <li class="active">Cadastro de usuário</li>
        </ol>
    </section>

    <!-- Main content -->
    <section class="content">

        <div class="row">
            <!-- left column -->
            <div class="col-md-12">
                <!-- general form elements -->
                <div class="box box-primary">
                    <div class="box-header with-border">
                        <h3 class="box-title">Preencha os dados abaixo</h3>
                    </div>
                    <!-- /.box-header -->
                    <!-- form start -->

                    <div class="box-body">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="InputNome"><i class="fas fa-user-tag"></i>&nbsp;Nome</label>
                                <asp:TextBox ID="TxtNomeUsuario" AutoCompleteType="Disabled" required="required" runat="server" class="form-control" placeholder="Informe o nome do usuário"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                            <label for="InputEmail"><i class="far fa-envelope"></i>&nbsp;E-mail</label>
                                <asp:TextBox ID="TextBoxEmail" AutoCompleteType="Email" TextMode="Email" runat="server" class="form-control" placeholder="Informe seu e-mail de contato"></asp:TextBox>
                             </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label><i class="fas fa-key"></i>&nbsp;Senha</label>
                                <asp:TextBox ID="TxtSenhaUsuario" type="password" required="required" runat="server" class="form-control" placeholder="Informe a senha"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label><i class="fas fa-check"></i><i class="fas fa-key"></i>&nbsp;Confirmar Senha</label>
                                <asp:TextBox ID="TextBoxConfirmarSenha" type="password" required="required" runat="server" class="form-control" placeholder="Informe a senha"></asp:TextBox>
                            </div>
                        </div>
                        
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="InputEmail"><i class="glyphicon glyphicon-earphone"></i>&nbsp;Telefone</label>
                                <asp:TextBox ID="TextBoxTelefone" AutoCompleteType="BusinessPhone" TextMode="Phone" runat="server" type="numeric" maxlength="15" class="form-control" placeholder="Informe seu telefone de contato"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label><i class="fas fa-user-cog"></i>&nbsp;Tipo</label>
                                <asp:DropDownList ID="DropDownListTipo" runat="server" class="form-control" title="Selecione o tipo">
                                    <asp:ListItem Text="Operacional" Value="Operacional"></asp:ListItem> 
                                    <asp:ListItem Text="Administrador" Value="Administrador"></asp:ListItem>
                                   
                                </asp:DropDownList>
                            </div>
                        </div>
                      

                    </div>
                    <!-- /.box-body -->

                    <div class="box-footer">
                        <a href="ListUsuario.aspx" class="btn btn-default" onclick="javascript:window.location.href='ListUsuario.aspx'"><i class="fas fa-undo"></i>&nbsp;Cancelar
                        </a>
                        <asp:button runat="server" text="Salvar" id="btnSalvar" OnClick="btnSalvar_Click" class="btn btn-primary"/>
                            

                    </div>
                </div>
                <!-- /.box -->
            </div>



            <%-- <div class="col-md-6">
         
                <!-- general form elements disabled -->
                <div class="box box-info">
                    <div class="box-header with-border">
                        <h3 class="box-title">Informações complementares</h3>
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body">

                        <!-- select -->
                        <div class="form-group">
                            <label for="InputStatus">Status</label>
                            <br />
                            <asp:DropDownList runat="server" ID="DdlStatusUsuario" class="form-control" Style="border: 1px solid #BEBEBE; width: 180px; display: inline-block; border-radius: 3px;">
                                <asp:ListItem Value="AT" Selected="True">Ativo</asp:ListItem>
                                <asp:ListItem Value="IN">Inativo</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="form-group">
                            <label for="TipoUsuario">Tipo</label>
                            <br />
                            <asp:DropDownList runat="server" ID="DdlTipoUsuario" CssClass="form-control" Style="border: 1px solid #BEBEBE; width: 180px; display: inline-block; border-radius: 3px;">
                                <asp:ListItem Value="Atendimento" Selected="True">Atendimento</asp:ListItem>
                                <asp:ListItem Value="Comercial">Comercial</asp:ListItem>
                                <asp:ListItem Value="Diretor">Diretor</asp:ListItem>
                            </asp:DropDownList>
                        </div>

                    </div>
                    <!-- /.box-body -->
                </div>
                <!-- /.box -->
            </div>
        </div>--%>
        </div>
    </section>
    <!-- /.content -->


</asp:Content>

