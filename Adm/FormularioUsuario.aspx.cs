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

public partial class Adm_FormularioUsuario : Page
{
    string foto;
    // BancoPgSQL bd;
    protected string ImageFotoImagem5;

    string operacao;
    int id = 0;
    protected string idProdutoCode;

    protected override void OnLoad(EventArgs e)
    {
        base.OnLoad(e);
        //bd = new BancoPgSQL(ConfigurationManager.AppSettings["StringConexao"], "mixind");

        if (Request.QueryString["Operacao"] != null)
            operacao = Request.QueryString["Operacao"].ToLower();

        if (Request.QueryString["id"] != null)
            id = Convert.ToInt32(Request.QueryString["id"]);

        if (operacao.Equals("editar"))
        {
            if (!IsPostBack)
                PopularCampos();
        }
        else if (operacao.Equals("novo"))
        {
            if (!IsPostBack)
            {
               
            }
        }
        else if (operacao.Equals("excluir"))
        {
            if (_AdmLogado)
             {
            if (Excluir())
                Response.Redirect("/Adm/ListUsuario.aspx");
             }
            else
            Response.Redirect("/AcessoSeguro.aspx");
        }
        else
            Response.Redirect("/Adm/FormularioUsuario.aspx?Operacao=novo");
    }


    protected void btnSalvar_Click(object sender, EventArgs e)
    {
        if (operacao.Equals("novo"))
        {
            if (Cadastrar())
                Response.Redirect("/Adm/ListUsuario.aspx");
        }
        else if (operacao.Equals("editar"))
        {
                Editar();
                //Response.Redirect("/Adm/ListUsuario.aspx");
        }
        else
            Response.Redirect("/Adm/FormularioUsuario.aspx?Operacao=novo");
    }

    protected void PopularCampos()
    {
        string SQL = @"SELECT * FROM usuario WHERE usua_id=" + id;

        DataTable Tabela = _Pg.ObterTabela(SQL);

        if (Tabela.Rows.Count == 1)
        {
            TxtNomeUsuario.Text = Tabela.Rows[0]["usua_nome"].ToString();
            TextBoxEmail.Text = Tabela.Rows[0]["usua_email"].ToString();
            TxtSenhaUsuario.Text = Tabela.Rows[0]["usua_senha"].ToString();
            TextBoxConfirmarSenha.Text = Tabela.Rows[0]["usua_senha"].ToString();            
            TextBoxTelefone.Text = Tabela.Rows[0]["usua_telefone"].ToString();          
            DropDownListTipo.SelectedValue = Tabela.Rows[0]["usua_tipo"].ToString();

            Tabela.Dispose();
            Tabela = null;
        }
        else
            Response.Redirect("/Adm/FormularioUsuario.aspx?Operacao=novo");
    }

    protected void Editar()
    {
        string Nome = TxtNomeUsuario.Text.Trim();        
        string Senha = TxtSenhaUsuario.Text.Trim();
        string email = TextBoxEmail.Text.Trim();
        string telefone = TextBoxTelefone.Text.Trim();       
        string tipo = DropDownListTipo.SelectedValue; 

        try
        {
            string SQL = @"UPDATE usuario SET usua_nome='" + Nome + "', usua_senha='" + Senha + "', usua_email='" + email + "', usua_telefone='" + telefone + "', usua_tipo='" + tipo + "' WHERE usua_id=" + id;
            
            _Pg.ExecutarSQL(SQL);
            Response.Redirect("/Adm/ListUsuario.aspx");
            //return true;
        }
        catch(Exception e)
        {
            Response.Write("O erro esta aqui: "+ e.ToString());
            //return false;
        }

    }

    protected bool Cadastrar()
    {
        string Nome = TxtNomeUsuario.Text.Trim();
        string email = TextBoxEmail.Text;
        string senha = TxtSenhaUsuario.Text.Trim();   
        string telefone = TextBoxTelefone.Text;
        
        string tipo = DropDownListTipo.SelectedValue;

        string SQL = @"INSERT INTO usuario (usua_nome, usua_email, usua_senha, usua_telefone, usua_tipo) 
VALUES ('" + Nome + "', '" + email + "', '" + senha + "', '" + telefone + "', '" + tipo + "')";

        try
        {
            _Pg.ExecutarSQL(SQL);
            return true;
        }
        catch (Exception ex)
        {
            Response.Write(ex.ToString());
            return false;
        }

    }

    protected bool Excluir()
    {
        string SQL = @"UPDATE usuario SET excluido=TRUE, data_alteracao=NOW() WHERE usua_id=" + id;
        try
        {
            _Pg.ExecutarSQL(SQL);
            return true;
        }
        catch
        {
            return false;
        }
    }

    protected int ObterUltimoID()
    {
        string SQL = @"SELECT currval('usuario_usua_id_seq'::text)";
        DataTable Tabela = _Pg.ObterTabela(SQL);
        int LastID = 0;

        if (Tabela.Rows.Count == 1)
        {
            LastID = Convert.ToInt32(Tabela.Rows[0][0]);
        }

        Tabela.Dispose();
        Tabela = null;

        return LastID;
    }


}