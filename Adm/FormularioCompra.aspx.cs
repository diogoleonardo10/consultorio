using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Net;
using System.Configuration;
using JJZ.Dados;
using Npgsql;
using System.IO;
using System.Web.UI.HtmlControls;
using System.Linq;

public partial class Adm_FormularioCompra : Page
{
    protected override void OnLoad(EventArgs e)
    {
        base.OnLoad(e);

        CarregarDados();

    }

    protected void CarregarDados()
    {
        string SqlSolicitante = "SELECT usua_id, usua_nome, usua_funcao, usua_departamento, CONCAT( usua_nome,' - ', usua_funcao,' - ',usua_departamento) AS nome FROM usuario WHERE excluido=false ORDER BY usua_id DESC;";
        DataTable TabelaSolicitante = _Pg.ObterTabela(SqlSolicitante);
        DropDownListSolicitante.DataSource = TabelaSolicitante;
        DropDownListSolicitante.DataValueField = "usua_id";
        DropDownListSolicitante.DataTextField = "nome";
        DropDownListSolicitante.DataBind();
        DropDownListSolicitante.Items.Insert(0, new ListItem("Selecione o solicitante", "0"));
        DropDownListSolicitante.SelectedIndex = 0;
        DropDownListSolicitante.SelectedValue = _IDUsuario.ToString();

        DropDownListAtendente.DataSource = TabelaSolicitante;
        DropDownListAtendente.DataValueField = "usua_id";
        DropDownListAtendente.DataTextField = "nome";
        DropDownListAtendente.DataBind();
        DropDownListAtendente.Items.Insert(0, new ListItem("Selecione o responsavél", "0"));
        DropDownListAtendente.SelectedIndex = 0;
    }


}