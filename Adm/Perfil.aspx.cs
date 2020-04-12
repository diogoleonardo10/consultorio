using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using JJZ.Dados;
using System.Data;
using Npgsql;
using System.Configuration;
using System.Web.UI.HtmlControls;
using System.Web.Services;
using System.Web.Script.Serialization;
using System.Net.Mail;
using System.Net;
public partial class Adm_Perfil : Page
{
    string operacao;
    public string schemaPerfil;
    BancoPgSQL bd;
    BancoPgSQL bd2;
    BancoPgSQL bdPublic = new BancoPgSQL(ConfigurationManager.AppSettings["StringConexao"], "public");

    protected string email;

    protected override void OnLoad(EventArgs e)
    {
        base.OnLoad(e);
      
        if (Request.QueryString["Operacao"] != null)
            operacao = Request.QueryString["Operacao"].ToString();
        else
            operacao = "novo";

        if (operacao == "editar" && !IsPostBack)
        {
            try
            {
                CarregarDadosAtendimento();
                CarregarDadosEmpresa();
                CarregarDadosSite();
            }
            catch (Exception erro)
            {
                Response.Write(erro.ToString());
                string script = "<script type=\"text/javascript\">alert('Algo de errado aconteceu, por favor tente novamente: " + erro.ToString() + "');</script>";
                Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", script);
            }
        }
    }
        

    protected void CarregarDadosAtendimento()
    {
        schemaPerfil = Request.QueryString["schema"];
              

        bdPublic.SQL = @"SELECT aten_id, data_alteracao, aten_assunto, aten_status, 
                    (CASE WHEN msg.qtde_nao_lida IS NULL THEN 0 ELSE msg.qtde_nao_lida END) AS qtde_nao_lida
                    FROM public.atendimento
                    LEFT JOIN public.lead ON (lead_id=aten_conta_id)
                    LEFT JOIN 
	                    (SELECT COUNT(atit_id) AS qtde_nao_lida, atit_atendimento_id AS id_atendimento 
	                    FROM public.atendimento_item WHERE atit_visto=FALSE AND atit_atendente_id IS NULL
                        AND atit_atendente_id IS NOT NULL GROUP BY atit_atendimento_id) AS msg ON (aten_id=msg.id_atendimento)
                    WHERE aten_status='" + "Aberto" + "' ORDER BY atendimento.data_alteracao DESC";

        /*@"SELECT contato_site.*, 
                    (CASE WHEN an.anex_id IS NULL THEN 'none' ELSE 'block' END) AS mostrar_botao_anexo
                    FROM contato_site
                    LEFT JOIN (SELECT anex_id_contato, anex_id FROM anexo WHERE excluido=FALSE) AS an 
                        ON (contsite_id=an.anex_id_contato)
                    WHERE contato_site.excluido=FALSE
                    ORDER BY contsite_id DESC";*/

        /*@"SELECT lead_id, lead_nome, lead_email, lead_cidade, lead_uf,
                      lead_telefone, lead_cnpj, lead_fantasia, lead_razao_social, lead_schema,
                      lead_dominio, lead_origem, lead_mkt_ativo
                    FROM 
                      lead WHERE lead_schema='"+schemaPerfil+"'; ";*/
        try
        {
            DataTable Tabela = bdPublic.ObterDataTable();
                        
            RepeaterAtendimento.DataSource = Tabela;
            RepeaterAtendimento.DataBind();
        }
        catch (Exception erro)
        {
            Response.Write(erro.ToString());
            string script = "<script type=\"text/javascript\">alert('Algo de errado aconteceu, por favor tente novamente: " + erro.ToString() + "');</script>";
            Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", script);
        }
    }
   
    protected void CarregarDadosEmpresa()
    {     
        if (Request.QueryString["schema"] != null)
        {
            schemaPerfil = Request.QueryString["schema"];
            bd = new BancoPgSQL(ConfigurationManager.AppSettings["StringConexao"], schemaPerfil);
            // bd = new BancoPgSQL(ConfigurationManager.AppSettings["StringConexao"], schemaPerfil);
           
            bd.SQL = @"SELECT * FROM empresa WHERE empr_id= 1;";           

            DataTable TabelaDados = bd.ObterDataTable();

            string Caminho = Global.CaminhoImagemLogomarcaPadrao();

            foreach (DataRow linha in TabelaDados.Rows)
            {
                string NomeArquivo = linha["empr_logo"].ToString();
                if (string.IsNullOrEmpty(NomeArquivo))
                {
                    linha["empr_logo"] = "/imagens/icones/add_logomarca.jpg";
                }
                else
                {
                    linha["empr_logo"] = Caminho + NomeArquivo;
                }

            }
            string logomarca = TabelaDados.Rows[0]["empr_logo"].ToString();
            ImageLogomarca.ImageUrl = logomarca;


            string NomeEmpresa = TabelaDados.Rows[0]["empr_nomefantasia"].ToString();
            LiteralTituloPagina.Text = NomeEmpresa;
            ImageLogomarca.ToolTip = NomeEmpresa;

            string telefone = TabelaDados.Rows[0]["empr_telefone"].ToString() + " " + TabelaDados.Rows[0]["empr_celular"].ToString();
            string rua = TabelaDados.Rows[0]["empr_rua"].ToString();
            string numeroEnd = TabelaDados.Rows[0]["empr_endenumero"].ToString();
            string setor = TabelaDados.Rows[0]["empr_setor"].ToString();
            string cidade = TabelaDados.Rows[0]["empr_cidade"].ToString();
            string estado = TabelaDados.Rows[0]["empr_estado"].ToString();
            string cep = TabelaDados.Rows[0]["empr_cep"].ToString();
            string email = TabelaDados.Rows[0]["empr_email"].ToString();
            if (rua != "" || rua == null)
            {
                LiteralRua.Text = "logradouro: " + rua;
            }
            else
            {
                LiteralRua.Visible = false;
            }

            if (numeroEnd != "")
            {
                LiteralEndNumero.Text = " n° " + numeroEnd;
            }
            else
            {
                LiteralEndNumero.Visible = false;
            }
            if (setor != "")
            {
                LiteralSetor.Text = "Setor: " + setor;
            }
            else
            {
                LiteralSetor.Visible = false;
            }
            if (cep != "")
            {
                LiteralCEP.Text = "CEP: " + cep;
            }
            else
            {
                LiteralCEP.Visible = false;
            }

            if (cidade != "")
            {
                LiteralCidade.Text = "Cidade: " + cidade;
            }
            else
            {
                LiteralCidade.Visible = false;
            }
            if (estado != "")
            {
                LiteralEstado.Text = " - " + estado;
            }
            else
            {
                LiteralCidade.Visible = false;
            }

        }

    }

