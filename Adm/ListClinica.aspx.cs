using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Npgsql;
using System.Configuration;

public partial class Adm_ListClinica : Page
{    
    protected string quantidade;
    protected override void OnLoad(EventArgs e)
    {
        base.OnLoad(e);

        PopularGrade();
    }
    protected void PopularGrade()
    {
        String SQL = @"SELECT * FROM clinica WHERE excluido=FALSE ORDER BY clin_id DESC";
        DataTable Tabela = _Pg.ObterTabela(SQL);
        TotalRegistros.Text = "Total de " + Tabela.Rows.Count.ToString() + " registros";

        Repeater.DataSource = Tabela;
        Repeater.DataBind();

        Tabela.Dispose();
        Tabela = null;
    }
}