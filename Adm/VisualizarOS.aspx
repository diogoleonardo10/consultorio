<%@ Page Language="C#" AutoEventWireup="true" CodeFile="VisualizarOS.aspx.cs" Inherits="Adm_VisualizarOS" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>

      <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.0/css/all.css" integrity="sha384-lKuwvrZot6UHsBSfcMvOkWwlCMgc0TaWr+30HWe3a4ltaBwTZhyTEggF5tJv8tbt" crossorigin="anonymous" />

    <link href="../css/bootstrap.min.css" rel="stylesheet" />
    <!-- Google Web Fonts -->

    <link href="https://fonts.googleapis.com/css?family=Roboto+Condensed:300italic,400italic,700italic,400,300,700" rel="stylesheet" type="text/css" />
    <link href="https://fonts.googleapis.com/css?family=Oswald:400,700,300" rel="stylesheet" type="text/css" />
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800" rel="stylesheet" type="text/css" />


    <!-- CSS Files -->
    <link href="../css/font-awesome.min.css" rel="stylesheet" />
    <link href="../css/owl.carousel.css" rel="stylesheet" />
    <link href="../css/responsive.css" rel="stylesheet" />

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <!-- js pdf -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/0.9.0rc1/jspdf.min.js"></script>

    <style type="text/css">
        @media print {
            #BtnPrint {
                display: none;
            }

            .btn-default {
                display: none;
            }

            #opcoes {
                display: none;
            }
        }
    </style>

</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div id="opcoes" style="padding-top: 5px;">

                <button type="button" title="Voltar" class="btn btn-default">
                    <a href="ListPedidos.aspx"><i class="glyphicon glyphicon-backward">&nbsp;Voltar</i></a>
                </button>

                <div class="btn btn-default" id="BtnPrint" onclick="javascript:print();"><i class="fa fa-fw fa-print"></i>&nbsp;Imprimir</div>

                <%--  <button class="btn btn-default" id="btGerarPDF">gerar PDF</button>
                        
                    <a class="btn btn-default" href="/Adm/PedidoView.aspx?ID=132.pdf" target="_blank" download>PDF</a>--%>
            </div>
            <div class="row">

                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" style="border: 1px solid #e8e8e8;">

                    <div id="conteudo">
                        <div class="col-md-12" style="padding-right: 0px; padding-left: 0px;">
                            <div style="padding: 8px">
                                <asp:Image ID="ImageLogomarca" class="logo-normal" Style="max-height: 105px" runat="server" alt="" />
                                <br />
                                <%=_site %>
                                <br />
                                <strong>Nome Fantasia: </strong>
                                <asp:Literal runat="server" ID="LiteralNomeEmpresa"></asp:Literal>
                                <strong>CNPJ: </strong>
                                <asp:Literal runat="server" ID="LiteralCNPJ"></asp:Literal>
                                <h4><span id="H4TituloPagina" runat="server">Pedido</span> Nº <%=__IDOS %></h4>
                            </div>
                            <div class="panel panel-smart" style="border: 1px solid #e8e8e8; padding: 8px;">
                                <table>
                                    <tr>
                                        <th>Cliente: </th>
                                        <td><%=_ClieNomeFantasia %></td>
                                    </tr>
                                    <tr>
                                        <th>CNPJ: </th>
                                        <td><%=_ClieCPFCNPJ %></td>
                                    </tr>
                                    <!-- <tr>
                                <td>Responsável/solicitante: </td>
                                <td><%=_ClieResponsavel%></td>
                            </tr> -->
                                    <tr>
                                        <th>E-mail: </th>
                                        <td><%=_ClieEmail %></td>
                                    </tr>
                                    <tr>
                                        <th>Telefone: </th>
                                        <td><%=_ClieTelefone %></td>
                                    </tr>

                                    <tr>
                                        <th>Estado: </th>
                                        <td><%=_ClieEstado %></td>
                                    </tr>
                                    <tr>
                                        <th>Cidade: </th>
                                        <td><%=_ClieCidade %></td>
                                    </tr>
                                    <tr>
                                        <th>CEP: </th>
                                        <td><%=_ClieCEP %></td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                        <asp:Repeater runat="server" ID="RptItens">
                            <HeaderTemplate>
                                <table class="table table-bordered table-striped">
                                    <tr class="product-filter breadcrumb">
                                        <th>Código</th>
                                        <th><%=_ProdutoServico %></th>
                                        <th><%=_Marca %></th>
                                        <th>Qtde</th>
                                        <th>Valor Unitário</th>
                                        <th>Valor Total</th>
                                    </tr>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <tr>
                                    <td><%#Eval("prod_codigo") %></td>
                                    <td><%#Eval("prod_nome") %><br />
                                        <sub style="color: #be1515;"><%#Eval("peit_obs") %></sub></td>
                                    <td><%#Eval("prod_marca") %></td>
                                    <td><%#Eval("peit_qtde") %></td>
                                    <td><%#Convert.ToDecimal(Eval("peit_valor_unitario")).ToString("C2") %></td>
                                    <td><%#Convert.ToDecimal(Eval("peit_valor_total")).ToString("C2") %></td>

                                </tr>
                            </ItemTemplate>
                            <FooterTemplate>
                                </tbody>
                   
                            </table>
                            </FooterTemplate>
                        </asp:Repeater>
                        <div class="col-sm-6" style="float: right; width: 50%; padding: 0px">

                            <div class="panel panel-smart" style="border: 1px solid #e8e8e8;">

                                <div class="panel-body">
                                    <dl class="dl-horizontal">
                                        <dt>Qtde <%--<%=_TituloProdServ %> --%> :</dt>
                                        <dd>
                                            <asp:Literal runat="server" ID="LiteralQtde"></asp:Literal></dd>
                                        <dt>Subtotal :</dt>
                                        <dd>
                                            <asp:Literal runat="server" ID="LiteralTotal"></asp:Literal></dd>
                                        <div id="divfrete" runat="server">
                                            <dt>Frete :</dt>
                                            <dd>
                                                <asp:Literal runat="server" ID="LiteralFrete"></asp:Literal></dd>
                                        </div>
                                    </dl>
                                    <hr />
                                    <dl class="dl-horizontal total">
                                        <dt>Total :</dt>
                                        <dd>
                                            <asp:Literal runat="server" ID="LiteralTotalFinal"></asp:Literal></dd>
                                    </dl>
                                    <hr />
                                    <div class="text-uppercase clearfix">
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>

                </div>
            </div>
        </div>
        <br />
        <div id="editor"></div>

        <%-- <script>

            var doc = new jsPDF();
            var specialElementHandlers = {
                '#editor': function (element, renderer) {
                    return true;
                }
            };

            $('#btGerarPDF').click(function () {
                doc.fromHTML($('#conteudo').html(), 10, 10, {
                    'width': 595,
                    'elementHandlers': specialElementHandlers
                });
                doc.save('Pedido_Nº_<%=__IDOS %>');
            });

        </script> --%>

        <script>
            jQuery(document).ready(function ($) {
                $('a[href$=".pdf"]')
                    .attr('download', '')
                    .attr('target', '_blank');
            });
        </script>
    </form>
</body>
</html>
