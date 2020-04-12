<%@ Page Title="" Language="C#" MasterPageFile="~/Adm/MasterPage.master" AutoEventWireup="true" CodeFile="ListAgendamentos.aspx.cs" Inherits="Adm_ListAgendamentos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        function AbrirModal(id) {
            $("#" + id).modal('show');
        }
    </script>
    <!-- DataTables -->
    <script src="bower_components/datatables.net/js/jquery.dataTables.js"></script>   
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
                'autoWidth': true
            })
        })
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>Consultas Agendadas
           <i class="fas fa-notes-medical"></i>
            <small>
                <asp:Label runat="server" ID="TotalRegistros"></asp:Label></small>
            &nbsp;
              <a href="FormularioAgendamento.aspx?Operacao=novo" class="btn btn-primary" title="CLIQUE PARA CADASTRAR UM NOVO AGENDAMENTO DE CONSULTA"><i class="glyphicon glyphicon-plus-sign"></i>
                  &nbsp;NOVO AGENDAMENTO</a>

        </h1>

        <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-home"></i>Inicio</a></li>
            <li><a href="ListOS.aspx">Agendamentos</a></li>
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

                            <asp:Repeater runat="server" ID="RepeaterOS">
                                <HeaderTemplate>
                                    
                                    <thead>
                                        <tr class="product-filter breadcrumb">
                                            <th>Nº</th>
                                            <th>Paciente</th>
                                            <th>Clinica</th>                                            
                                            
                                            <th>Data/Hora</th>
                                            <th>Status</th>
                                            <th style="text-align: center;">- <i class="fas fa-cogs"></i>&nbsp;Opções</th>
                                        </tr>
                                    </thead>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <tr>
                                        <td><%#Eval("agen_id") %></td>
                                        <td><%#Eval("usua_nome") %> </td>
                                        <td><%#Eval("clin_nome") %></td>                                      
                                        <td><%#Eval("agen_data", "{0:dd/MM/yyyy}") %> - <%#Eval("agen_hora") %> </td>                                        
                                        <td><%#Eval("agen_status") %> </td>
                                        <td style="text-align: center;">
                                            <a href="/Adm/FormularioAgendamento.aspx?Operacao=editar&id=<%#Eval("agen_id") %>">
                                                <div class="btn btn-primary"><i class="glyphicon glyphicon-edit"></i>&nbsp;Editar</div>
                                            </a>&nbsp;
                                             <a href="/Adm/VisualizarAgendamento.aspx?Operacao=editar&id=<%#Eval("agen_id") %>">
                                                 <div class="btn btn-success"><i class="fas fa-print"></i>&nbsp;Imprimir</div>
                                             </a>&nbsp;
                                            <a href="#void" data-toggle="modal" data-target="#modal-danger" onclick="AbrirModal('ModalExcluir<%#Eval("agen_id") %>');">
                                                <div class="btn btn-danger"><i class="glyphicon glyphicon-trash"></i>&nbsp;Excluir</div>
                                            </a>

                                            <!-- Modal -->
                                            <div class="modal modal-danger fade" id="ModalExcluir<%#Eval("agen_id") %>" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                                                <div class="modal-dialog" role="document">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                                            <h4 class="modal-title" id="myModalLabel">Excluir</h4>
                                                        </div>
                                                        <div class="modal-body">
                                                            Tem certeza que deseja excluir a Ordem de Serviço?
                                                        </div>
                                                        <div class="modal-footer">
                                                            <button type="button" class="btn btn-outline pull-left" data-dismiss="modal">Cancelar</button>
                                                          
                                                            <a href="/Adm/FormularioAgendamento.aspx?Operacao=excluir&id=<%#Eval("agen_id") %>">
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

