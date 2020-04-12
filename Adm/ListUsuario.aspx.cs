using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Npgsql;
using System.Configuration;

public partial class Adm_ListUsuario : Page
{
    //BancoPgSQL bd = new BancoPgSQL(ConfigurationManager.AppSettings["StringConexao"], "consultorio");

    protected string quantidade;
    protected override void OnLoad(EventArgs e)
    {
        base.OnLoad(e);

        PopularGrade();
    }

    protected void PopularGrade()
    {
        string SQL = @"SELECT usua_id, usua_nome, usua_email FROM usuario WHERE excluido=FALSE ORDER BY usua_id DESC";
        DataTable Tabela = _Pg.ObterTabela(SQL);
        TotalRegistros.Text = "Total de " + Tabela.Rows.Count.ToString() + " registros";

        RptUsuario.DataSource = Tabela;
        RptUsuario.DataBind();

        Tabela.Dispose();
        Tabela = null;
    }
}