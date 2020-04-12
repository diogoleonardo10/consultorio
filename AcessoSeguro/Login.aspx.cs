using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using JJZ.Dados;


public partial class AcessoSeguro_Login : System.Web.UI.Page
{
    BancoPgSQL bd = new BancoPgSQL(ConfigurationManager.AppSettings["StringConexao"], ConfigurationManager.AppSettings["Schema"]);

    protected void Page_Load(object sender, EventArgs e)
    {
        txtEmail.Focus();       
    }

    protected void btnEntrar_Click(object sender, EventArgs e)
    {
        string email = txtEmail.Text;
        string senha = txtSenha.Text;
        bool Logado = false;

        try
        {
            bd.SQL = @"SELECT usua_id, usua_nome, usua_email, usua_senha FROM usuario 
                        WHERE usua_email=@usua_email AND usua_senha=@usua_senha";

            bd.AddParametros("@usua_email", email);
            bd.AddParametros("@usua_senha", senha);

            DataTable DTAtendente = bd.ObterDataTable();

            if (DTAtendente.Rows.Count == 1)
            {
                Session["autenticacao_atendimento_id_usuario"] = DTAtendente.Rows[0]["usua_id"].ToString();
                Session["autenticacao_atendimento_nome_usuario"] = DTAtendente.Rows[0]["usua_nome"].ToString();
                Session["autenticacao_atendimento_login_usuario"] = DTAtendente.Rows[0]["usua_email"].ToString();

                Logado = true;
            }
            else
            {
                NaoDeu.Text = "<font color='#FF0000'>E-mail e/ou Senha inválida.</font>";
                NaoDeu.Visible = true;

            }
        }
        catch (Exception ex)
        {
            NaoDeu.Text = ex.ToString();//"<font color='#FF0000'>E-mail não cadadstrado.</font>";
            NaoDeu.Visible = true;
        }

        if (Logado)
            Response.Redirect("/Adm/ListPaciente.aspx");
    }

}