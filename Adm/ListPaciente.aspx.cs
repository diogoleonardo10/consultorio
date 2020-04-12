using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using JJZ.Dados;
using System.Data;
using System.Configuration;
using System.Web.UI.HtmlControls;

public partial class Adm_ListPaciente : Page
{

    protected override void OnLoad(EventArgs e)
    {
        base.OnLoad(e);

        CarregarDados();
    }

    protected void CarregarDados()
    {

        //BancoPgSQL Banco = new BancoPgSQL(ConfigurationManager.AppSettings["StringConexao"], "public");
        string SQL = @"SELECT paci_id, paci_nome, paci_email, paci_telefone, paci_cpf FROM paciente WHERE excluido=false";
        try
        {
            DataTable Tabela = _Pg.ObterTabela(SQL);

            Repeater.DataSource = Tabela;
            Repeater.DataBind();

        }
        catch (Exception erro)
        {
            Response.Write("Erro :" + erro.ToString());
            string script = "<script type=\"text/javascript\">alert('Algo de errado aconteceu, por favor tente novamente: " + erro.ToString() + "');</script>";
            Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", script);
        }
    }

}