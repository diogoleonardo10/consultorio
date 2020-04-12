using System;
using System.Collections.Generic;
using System.Linq;
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

public partial class Adm_FormularioClinica : Page
{
    string operacao;
    int id = 0;
    protected override void OnLoad(EventArgs e)
    {
        base.OnLoad(e);

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

        }
        else if (operacao.Equals("excluir"))
        {
            //if (_AdmLogado)
            // {
            if (Excluir())
                Response.Redirect("/Adm/ListClinica.aspx");
            //   }
            //  else
            Response.Redirect("/AcessoSeguro.aspx");
        }
        else
            Response.Redirect("/Adm/FormularioClinica.aspx?Operacao=novo");

    }

    protected void btnSalvar_ServerClick(object sender, EventArgs e)
    {

        if (operacao.Equals("novo"))
        {
            Cadastrar();
        }
        else if (operacao.Equals("editar"))
        {
            if (Editar())
                Response.Redirect("/Adm/ListClinica.aspx");
        }
        else
            Response.Redirect("/Adm/FormularioClinica.aspx?Operacao=novo");

    }

    protected void Cadastrar()
    {
        try
        {
            string nome = TextBoxNomeClinica.Text.Trim();
            string cnpj = TextBoxCNPJ.Text.Trim();
            string telefone = TextBoxTelefone.Text.Trim();
            string endereco = TextBoxEndereco.Text.Trim();

            String SQL = @"INSERT INTO clinica (clin_nome, clin_cnpj, clin_telefone, clin_endereco) VALUES 
                ('" + nome + "','" + cnpj + "','" + telefone + "','" + endereco + "')";
            _Pg.ExecutarSQL(SQL);

            Response.Redirect("ListClinica.aspx");
            //return true;
        }
        catch (Exception ex)
        {
            Console.Write("Erro :" + ex.ToString());
            //return false;
            //string script = "<script type=\"text/javascript\">alert('Excessão: "+ ex.ToString() +"');</script>";
            //Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", script);
        }
    }

    protected void PopularCampos()
    {
        String SQL = @"SELECT clin_id, clin_nome, clin_cnpj, clin_telefone, clin_endereco FROM clinica WHERE clin_id=" + id;

        DataTable Tabela = _Pg.ObterTabela(SQL);

        if (Tabela.Rows.Count == 1)
        {
            TextBoxNomeClinica.Text = Tabela.Rows[0]["clin_nome"].ToString();
            TextBoxCNPJ.Text = Tabela.Rows[0]["clin_cnpj"].ToString();
            TextBoxTelefone.Text = Tabela.Rows[0]["clin_telefone"].ToString();
            TextBoxEndereco.Text = Tabela.Rows[0]["clin_endereco"].ToString();

            Tabela.Dispose();
            Tabela = null;
        }
        else
            Response.Redirect("/Adm/FormularioClinica.aspx?Operacao=novo");
    }

    protected bool Editar()
    {
        string nome = TextBoxNomeClinica.Text.Trim();
        string cnpj = TextBoxCNPJ.Text.Trim();
        string telefone = TextBoxTelefone.Text.Trim();
        string endereco = TextBoxEndereco.Text.Trim();

        try
        {          
            string SQL = @"UPDATE Clinica SET clin_nome='" + nome + "', clin_cnpj='" + cnpj + "', clin_telefone='" + telefone + "', clin_endereco='" + endereco + "', data_alteracao=NOW() WHERE clin_id=" + id;
                       
            _Pg.ExecutarSQL(SQL);            
            return true;
        }
        catch(Exception erro)
        {
            string script = "<script type=\"text/javascript\">alert('Algo de errado aconteceu, por favor tente novamente: " + erro.ToString() + "');</script>";
            Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", script);

            Response.Write("Detalhes:" + erro.ToString());

            Console.Write("Algo de errado: " + erro.ToString());
            return false;
        }

    }

    protected bool Excluir()
    {
        String SQL = @"UPDATE clinica SET excluido=TRUE, data_alteracao=NOW() WHERE clin_id=" + id;

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
}