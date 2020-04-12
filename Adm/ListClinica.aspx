<%@ Page Title="" Language="C#" MasterPageFile="~/Adm/MasterPage.master" AutoEventWireup="true" CodeFile="ListClinica.aspx.cs" Inherits="Adm_ListClinica" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        function AbrirModal(id) {
            $("#" + id).modal('show');
        }
    </script>
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
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>Listagem de Clinicas
           <i class="fa fa-hospital-o"></i>
            <small>
                <asp:Label runat="server" ID="TotalRegistros"></asp:Label></small>
            &nbsp;
              <a href="FormularioClinica.aspx?Operacao=novo" class="btn btn-primary" title="CLIQUE PARA CADASTRAR UMA NOVA ClINICA"><i class="glyphicon glyphicon-plus-sign"></i>&nbsp;&nbsp;NOVA CLINICA</a>

        </h1>

        <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-home"></i>Inicio</a></li>
            <li><a href="ListClinica.aspx">Listagem de Clinicas</a></li>
            <!-- <li class="active">Data tables</li> -->
        </ol>
    </section>

    <!-- Main content -->
    <section class="content">
        <div class="row">
            <div class="col-xs-12">
                <div class="box">
                    <!-- /.box-header -->
                    <div class="box-body">
                        <table id="Listagem" class="table table-bordered table-striped">

                            <asp:Repeater runat="server" ID="Repeater">
                                <HeaderTemplate>
                                    <!--   <table class="table table-hover">-->
                                    <thead>
                                        <tr class="product-filter breadcrumb">
                                            <th>Nome</th>
                                            <th>CNPJ</th>
                                            <th>Telefone</th>                                            
                                            <th>Ultima Alteração</th>
                                            <th style="text-align: center;">- Opções -</th>
                                        </tr>
                                    </thead>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <tr>

                                        <td><%#Eval("clin_nome") %></td>
                                        <td><%#Eval("clin_cnpj") %></td>
                                        <td><%#Eval("clin_telefone") %> </td>                                        
                                        <td><%#Eval("data_alteracao") %> </td>
                                        <td style="text-align: center;">
                                            <a href="/Adm/FormularioClinica.aspx?Operacao=editar&id=<%#Eval("clin_id") %>">
                                                <div class="btn btn-primary"><i class="glyphicon glyphicon-edit"></i>&nbsp;Editar</div>
                                            </a>&nbsp;
                            <a href="#void" data-toggle="modal" data-target="#modal-danger" onclick="AbrirModal('ModalExcluir<%#Eval("clin_id") %>');">
                                <div class="btn btn-danger"><i class="glyphicon glyphicon-trash"></i>&nbsp;Excluir</div>
                            </a>

                                            <!-- Modal -->
                                            <div class="modal modal-danger fade" id="ModalExcluir<%#Eval("clin_id") %>" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                                                <div class="modal-dialog" role="document">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                                            <h4 class="modal-title" id="myModalLabel">Excluir</h4>
                                                        </div>
                                                        <div class="modal-body">
                                                            Tem certeza que deseja excluir o Usuário?
                                                        </div>
                                                        <div class="modal-footer">
                                                            <button type="button" class="btn btn-outline pull-left" data-dismiss="modal">Cancelar</button>

                                                            <a href="/Adm/FormularioClinica.aspx?Operacao=excluir&id=<%#Eval("clin_id") %>">
                                                                <button type="button" class="btn btn-danger">Sim, excluir</button></a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                        </td>
                                    </tr>
                                </ItemTemplate>
                                <FooterTemplate>
                                </FooterTemplate>
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

