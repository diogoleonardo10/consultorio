<%@ Page Title="" Language="C#" MasterPageFile="~/Adm/MasterPage.master" AutoEventWireup="true" CodeFile="FormularioPaciente.aspx.cs" Inherits="Adm_FormularioPaciente" %>

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

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->

    <!-- Google Font -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>Formulario de Paciente 
       
            <small>&nbsp;<i class="fas fa-diagnoses"></i></small>
        </h1>
        <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-home"></i>Home</a></li>
            <li><a href="ListPaciente.aspx">Pacientes</a></li>
            <li class="active">Cadastro de Paciente</li>
        </ol>
    </section>

    <!-- Main content -->
    <section class="content">

        <div class="row">
            <!-- left column -->
            <div class="col-md-12">
                <div class="box box-primary">
                    <div class="box-header with-border">
                        <h3 class="box-title">Preencha os dados abaixo</h3>
                    </div>
                    <!-- /.box-header -->
                    <!-- form start 
                         nome completo, telefone, CPF, email, 
                        se tem convênio com plano de saúde, 
                        o número do convênio do plano de saúde e o nome do convênio(caso tenha)                        
                        -->

                    <div class="box-body">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="InputNome">Nome: </label>
                                <asp:TextBox ID="TextBoxNome" required="required" runat="server" class="form-control" placeholder="Informe o nome completo - Obrigatório"></asp:TextBox>
                            </div>

                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>CPF: </label>
                                <asp:TextBox ID="TextBoxCPF" required="required" MaxLength="9" type="number" runat="server" class="form-control" placeholder="Informe o CPF - Obrigatório"></asp:TextBox>

                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>Telefone: </label>
                                <asp:TextBox ID="TextBoxTelefone" required="required" MaxLength="15" name="phone" type="number" runat="server" class="form-control" placeholder="Informe o telefone - Obrigatório"></asp:TextBox>

                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="InputEmail">E-mail:</label>
                                <asp:TextBox ID="TextBoxEmail" required="required" type="email" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$" runat="server" class="form-control" placeholder="Informe a descrição do equipamento - Obrigatório"></asp:TextBox>
                            </div>

                        </div>

                        <div class="col-md-4">
                            <div class="form-group">
                                <label>Possui Convênio médico ou Plano de Saúde?</label>
                                <asp:DropDownList ID="DropDownListPlano" runat="server" class="form-control select2" required="required">
                                    <asp:ListItem Text="Clique para selecionar a opção" Value=""></asp:ListItem>
                                    <asp:ListItem Text="Sim" Value="true"></asp:ListItem>
                                    <asp:ListItem Text="Não" Value="false"></asp:ListItem>                                    

                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <label>Nome do convênio:</label>
                               <asp:TextBox ID="TextBoxPlanoNome" runat="server" class="form-control" placeholder="Informe o nome completo"></asp:TextBox>
                       
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <label>Numero do convênio:</label>
                               <asp:TextBox ID="TextBoxPlanoNumero" type="number" runat="server" class="form-control" placeholder="Informe o n° de seu convênio"></asp:TextBox>

                            </div>
                        </div>

                    </div>
                    <!-- /.box-body -->

                    <div class="box-footer">
                        <a href="ListPaciente.aspx" class="btn btn-default" onclick="javascript:window.location.href='ListEquipamento.aspx'"><i class="fas fa-undo"></i>&nbsp;Cancelar
                        </a>
                        <asp:Button runat="server" ID="btnSalvar" Text="Salvar" OnClick="btnSalvar_Click" class="btn btn-primary" />
                                              
                    </div>
                </div>
                <!-- /.box -->
            </div>

        </div>

    </section>
</asp:Content>

