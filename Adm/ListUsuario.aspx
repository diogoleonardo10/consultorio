<%@ Page Title="" Language="C#" MasterPageFile="~/Adm/MasterPage.master" AutoEventWireup="true" CodeFile="ListUsuario.aspx.cs" Inherits="Adm_ListUsuario" %>

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
            $('#Listagem').DataTable({
                'paging': true,
                'lengthChange': true,
                'searching': true,
                'ordering': false,
                'info': true,
                'autoWidth': false
            })
        })
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>Listagem de Usuários
       <i class="fa fa-users"></i>
            <small>
                <asp:Label runat="server" ID="TotalRegistros"></asp:Label></small>
            &nbsp;
              <a href="FormularioUsuario.aspx?Operacao=novo" class="btn btn-primary" title="CLIQUE PARA CADASTRAR UM NOVO USUÁRIO"><i class="glyphicon glyphicon-plus-sign"></i>&nbsp;NOVO USUÁRIO</a>

        </h1>

        <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-home"></i>Inicio</a></li>
            <li><a href="ListUsuario.aspx">Listagem de Usuários</a></li>
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

                            <asp:Repeater runat="server" ID="RptUsuario">
                                <HeaderTemplate>
                                    <!--   <table class="table table-hover">-->
                                    <thead>
                                        <tr class="product-filter breadcrumb">
                                            <th>Nº</th>
                                            <th><i class="fas fa-tags"></i>&nbsp;Nome</th>
                                            
                                            <th><i class="fas fa-envelope"></i>&nbsp;E-mail</th>
                                            
                                            <th style="text-align: center;">- <i class="fas fa-cogs"></i>&nbsp;Opções -</th>
                                        </tr>
                                    </thead>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <tr>
                                        <td><%#Eval("usua_id") %></td>
                                        <td><%#Eval("usua_nome") %></td>                                                                            
                                        <td><%#Eval("usua_email") %></td>                                      
                                        <td style="text-align: center;">
                                            <a href="/Adm/FormularioUsuario.aspx?Operacao=editar&id=<%#Eval("usua_id") %>">
                                                <div class="btn btn-primary"><i class="glyphicon glyphicon-edit"></i>&nbsp;Editar</div>
                                            </a>&nbsp;
                            <a href="#void" data-toggle="modal" data-target="#modal-danger" onclick="AbrirModal('ModalExcluir<%#Eval("usua_id") %>');">
                                <div class="btn btn-danger"><i class="glyphicon glyphicon-trash"></i>&nbsp;Excluir</div>
                            </a>

                                            <!-- Modal -->
                                            <div class="modal modal-danger fade" id="ModalExcluir<%#Eval("usua_id") %>" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
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

                                                            <a href="/Adm/FormularioUsuario.aspx?Operacao=excluir&id=<%#Eval("usua_id") %>">
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