    protected void CarregarDadosSite()
    {
        if (Request.QueryString["schema"] != null)
        {
            try
            {
                schemaPerfil = Request.QueryString["schema"];
                bd2 = new BancoPgSQL(ConfigurationManager.AppSettings["StringConexao"], schemaPerfil);
                // bd = new BancoPgSQL(ConfigurationManager.AppSettings["StringConexao"], schemaPerfil);

                bd2.SQL = @"SELECT * FROM site WHERE site_id= 1;";

                DataTable tabelaCompleta = bd2.ObterDataTable();

               // LiteralSobre.Text = tabelaCompleta.Rows[0]["site_sobre"].ToString();
                LiteralPlano.Text = tabelaCompleta.Rows[0]["site_tipo"].ToString();                
                LiteralEmailSite.Text = tabelaCompleta.Rows[0]["site_email"].ToString();
                email = tabelaCompleta.Rows[0]["site_email"].ToString();
                string linkWhats = tabelaCompleta.Rows[0]["site_whatsapp"].ToString();               
                //LinkWhatsApp.ToolTip = Convert.ToInt64(linkWhats).ToString("(##) #####-####");
                LinkWhatsApp.NavigateUrl = "https://api.whatsapp.com/send?phone=55" + linkWhats + "&text=sua%20mensagem";
                LiteralWhatsApp.Text = linkWhats;

                string linkfacebook = tabelaCompleta.Rows[0]["site_facebook"].ToString();
                if (linkfacebook != "")
                {
                    //LinkFacebook.NavigateUrl = linkfacebook;
                    LinkFacebookHeader.NavigateUrl = linkfacebook;
                    LinkFacebookHeader.ToolTip = "Clique para acessar nossa página do facebook";

                }
                else
                {
                    LiFacebookHeader.Visible = false;
                    //LinkFacebook.Visible = false;
                    //IconFacebook.Visible = false;
                    //liFace.Visible = false;
                }

                string linkInstagramCode = tabelaCompleta.Rows[0]["site_instagram"].ToString();
                if (linkInstagramCode != "")
                {
                    //LinkInstragam.NavigateUrl = linkInstagramCode;
                    LinkInstagramHeader.NavigateUrl = linkInstagramCode;
                    LinkInstagramHeader.ToolTip = "Clique para acessar nossa página do Instagram";
                }
                else
                {
                    LinkInstagramHeader.Visible = false;
                   /* LinkInstragam.Visible = false;
                    IconInstragam.Visible = false;
                    liInstagram.Visible = false;*/
                }

                string linkTwitterCode = tabelaCompleta.Rows[0]["site_twitter"].ToString();
                if (linkTwitterCode != "")
                {
                    //LinkTwitter.NavigateUrl = linkTwitterCode;
                    LinkTwitterHeader.NavigateUrl = linkTwitterCode;
                }
                else
                {
                    LiTwitterHeader.Visible = false;
                   /* LinkTwitter.Visible = false;
                    IconTwitter.Visible = false;
                    liTwitter.Visible = false;*/
                }

                string linkYouTubeCode = tabelaCompleta.Rows[0]["site_youtube"].ToString();
                if (linkYouTubeCode != "")
                {
                    //LinkYouTube.NavigateUrl = linkYouTubeCode;
                    LinkYoutubeHeader.NavigateUrl = linkYouTubeCode;
                }
                else
                {
                    LiYoutubeHeader.Visible = false;
                    /*LinkYouTube.Visible = false;
                    IconYouTube.Visible = false;
                    liYoutube.Visible = false;*/
                }

                string linkLinkedinCode = tabelaCompleta.Rows[0]["site_linkedin"].ToString();
                if (linkLinkedinCode != "")
                {
                    //LinkLinkedin.NavigateUrl = linkLinkedinCode;
                    LinkLinkedinHeader.NavigateUrl = linkLinkedinCode;
                }
                else
                {
                    LiLinkedinHeader.Visible = false;
                    /*LinkLinkedin.Visible = false;
                    IconLinkedin.Visible = false;
                    liLinkedin.Visible = false;*/
                }
            }
            catch (Exception erro)
            {
                Response.Write(erro.ToString());
                string script = "<script type=\"text/javascript\">alert('Algo de errado aconteceu, por favor tente novamente: " + erro.ToString() + "');</script>";
                Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", script);
            }
        }
    }

}