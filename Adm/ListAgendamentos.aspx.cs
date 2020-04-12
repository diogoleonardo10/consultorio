using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
public partial class Adm_ListAgendamentos : Page
{    
    protected string quantidade;
    protected override void OnLoad(EventArgs e)
    {
        base.OnLoad(e);

        CarregarDados();
    }

    protected void CarregarDados()
    {
        string SQL = "SELECT *, usua_nome, usua_tipo, clin_nome FROM agendamento LEFT JOIN usuario ON (usua_id=agen_paciente) LEFT JOIN clinica ON (clin_id=agen_clinica) WHERE agendamento.excluido=false ORDER BY agen_id DESC";
        DataTable Tabela = _Pg.ObterTabela(SQL);
        quantidade = Tabela.Rows.Count.ToString();
        RepeaterOS.DataSource = Tabela;
        RepeaterOS.DataBind();
        TotalRegistros.Text = "Total de " + quantidade + " registros";

        /*try
        {
            string Sql = @"SELECT os_id, usua_nome, os.data_criacao, os_tipo,
SUM(mait_qtde * mait_preco) AS preco_total
FROM os
LEFT JOIN usuario ON (usua_id=os_solicitante)
LEFT JOIN os_item_material ON (mait_os_id=os_id)
LEFT JOIN material ON (mate_id=mait_mate_id)
WHERE os.excluido=FALSE AND os_item_material.excluido=FALSE
GROUP BY os_id, usua_nome, os.data_criacao, os_tipo ORDER BY os.data_criacao DESC";

            DataTable Tabela = _Pg.ObterTabela(Sql);
            quantidade = Tabela.Rows.Count.ToString();
            RepeaterOS.DataSource = Tabela;
            RepeaterOS.DataBind();
        }catch(Exception ex)
        {
            Response.Write(ex.ToString());
        }*/
    }
}