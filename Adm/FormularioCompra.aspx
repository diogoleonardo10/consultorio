<%@ Page Title="" Language="C#" MasterPageFile="~/Adm/MasterPage.master" AutoEventWireup="true" CodeFile="FormularioCompra.aspx.cs" Inherits="Adm_FormularioCompra" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>Requisição de Compra     
            &nbsp;<i class="fas fa-shopping-cart"></i>
        </h1>
        <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-home"></i>Home</a></li>
            <li><a href="ListServico.aspx">Requisição de Compra</a></li>
            <li class="active">Requisição de Compra</li>
        </ol>
    </section>

    <!-- Main content -->
    <section class="content">

        <div class="row">
            <!-- left column -->
            <div class="col-md-12">
                <div class="box box-primary">
                    <div class="box-header with-border">
                        <h3 class="box-title">Requisição de Compra - Nº
                <asp:Label ID="LabelNumOS" runat="server"></asp:Label></h3>
                    </div>


                    <div class="box-body">

                        <div class="col-md-5">
                            <div class="form-group">
                                <div class="form-group">
                                    <i class="fas fa-user-cog"></i>&nbsp;<label>Solicitante&nbsp;</label>
                                    <asp:DropDownList ID="DropDownListSolicitante" runat="server" class="form-control"></asp:DropDownList>
                                </div>

                            </div>
                        </div>

                        <div class="col-md-5">
                            <div class="form-group">
                                <i class="fas fa-user-tie"></i>&nbsp;<label>Responsavél&nbsp;&nbsp;</label>
                                <asp:DropDownList ID="DropDownListAtendente" runat="server" class="form-control"></asp:DropDownList>
                            </div>
                        </div>


                        <!-- equipamento Grid Display Starts -->
                        <div class="col-md-6">
                            <div class="form-group">
                                <a data-toggle="modal" data-target="#modal-equipamento" class="btn btn-primary" title="CLIQUE PARA ADICIONAR UM EQUIPAMENTO">
                                    <i class="glyphicon glyphicon-plus-sign"></i>&nbsp;ADICIONAR EQUIPAMENTO&nbsp;<i class="fas fa-wrench"></i></a>
                            </div>
                            <div class="box">
                                <div id="equipamento" class="box-header with-border">
                                    <h3 class="box-title"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Equipamentos relacionados</font></font></h3>
                                </div>
                                <div class="box-body">
                                    <table class="table table-bordered">
                                        <asp:Repeater runat="server" ID="RepeaterEquipamentosAdd">
                                            <HeaderTemplate>
                                                <thead>
                                                    <tr>
                                                        <td class="text-center">Equipamento
                                                        </td>
                                                        <td class="text-center">Qtde
                                                        </td>

                                                        <td class="text-center">Opções
                                                        </td>
                                                    </tr>
                                                </thead>

                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <tr>

                                                    <td class="text-center">
                                                        <%#Eval("equi_descricao") %>
                                                    </td>
                                                    <td class="text-center">
                                                        <div class="input-group btn-block">
                                                            <input type="number" name="quantity" style="width: 65px" value="<%#Eval("eqit_qtde") %>" eqit_id="<%#Eval("equi_id") %>" size="1" class="form-control txt_eqit_qtde" />
                                                        </div>
                                                    </td>

                                                    <td class="text-center">
                                                        <button type="submit" title="Atualizar" class="btn btn-default tool-tip btnRefresh">
                                                            Atualizar <i class="fa fa-refresh"></i>
                                                        </button>
                                                        <button type="button" title="Remover" class="btn btn-default tool-tip btnRemoverEquipamento" eqit_id="<%#Eval("eqit_id") %>">
                                                            Excluir <i class="fas fa-trash-alt"></i>
                                                        </button>
                                                    </td>
                                                </tr>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                    </table>
                                </div>
                            </div>
                        </div>

                        <!-- equipamento Grid Display Ends -->

                        <div class="col-md-6">
                            <div class="form-group">
                                <a data-toggle="modal" data-target="#modal-material" class="btn btn-success" title="CLIQUE PARA ADICIONAR UM MATERIAL">
                                    <i class="glyphicon glyphicon-plus-sign"></i>&nbsp;ADICIONAR MATERIAIS&nbsp;<i class="fas fa-cubes"></i></a>
                            </div>
                            <div class="box">
                                <div id="material" class="box-header with-border">
                                    <h3 class="box-title"><font style="vertical-align: inherit;">Materiais relacionados</font></h3>
                                </div>
                                <div class="box-body">
                                    <table class="table table-bordered">
                                        <asp:Repeater runat="server" ID="RepeaterListMaterialAdd">
                                            <HeaderTemplate>
                                                <thead>
                                                    <tr>
                                                        <td class="text-center">Material
                                                        </td>
                                                        <td class="text-center">Qtde
                                                        </td>
                                                        <td class="text-center">Preço de custo
                                                        </td>
                                                        <td class="text-center">Total
                                                        </td>
                                                        <td class="text-center">Opções
                                                        </td>
                                                    </tr>
                                                </thead>
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <tr>
                                                    <td class="text-center">
                                                        <%#Eval("mate_descricao") %>
                                                    </td>
                                                    <td class="text-center">
                                                        <div class="input-group btn-block">

                                                            <input type="number" style="max-width: 65px" name="quantity" value="<%#Eval("mait_qtde") %>" mait_id="<%#Eval("mate_id") %>" size="1" class="form-control txt_mait_qtde" />
                                                        </div>
                                                    </td>
                                                    <td class="text-center">
                                                        <%#Convert.ToDecimal(Eval("mait_preco")).ToString("C") %>
                                                    </td>
                                                    <td class="text-center">
                                                        <%#Convert.ToDecimal(Eval("valor_total")).ToString("C") %>
                                                    </td>
                                                    <td class="text-center">
                                                        <button type="submit" title="Atualizar" class="btn btn-default tool-tip btnRefresh">
                                                            <i class="fa fa-refresh"></i>
                                                        </button>
                                                        <button type="button" title="Remover" class="btn btn-default tool-tip btnRemover" mait_id="<%#Eval("mait_id") %>">
                                                            <i class="fa fa-times-circle"></i>
                                                        </button>
                                                    </td>
                                                </tr>
                                            </ItemTemplate>
                                            <FooterTemplate>
                                            </FooterTemplate>
                                        </asp:Repeater>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <!--add material #1 Starts -->
                        <div class="modal fade" id="modal-material">
                            <div class="modal-dialog modal-lg">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span></button>
                                        <h4 class="modal-title">ADICIONAR MATERIAL&nbsp; <i class="fas fa-cubes"></i></h4>
                                    </div>
                                    <div class="modal-body">
                                        <table id="ListagemMaterial" class="table table-bordered table-striped">

                                            <asp:Repeater runat="server" ID="ListagemMaterialModal">
                                                <HeaderTemplate>
                                                    <thead>
                                                        <tr class="product-filter breadcrumb">
                                                            <th style="text-align: center;">Material</th>
                                                            <th>Unidade</th>
                                                            <th>Custo</th>

                                                            <th style="text-align: center;">Opções </th>
                                                        </tr>
                                                    </thead>
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <tr>
                                                        <td style="text-align: center;"><%#Eval("mate_descricao") %></td>
                                                        <td><%#Eval("mate_unidade") %> </td>
                                                        <td><%#Eval("mate_custo") %> </td>
                                                        <td style="text-align: center;">

                                                            <a class="btn btn-success" href="#">Adicionar
                                                                <i class="fa fa-plus"></i>
                                                                </button>
                                                            </a>
                                                        </td>
                                                    </tr>
                                                </ItemTemplate>

                                            </asp:Repeater>
                                        </table>

                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar / Fechar <span aria-hidden="true">×</span></button>
                                    </div>
                                </div>
                                <!-- /.modal-content -->
                            </div>
                            <!-- /.modal-dialog -->
                        </div>
                        <!-- /.modal -->

                        <div class="col-md-12">
                            <div class="form-group">
                                <label>Justificativa</label>
                                <asp:TextBox ID="TextBoxObs" TextMode="MultiLine" Height="85px" runat="server" class="form-control" placeholder="Descreva o motivo/necessidade"></asp:TextBox>


                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="form-group">
                               <label>Natureza</label>
                                <asp:DropDownList ID="DropDownListLocal" runat="server" required="required" class="form-control" title="Onde o serviço será realizado">
                                    <asp:ListItem Text="Selecione a natureza"></asp:ListItem>
                                    <asp:ListItem Text="Consultor - 10040" Value="10040"></asp:ListItem>
                                    <asp:ListItem Text="Licença de Software - 10068" Value="10068"></asp:ListItem>
                                    <asp:ListItem Text="Manutenção Computadores - 10050" Value="10050"></asp:ListItem>
                                    <asp:ListItem Text="Telefonia - 10304" Value="10304"></asp:ListItem>
                                   <asp:ListItem Text="Investimento - 00251" Value="00251"></asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="form-group">
                                <label>Centro de custo</label>
                                <asp:DropDownList ID="DropDownListCentroCusto" runat="server" required="required" class="form-control" title="Onde o serviço será realizado">
                                    <asp:ListItem Text="Selecione o centro de custo"></asp:ListItem>
                                    <asp:ListItem Text="Agronegócio - 201" Value="201"></asp:ListItem>
                                    <asp:ListItem Text="Agronegócio Gestão - 20101" Value="20101"></asp:ListItem>
                                    <asp:ListItem Text="Commodities - 202" Value="202"></asp:ListItem>
                                    <asp:ListItem Text="Commodities Gestão - 20201" Value="20201"></asp:ListItem>
                                    
                                    <asp:ListItem Text="Produção - 203" Value="203"></asp:ListItem>
                                    <asp:ListItem Text="Produção Gestão - 20301" Value="20301"></asp:ListItem>
                                    <asp:ListItem Text="Produção Operação - 20302" Value="20302"></asp:ListItem>
                                    <asp:ListItem Text="Produção Ensaque - 20303" Value="20303"></asp:ListItem>
                                    <asp:ListItem Text="Produção Germix - 20304" Value="20304"></asp:ListItem>
                                    <asp:ListItem Text="Produção Secador - 20305" Value="20305"></asp:ListItem>
                                    <asp:ListItem Text="Produção Repasse - 20306" Value="20306"></asp:ListItem>
                                    <asp:ListItem Text="Produção Sistema de limpeza de milho - 20307" Value="20307"></asp:ListItem>
                                    <asp:ListItem Text="Produção Moagem - 20308" Value="20308"></asp:ListItem>
                                    <asp:ListItem Text="Produção Ensaque - BIG BAG - 20309" Value="20309"></asp:ListItem>
                                    <asp:ListItem Text="Produção Plansifter - 20310" Value="20310"></asp:ListItem>
                                    <asp:ListItem Text="Produção Desgerminadora - 20311" Value="20311"></asp:ListItem>
                                    <asp:ListItem Text="Produção Extrusora - 20312" Value="20312"></asp:ListItem>
                                    <asp:ListItem Text="Produção Expurgo - 20313" Value="20313"></asp:ListItem>
                                    <asp:ListItem Text="Produção Armazém - 20314" Value="20314"></asp:ListItem>
                                    <asp:ListItem Text="Produção Custo Fabril - 20315" Value="20315"></asp:ListItem>
                                    
                                    <asp:ListItem Text="Lojas Varejo - 204" Value="204"></asp:ListItem>
                                    <asp:ListItem Text="Loja Milhomix - 20401" Value="20401"></asp:ListItem>
                                    <asp:ListItem Text="Loja Guanabra - 20402" Value="20402"></asp:ListItem>

                                    <asp:ListItem Text="Compras Milho - 501" Value="501"></asp:ListItem>
                                    <asp:ListItem Text="Compras Milho Gestão - 50101" Value="50101"></asp:ListItem>
                                    <asp:ListItem Text="Compras Milho Moega - 50102" Value="50102"></asp:ListItem>
                                    
                                    <asp:ListItem Text="Qualidade - 502" Value="502"></asp:ListItem>
                                    <asp:ListItem Text="Qualidade Gestão - 50201" Value="50201"></asp:ListItem>
                                    <asp:ListItem Text="Qualidade Laboratorio - 50202" Value="50202"></asp:ListItem>
                                    <asp:ListItem Text="Qualidade Inspetor de linha - 50203" Value="50203"></asp:ListItem>
                                    <asp:ListItem Text="Qualidade Carregamento - 50204" Value="50204"></asp:ListItem>
                                    <asp:ListItem Text="Qualidade Empilhadeira - 50205" Value="50205"></asp:ListItem>
                                    <asp:ListItem Text="Qualidade Limpeza e organização - 50206" Value="50206"></asp:ListItem>

                                    <asp:ListItem Text="Manutenção - 503" Value="503"></asp:ListItem>
                                    <asp:ListItem Text="Manutenção Gestão - 50301" Value="50301"></asp:ListItem>
                                    <asp:ListItem Text="Manutenção Operacional - 50302" Value="50302"></asp:ListItem>
                                   
                                    <asp:ListItem Text="PCP - 504" Value="504"></asp:ListItem>
                                    <asp:ListItem Text="PCP Gestão - 50401" Value="50401"></asp:ListItem>
                                    
                                    <asp:ListItem Text="Logística - 505" Value="505"></asp:ListItem>
                                    <asp:ListItem Text="Logística - 50501" Value="50501"></asp:ListItem>

                                    <asp:ListItem Text="Controle de frotas - 506" Value="506"></asp:ListItem>
                                    <asp:ListItem Text="Controle de frotas - 50601" Value="50601"></asp:ListItem>

                                    <asp:ListItem Text="P&P - 507" Value="504"></asp:ListItem>
                                    <asp:ListItem Text="P&P Gestão de Pesquisa e Desenvolvimento - 50701" Value="50701"></asp:ListItem>

                                    <asp:ListItem Text="Administrativo - 101" Value="101"></asp:ListItem>
                                    <asp:ListItem Text="Administrativo Diretoria - 10101" Value="10101"></asp:ListItem>
                                    <asp:ListItem Text="Administrativo Controladoria - 10102" Value="10102"></asp:ListItem>
                                    <asp:ListItem Text="Administrativo Tecnologia da Informação - 10103" Value="10103"></asp:ListItem>
                                    <asp:ListItem Text="Administrativo Compras - 10104" Value="10104"></asp:ListItem>
                                    <asp:ListItem Text="Administrativo Financeiro - 10105" Value="10105"></asp:ListItem>
                                    <asp:ListItem Text="Administrativo Contabilidade - 10106" Value="10106"></asp:ListItem>
                                    <asp:ListItem Text="Administrativo Gestão de Pessoal- 10107" Value="10107"></asp:ListItem>
                                    <asp:ListItem Text="Administrativo Serviços- 10108" Value="10108"></asp:ListItem>
                                    <asp:ListItem Text="Administrativo Engenharia - 10109" Value="10109"></asp:ListItem>
                                    <asp:ListItem Text="Administrativo Marketing - 10110" Value="10110"></asp:ListItem>

                                    <asp:ListItem Text="Comercial - 102" Value="102"></asp:ListItem>
                                    <asp:ListItem Text="Comercial Interno - 10201" Value="10201"></asp:ListItem>
                                    <asp:ListItem Text="Comércio Exterior - 10202" Value="10202"></asp:ListItem>

                                    <asp:ListItem Text="Despesas do Negócio - 103" Value="103"></asp:ListItem>
                                    <asp:ListItem Text="Despesas de Pessoal - 10301" Value="10301"></asp:ListItem>
                                    <asp:ListItem Text="Despesas Financeiras - 10302" Value="10302"></asp:ListItem>
                                    <asp:ListItem Text="Despesas Gerais - 10303" Value="10303"></asp:ListItem>
                                    <asp:ListItem Text="Despesas de Instalação - 10304" Value="10304"></asp:ListItem>
                                </asp:DropDownList>

                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </section>


</asp:Content>

