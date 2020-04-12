<%@ Page Title="" Language="C#" MasterPageFile="~/Adm/MasterPage.master" AutoEventWireup="true" CodeFile="FormularioAgendamento.aspx.cs" Inherits="Adm_FormularioAgendamento" %>

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
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
        
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>Agendamento     
            &nbsp;<i class="fas fa-notes-medical"></i>

        </h1>
        <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-home"></i>Home</a></li>
            <li><a href="ListAgendamento.aspx">Agendamentos</a></li>
            <li class="active">Agentamento</li>
        </ol>
    </section>

    <!-- Main content -->
    <section class="content">

        <div class="row">
            <!-- left column -->
            <div class="col-md-12">
                <div class="box box-primary">
                    <div class="box-header with-border">
                        <h3 class="box-title">Agendamento - Nº
                <asp:Label ID="LabelNumOS" runat="server"></asp:Label></h3>
                    </div>


                    <div class="box-body">
                      <!--  -->
                        <div class="col-md-4">
                            <div class="form-group">
                                <i class="fas fa-user-tie"></i>&nbsp;<label>Atendente</label>
                                <asp:DropDownList ID="DropDownListAtendente" runat="server" class="form-control"></asp:DropDownList>
                            </div>
                        </div>

                        <div class="col-md-4">
                            <div class="form-group">
                                <div class="form-group">
                                    <i class="fas fa-diagnoses"></i>&nbsp;<label>Paciente</label>
                                    <asp:DropDownList ID="DropDownListSolicitante" runat="server" class="form-control"></asp:DropDownList>
                                </div>

                            </div>
                        </div>

                        <div class="col-md-4">
                            <label><i class="fa fa-hospital-o"></i>&nbsp;Clinica</label>
                            <asp:DropDownList ID="DropDownListClinica" runat="server" required="required" class="form-control" title="Onde o serviço será realizado">
                               
                                
                            </asp:DropDownList>
                        </div>
                        <div class="col-md-5">
                            <div class="form-group" style="text-align: center">
                                <div class="col-md-6">
                                    <label>Data Programada&nbsp;</label>

                                    <div class="input-group date">
                                        <div class="input-group-addon">
                                            <i class="fa fa-calendar"></i>
                                        </div>
                                        <asp:TextBox type="Date" class="form-control pull-right" ID="TextBoxData" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <label>Horário</label>

                                    <div class="input-group">
                                        <asp:TextBox type="Time" TextMode="Time" class="form-control" ID="TextBoxHora" runat="server"></asp:TextBox>
                                        <div class="input-group-addon">
                                            <i class="fa fa-clock-o"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>


                          <div class="col-md-3">
                            <div class="form-group">
                                <label>Status</label>
                                
                                <asp:DropDownList ID="DropDownListStatus" runat="server" class="form-control" placeholder="Selecione o status">
                                    <asp:ListItem Text="Selecione"></asp:ListItem>
                                    <asp:ListItem Text="Aguardando atendimento" Value="Aguardando atendimento"></asp:ListItem>
                                    <asp:ListItem Text="Atendido" Value="Atendido"></asp:ListItem>
                                    <asp:ListItem Text="Não compareceu" Value="Não compareceu"></asp:ListItem>
                                    <asp:ListItem Text="Cancelado pelo Usuário" Value="Cancelado pelo Usuário"></asp:ListItem>
                                    <asp:ListItem Text="Cancelado pela Clínica" Value="Cancelado pela Clínica"></asp:ListItem>

                                </asp:DropDownList>
                            </div>
                        </div>

                       <%--  <div class="col-md-2" style="float: right;">
                            <div class="form-group">
                                <label for="InputNumero">Nº </label>
                                <asp:TextBox ID="TextBoxNumOS" runat="server" class="form-control" title="Nº da Ordem - Obrigatório"></asp:TextBox>

                            </div>
                        </div>    --%>                  
                     
                                                                  
                    </div>

                    <div class="box-footer">
                        &nbsp;&nbsp;&nbsp;
                        <a href="ListAgendamentos.aspx" class="btn btn-default" onclick="javascript:window.location.href='ListServico.aspx'"><i class="fas fa-undo"></i>&nbsp;Voltar
                        </a>
                        &nbsp;&nbsp;&nbsp;
                    <asp:button runat="server" Text="Salvar" id="btnSalvar" OnClick="BtnFinalizar_Click" class="btn btn-primary">
                       
                    </asp:button>

                    </div>

                </div>
            </div>
                
        </div>
    </section>

</asp:Content>
