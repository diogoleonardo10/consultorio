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

public partial class Adm_FormularioPaciente : Page
{
    // BancoPgSQL bd = new BancoPgSQL(ConfigurationManager.AppSettings["StringConexao"], "consultorio");
    string operacao;
    int id = 0;
    protected string idPaciente;
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

            if (Excluir())
                Response.Redirect("/Adm/ListPaciente.aspx");

            Response.Redirect("/AcessoSeguro.aspx");
        }
        else
            Response.Redirect("/Adm/FormularioPaciente.aspx?Operacao=novo");
    }
    protected void Cadastrar()
    {
        try
        {
            string nome = TextBoxNome.Text.Trim();
            string cpf = TextBoxCPF.Text.Trim();
            string email = TextBoxEmail.Text.Trim();
            string telefone = TextBoxTelefone.Text.Trim();

            string plano = DropDownListPlano.SelectedValue.Trim();
            string planoNome = TextBoxPlanoNome.Text.Trim();
            int planoNumero = 0;
            if (!string.IsNullOrEmpty(TextBoxPlanoNumero.Text))
                planoNumero = Convert.ToInt32(TextBoxPlanoNumero.Text.Trim());


            string SQL = @"INSERT INTO paciente (paci_nome, paci_cpf, paci_email, paci_telefone, paci_convenio, paci_nome_convenio, paci_num_convenio) VALUES 
                ('" + nome + "', '" + cpf + "','" + email + "','" + telefone + "','" + plano + "','" + planoNome + "'," + planoNumero + ")";
            _Pg.ExecutarSQL(SQL);
            Response.Redirect("ListPaciente.aspx");
        }
        catch (Exception ex)
        {
            Response.Write(ex.ToString());
            //string script = "<script type=\"text/javascript\">alert('Excessão: "+ ex.ToString() +"');</script>";
            //Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", script);
        }

    }

    protected void PopularCampos()
    {
        String SQL = @"SELECT * FROM paciente WHERE paci_id=" + id;

        DataTable Tabela = _Pg.ObterTabela(SQL);

        if (Tabela.Rows.Count == 1)
        {
            TextBoxNome.Text = Tabela.Rows[0]["paci_nome"].ToString();
            TextBoxCPF.Text = Tabela.Rows[0]["paci_cpf"].ToString();
            TextBoxEmail.Text = Tabela.Rows[0]["paci_email"].ToString();
            TextBoxTelefone.Text = Tabela.Rows[0]["paci_telefone"].ToString();

            DropDownListPlano.SelectedValue = Tabela.Rows[0]["paci_convenio"].ToString();
            TextBoxPlanoNome.Text = Tabela.Rows[0]["paci_nome_convenio"].ToString();
            TextBoxPlanoNumero.Text = Tabela.Rows[0]["paci_num_convenio"].ToString();

            Tabela.Dispose();
            Tabela = null;
        }
        else
            Response.Redirect("/Adm/FormularioPaciente.aspx?Operacao=novo");
    }

    protected void Editar()
    {
        try
        {
            string nome = TextBoxNome.Text.Trim();
            string cpf = TextBoxCPF.Text.Trim();
            string email = TextBoxEmail.Text.Trim();
            string telefone = TextBoxTelefone.Text.Trim();

            string plano = DropDownListPlano.SelectedValue;
            string planoNome = TextBoxPlanoNome.Text.Trim();
            string planoNumero = TextBoxPlanoNumero.Text.Trim();

            string SQL = @"UPDATE paciente SET paci_nome='" + nome + "', paci_cpf='" + cpf + "', paci_email='" + email + "', paci_telefone='" + telefone + "', paci_convenio='" + plano + "', paci_nome_convenio='" + planoNome + "', paci_num_convenio='" + planoNumero + "', data_alteracao=NOW() WHERE paci_id=" + id;
            _Pg.ExecutarSQL(SQL);
            Response.Redirect("ListPaciente.aspx");
        }
        catch (Exception ex)
        {
            Console.Write(ex.ToString());
            //string script = "<script type=\"text/javascript\">alert('Excessão: "+ ex.ToString() +"');</script>";
            //Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", script);
        }

    }

    protected void btnSalvar_Click(object sender, EventArgs e)
    {
        if (operacao.Equals("novo"))
        {
            Cadastrar();

        }
        else if (operacao.Equals("editar"))
        {
            try
            {
                Editar();
            }
            catch (Exception erro)
            {
                Response.Write("erro esta aqui: " + erro.ToString());
            }
        }
        else
            Response.Redirect("FormularioPaciente.aspx?Operacao=novo");

    }

    protected bool Excluir()
    {
        string SQL = @"UPDATE paciente SET excluido=TRUE, data_alteracao=NOW() WHERE paci_id=" + id;

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