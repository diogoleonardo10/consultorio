using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Data;
using JJZ.Dados;

public partial class Adm_MasterPage : System.Web.UI.MasterPage
{
    string fotoLogo;
    string fotoIcone;
    protected string ImageFotoLogo;
    protected string postagensTituloMenu;
    DataTable tabelaCompleta;
    protected string dominio;
    protected string corMenuPrincipal;
    protected string CorFonteMenuPrincipal;

    //HttpCookie cookie;

    protected void Page_Load(object sender, EventArgs e)
    {
        //ImageLogomarcaMini.ImageUrl = "http://lojafacilonline.com.br/img_PaginaInicial/projeto-logo3.png";
        //ImageLogomarca.ImageUrl = "http://lojafacilonline.com.br/img_PaginaInicial/projeto-logo3.png";

        LabelUsuarioTop.Text = Session["autenticacao_atendimento_nome_usuario"].ToString();
        LabelUsuario.Text = Session["autenticacao_atendimento_nome_usuario"].ToString();
        LabelNomeUsuario.Text = Session["autenticacao_atendimento_nome_usuario"].ToString();
        LabelEmail.Text = Session["autenticacao_atendimento_login_usuario"].ToString();

    }

    protected void BtnSalvarImagem_Click(object sender, EventArgs e)
    {

    }

    protected void IconButtonSair_Click(object sender, EventArgs e) //sair
    {
        Session.Clear();
        Response.Redirect("/AcessoSeguro/Login.aspx");
    }
}
