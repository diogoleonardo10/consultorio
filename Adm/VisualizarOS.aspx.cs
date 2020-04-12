using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Adm_VisualizarOS : Page

{
    protected int _IDOS = 0;
    protected string _Tipo = "";

    protected string _Solicitante;
    protected string _UsuaResponsavel;
    protected string _UsuaEmail;
    protected string _ClieTelefone;
    protected string _ClieCPFCNPJ;
    protected string _ClieEstado;
    protected string _ClieCidade;
    protected string _ClieCEP;

    protected decimal _Qtde = 0M;
    protected decimal _Total = 0M;
    protected decimal _Frete = 0.00M;
    protected decimal _TotalFinal = 0M;

    protected string _Marca;
    protected string _Categoria;
    protected string _ProdutoServico;
    protected string _site;
    protected string _telefone;
    protected string _email;

    protected override void OnLoad(EventArgs e)
    {
        base.OnLoad(e);

        if (Request.QueryString["ID"] != null)
            _IDOS = Convert.ToInt32(Request.QueryString["ID"]);

        if (Request.QueryString["Tipo"] != null)
            _Tipo = Request.QueryString["Tipo"];

        #region Configurar Página por Tipo
        DataTable Tabela = _Pg.ObterTabela("SELECT site_dominio FROM site WHERE site_id=1");
        if (Tabela.Rows[0]["site_dominio"].ToString() == "www.ronaldofilho.com.br" || Tabela.Rows[0]["site_dominio"].ToString() == "ronaldofilho.com.br")
        {
            Response.Redirect("/Adm/AssistenciaView.aspx?ID=" + _IDOS);
            Response.End();
        }

        Tabela.Dispose();
        Tabela = null;
        #endregion

        PopularVisualizacao();
        CarregarDadosEmpresa();
        CarregarDadosSite();
    }

    protected void CarregarDadosSite()
    {
        string sqlSite = "SELECT site_dominio, site_mostrar_precos,site_titulo_produto_servico, site_calcular_frete, site_titulo_marca, site_titulo_categoria FROM site WHERE site_id=1";
        DataTable resultadoSite = _Pg.ObterTabela(sqlSite);

        _site = resultadoSite.Rows[0]["site_dominio"].ToString();
        string XLabelMarca = resultadoSite.Rows[0]["site_titulo_marca"].ToString();
        if (XLabelMarca.EndsWith("S") || XLabelMarca.EndsWith("s"))
        {
            _Marca = XLabelMarca.Remove(XLabelMarca.Length - 1);
        }
        else
        {
            _Marca = resultadoSite.Rows[0]["site_titulo_marca"].ToString();
        }

        string XLabelCategoria = resultadoSite.Rows[0]["site_titulo_categoria"].ToString();
        if (XLabelCategoria.EndsWith("S") || XLabelCategoria.EndsWith("s"))
        {
            _Categoria = XLabelCategoria.Remove(XLabelCategoria.Length - 1);
        }
        else
        {
            _Categoria = resultadoSite.Rows[0]["site_titulo_categoria"].ToString();
        }
        string XLabelProdutoServico = resultadoSite.Rows[0]["site_titulo_produto_servico"].ToString();
        if (XLabelProdutoServico.EndsWith("S") || XLabelProdutoServico.EndsWith("s"))
        {
            _ProdutoServico = XLabelProdutoServico.Remove(XLabelProdutoServico.Length - 1);
        }
        else
        {
            _ProdutoServico = resultadoSite.Rows[0]["site_titulo_produto_servico"].ToString();
        }

        Boolean permitido = true;

        string permissaoCalcularFrete = resultadoSite.Rows[0]["site_calcular_frete"].ToString();
        if (permissaoCalcularFrete != permitido.ToString())
        {
            this.divfrete.Attributes.CssStyle.Add("display", "none");
            LiteralFrete.Visible = false;
        }

    }

    protected void CarregarDadosEmpresa()
    {
        string Caminho = Global.CaminhoImagemLogomarcaPadrao();
        try
        {
            string SqlLogomarca = "SELECT empr_logo, empr_nomefantasia, empr_cnpj FROM empresa WHERE empr_id = 1";
            DataTable Tabela = _Pg.ObterTabela(SqlLogomarca);

            foreach (DataRow linha in Tabela.Rows)
            {
                string NomeArquivo = System.IO.Path.GetFileName(linha["empr_logo"].ToString());
                if (NomeArquivo == "")
                {
                    linha["empr_logo"] = "/imagens/icones/add_logomarca.jpg";
                }
                else
                {
                    linha["empr_logo"] = Caminho + NomeArquivo;
                }

            }

            string logomarca = Tabela.Rows[0]["empr_logo"].ToString();

            ImageLogomarca.ImageUrl = "https://milhao.net/site/wp-content/themes/on_milhao/img/logo.svg";//logomarca;
            LiteralCNPJ.Text = Tabela.Rows[0]["empr_cnpj"].ToString();
            LiteralNomeEmpresa.Text = Tabela.Rows[0]["empr_nomefantasia"].ToString();

        }
        catch (Exception erro)
        {
            string script = "<script type=\"text/javascript\">alert('Algo de errado aconteceu ao pegar imagens e logomarcas, por favor tente novamente: " + erro.ToString() + "');</script>";
            Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", script);
            //Response.Write(erro.ToString());
        }
    }

    protected void PopularVisualizacao()
    {
        string SQLDadosPedido = @"SELECT pedi_id, pedi_frete, clie_nomefantasia, clie_razaosocial, clie_contato, clie_email, clie_telefone, clie_cpfcnpj,
clie_estado, clie_cidade, clie_cep
FROM pedido 
LEFT JOIN cliente ON (pedi_clie_id=clie_id)
WHERE pedi_id=" + _IDOS;

        DataRow DRDadosPedido = _Pg.ObterTabela(SQLDadosPedido).Rows[0];

        _Solicitante = DRDadosPedido["usua_nome"].ToString();
        _UsuaResponsavel = DRDadosPedido["clie_contato"].ToString();
        _UsuaEmail = DRDadosPedido["usua_email"].ToString();
       

        string SQLDadosItens = @"SELECT peit_id, peit_pedi_id, prod_codigo, prod_nome, prod_foto, prod_observacao, prod_marca, peit_qtde, peit_valor_unitario, 
(peit_valor_unitario * peit_qtde) AS peit_valor_total, peit_obs, (peit_qtde * peit_valor_unitario) AS valor_total
FROM pedido_item 
LEFT JOIN produto ON (peit_prod_id=prod_id)
WHERE peit_pedi_id=" + _IDOS;

        DataTable TabelaItens = _Pg.ObterTabela(SQLDadosItens);

        decimal Qtde = 0M;
        decimal Total = 0M;
        decimal TotalFinal = 0M;

        string Caminho = Global.CaminhoImagemProdutoPadrao();

        foreach (DataRow linha in TabelaItens.Rows)
        {
            string NomeArquivo = System.IO.Path.GetFileName(linha["prod_foto"].ToString());

            if (NomeArquivo == "")
            {
                linha["prod_foto"] = "/imgagens/icones/sem-imagem.png";
            }
            else
            {
                linha["prod_foto"] = Caminho + NomeArquivo;
            }

            Qtde += Convert.ToDecimal(linha["peit_qtde"]);
            Total += Convert.ToDecimal(linha["valor_total"]);

        }

        TotalFinal = Total + _Frete;

        LiteralQtde.Text = Qtde.ToString();
        LiteralFrete.Text = _Frete.ToString("C");
        LiteralTotal.Text = Total.ToString("C");
        LiteralTotalFinal.Text = TotalFinal.ToString("C");

        RptItens.DataSource = TabelaItens;
        RptItens.DataBind();

        DRDadosPedido = null;
        TabelaItens.Dispose();
        TabelaItens = null;


    }

}