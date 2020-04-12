<%@ Page Title="" Language="C#" MasterPageFile="~/Adm/MasterPage.master" AutoEventWireup="true" CodeFile="ListPaciente.aspx.cs" Inherits="Adm_ListPaciente" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <!-- DataTables -->

    <script src="bower_components/datatables.net/js/jquery.dataTables.js"></script>
    <!--<script src="bower_components/datatables.net/js/jquery.dataTables.min.js"></script> -->
    <script src="bower_components/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>

    <!-- page script -->
    <script>
        $(function () {
            $('#Listagem').DataTable()
            $('#example2').DataTable({
                'paging': true,
                'lengthChange': false,
                'searching': false,
                'ordering': true,
                'info': true,
                'autoWidth': false
            })
        })
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server" DefaultButton="ImageButtonBuscar" defaultfocus="tags">

    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>Listagem de Pacientes &nbsp;<i class="fas fa-diagnoses"></i>

            <small>
                <asp:Label runat="server" ID="TotalRegistros"></asp:Label></small>
        </h1>
        <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-dashboard"></i>Inicio</a></li>
            <li><a href="Listpaciente.aspx">Listagem de Pacientes</a></li>

        </ol>
    </section>

    <!-- Main content -->
    <section class="content">
        <div class="row">
            <div class="col-xs-12">

                <div class="box">
                    <div class="box-header">
                        <!-- <h3 class="box-title">Data Table With Full Features</h3> -->
                        <a href="FormularioPaciente.aspx?Operacao=novo" class="btn btn-primary"
                            title="CLIQUE PARA CADASTRAR UM NOVO PACIENTE"><i class="glyphicon glyphicon-plus-sign"></i>&nbsp;NOVO PACIENTE</a>

                    </div>

                    <!-- /.box-header -->
                    <div class="box-body">
                        <table id="Listagem" class="table table-bordered table-striped">

                            <asp:Repeater runat="server" ID="Repeater">
                                <HeaderTemplate>
                                    <thead>
                                        <tr>
                                            <th>Nome</th>
                                            <th>CPF</th>
                                            <th>Telefone</th>
                                            <th>E-mail</th>
                                            <th>Opções</th>
                                        </tr>
                                    </thead>
                                </HeaderTemplate>

                                <ItemTemplate>
                                    <tr>
                                        <td><%#Eval("paci_nome")%></td>
                                        <td><%#Eval("paci_cpf")%></td>
                                        <td><%#Eval("paci_telefone")%></td>
                                        <td><%#Eval("paci_email")%></td>
                                        <td>
                                            <a href="FormularioPaciente.aspx?Operacao=editar&id=<%#Eval("paci_id") %>" class="btn btn-success"><i class="glyphicon glyphicon-edit" title="EDITAR">&nbsp;EDITAR</i></a>
                                            <a href="#ModalExcluir<%#Eval("paci_id") %>" data-toggle="modal" class="btn btn-danger"><i class="glyphicon glyphicon-trash" title="EXCLUIR">&nbsp;EXCLUIR</i></a>
                                            <!-- Modal -->
                                            <div class="modal modal-danger fade" id="ModalExcluir<%#Eval("paci_id") %>" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                                                <div class="modal-dialog" role="document">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                                            <h4 class="modal-title" id="myModalLabel">Excluir</h4>
                                                        </div>
                                                        <div class="modal-body">
                                                            Tem certeza que deseja excluir o item selecionado?
                                                        </div>
                                                        <div class="modal-footer">
                                                            <button type="button" class="btn btn-outline pull-left" data-dismiss="modal">Cancelar</button>

                                                            <a href="/Adm/FormularioPaciente.aspx?Operacao=excluir&id=<%#Eval("paci_id") %>">
                                                                <button type="button" class="btn btn-danger">Sim, excluir</button></a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                        </td>
                                    </tr>
                                </ItemTemplate>

                                <%--  <FooterTemplate>
                                    <tr>
                                        <th>Nome</th>
                                        <th>CPF</th>
                                        <th>Telefone</th>
                                        <th>E-mail</th>
                                        <th>Opções</th>
                                    </tr>
                                </FooterTemplate> --%>
                            </asp:Repeater>
                        </table>
                    </div>
                    <!-- /.box-body -->
                </div>
                <!-- /.box -->
            </div>
            <!-- /.col -->
        </div>
        <!-- /.row -->
    </section>
    <!-- /.content -->

</asp:Content>
