<%@ Page Title="" Language="C#" MasterPageFile="~/Adm/MasterPage.master" AutoEventWireup="true" CodeFile="FormularioClinica.aspx.cs" Inherits="Adm_FormularioClinica" %>

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

    <link rel="stylesheet" href="dist/css/skins/_all-skins.min.css">

    <!-- Google Font -->
    <link rel="stylesheet"
        href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>Formulario de Clinica
       
            <small>Cadastro&nbsp;<i class="fa fa-hospital-o"></i></small>
        </h1>
        <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-home"></i>Home</a></li>
            <li><a href="ListClinica.aspx">Clinicas</a></li>
            <li class="active">Cadastro de Clinica</li>
        </ol>
    </section>

    <!-- Main content -->
    <section class="content">

        <div class="row">
            <!-- left column -->
            <div class="col-md-6">
                <!-- general form elements -->
                <div class="box box-primary">
                    <div class="box-header with-border">
                        <h3 class="box-title">Preencha os dados abaixo</h3>
                    </div>
                    <!-- /.box-header -->
                    <!-- form start -->
                    
                    <div class="box-body">
                        <div class="form-group">
                            <label for="InputDescricao">Nome Fantasia:</label>
                            <asp:TextBox ID="TextBoxNomeClinica" required="required" runat="server" class="form-control" placeholder="Informe o Descricao do Clinica"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="InputUnidade">CNPJ:</label>
                            <asp:TextBox ID="TextBoxCNPJ" required="required" MaxLength="12" type="number" runat="server" class="form-control" placeholder="Informe o CNPJ - Obrigatório"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label>Telefone:</label>
                            <asp:TextBox ID="TextBoxTelefone" required="required" MaxLength="15" name="phone" type="number" runat="server" class="form-control" placeholder="Informe o telefone - Obrigatório"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label>Endereço:</label>
                            <asp:TextBox ID="TextBoxEndereco" runat="server" class="form-control" placeholder="Informe o Descricao do Clinica"></asp:TextBox>
                        </div>

                    </div>
                    <!-- /.box-body -->

                    <div class="box-footer">
                        <a href="ListClinica.aspx" class="btn btn-default" onclick="javascript:window.location.href='ListClinica.aspx'"><i class="fas fa-undo"></i>&nbsp;Cancelar
                        </a>
                        <asp:Button runat="server" id="btnSalvar" Text="Salvar" OnClick="btnSalvar_ServerClick" class="btn btn-primary" />
                       <%--  <button runat="server" id="btnSalvar" onserverclick="btnSalvar_ServerClick" class="btn btn-primary">
                            Salvar &nbsp;&nbsp;<i class="fas fa-save"></i>
                        </button> --%>

                    </div>
                </div>
                <!-- /.box -->
            </div>

        </div>
    </section>
    <!-- /.content -->


</asp:Content>

