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

using System.Globalization;

public partial class Adm_FormularioAgendamento : Page
{
    string operacao;
    protected int id = 0;
    bool editando = false;

    protected override void OnLoad(EventArgs e)
    {
        base.OnLoad(e);

        if (Request.QueryString["id"] != null)
            id = Convert.ToInt32(Request.QueryString["id"]);
        if (Request.QueryString["Operacao"] != null)
            operacao = Request.QueryString["Operacao"];

        if (operacao == "editar")
        {
            editando = true;
            if (!IsPostBack)
                CarregarDadosParaAlterar();
        }
        else if (operacao.Equals("novo"))
        {
            if (!Page.IsPostBack)
                CarregarDados();
        }
        else if (operacao.Equals("excluir"))
        {           
            if (_AdmLogado)
            {

                Excluir();             
                Response.Redirect("/Adm/ListAgendamentos.aspx");
            }
            else
                Response.Redirect("/AcessoSeguro.aspx");
        }
        else
            Response.Redirect("/Adm/FormularioPaciente.aspx?Operacao=novo");
    }


    protected void DropDownListCliente_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void CarregarDados()
    {
        TextBoxData.Text = DateTime.Now.ToString("dd/MM/yyyy");
        //O paciente pode agendar atendimento em apenas uma clínica por dia
        string SqlCondicaoPaciente = "SELECT paci_id, paci_nome FROM agendamento join paciente on agendamento.agen_paciente = paciente.paci_id where agendamento.agen_data = " + TextBoxData.Text + " AND  ";

        string SqlDadosAgendamento = @"SELECT * FROM agendamento BETWEEN CURDATE() '" + TextBoxData.Text + "' ";
        DataTable TabelaAgendamento = _Pg.ObterTabela(SqlDadosAgendamento);
        /*
        int maxAgenTemp = Convert.ToInt32(TabelaAgendamento.Rows[0]["max_id"]);
        if (maxAgenTemp > 0 || string.IsNullOrEmpty(maxAgenTemp.ToString()) ){
            id = 1 + Convert.ToInt32(TabelaAgendamento.Rows[0]["max_id"]);
            LabelNumOS.Text = id.ToString();
            TextBoxNumOS.Text = id.ToString();
        }*/

        //if (!String.IsNullOrEmpty(TabelaPedido.ToString()))
        string SqlSolicitante = "SELECT paci_id, paci_nome FROM paciente WHERE excluido=false ORDER BY paci_id DESC;";
        DataTable TabelaSolicitante = _Pg.ObterTabela(SqlSolicitante);
        DropDownListSolicitante.DataSource = TabelaSolicitante;
        DropDownListSolicitante.DataValueField = "paci_id";
        DropDownListSolicitante.DataTextField = "paci_nome";
        DropDownListSolicitante.DataBind();
        DropDownListSolicitante.Items.Insert(0, new ListItem("Selecione o paciente", "0"));
        DropDownListSolicitante.SelectedIndex = 0;


        string SqlAtendente = "SELECT usua_id, usua_nome FROM usuario WHERE excluido=false ORDER BY usua_id DESC;";
        DataTable TabelaAtendente = _Pg.ObterTabela(SqlAtendente);
        DropDownListAtendente.DataSource = TabelaAtendente;
        DropDownListAtendente.DataValueField = "usua_id";
        DropDownListAtendente.DataTextField = "usua_nome";
        DropDownListAtendente.DataBind();
        DropDownListAtendente.Items.Insert(0, new ListItem("Atendente responsavél", "0"));
        DropDownListAtendente.SelectedIndex = 0;
        DropDownListAtendente.SelectedValue = _IDUsuario.ToString();


        string SqlClinica = "SELECT clin_id, clin_nome FROM clinica WHERE excluido=false ORDER BY clin_id DESC;";
        DataTable TabelaClinica = _Pg.ObterTabela(SqlClinica);
        DropDownListClinica.DataSource = TabelaClinica;
        DropDownListClinica.DataValueField = "clin_id";
        DropDownListClinica.DataTextField = "clin_nome";
        DropDownListClinica.DataBind();
        DropDownListClinica.Items.Insert(0, new ListItem("Clinicas disponiveis", "0"));
        DropDownListClinica.SelectedIndex = 0;

    }


    protected void CarregarDadosParaAlterar()
    {
        string id = Request.QueryString["id"].ToString();
        DataTable Dt = BuscarPorId(id);

        string SqlPaciente = "SELECT paci_id, paci_nome FROM paciente WHERE excluido=false ORDER BY paci_id DESC;";
        DataTable TabelaPaciente = _Pg.ObterTabela(SqlPaciente);

        DataTable DtPaciente = BuscarPacientePorId(id);

        DropDownListSolicitante.DataSource = TabelaPaciente;
        DropDownListSolicitante.DataValueField = "paci_id";
        DropDownListSolicitante.DataTextField = "paci_nome";
        DropDownListSolicitante.DataBind();
        DropDownListSolicitante.SelectedValue = DtPaciente.Rows[0]["paci_id"].ToString();

        DataTable DtUsuario = BuscarUsuarioPorId(id);

        string SqlAtendente = "SELECT usua_id, usua_nome FROM usuario WHERE excluido=false ORDER BY usua_id DESC;";
        DataTable TabelaAtendente = _Pg.ObterTabela(SqlAtendente);
        DropDownListAtendente.DataSource = TabelaAtendente;
        DropDownListAtendente.DataValueField = "usua_id";
        DropDownListAtendente.DataTextField = "usua_nome";
        DropDownListAtendente.DataBind();
        DropDownListAtendente.SelectedValue = DtUsuario.Rows[0]["usua_id"].ToString();

        DataTable DtClinica = BuscarClinicaPorId(id);

        string SqlClinica = "SELECT clin_id, clin_nome FROM clinica WHERE excluido=false ORDER BY clin_id DESC;";
        DataTable TabelaClinica = _Pg.ObterTabela(SqlClinica);
        DropDownListClinica.DataSource = TabelaClinica;
        DropDownListClinica.DataValueField = "clin_id";
        DropDownListClinica.DataTextField = "clin_nome";
        DropDownListClinica.DataBind();
        DropDownListAtendente.SelectedValue = DtClinica.Rows[0]["clin_id"].ToString();


        DropDownListStatus.SelectedValue = Dt.Rows[0]["agen_status"].ToString();

        DropDownListClinica.SelectedValue = Dt.Rows[0]["agen_clinica"].ToString();

        TextBoxData.Text = Dt.Rows[0]["agen_data"].ToString();
        TextBoxHora.Text = Dt.Rows[0]["agen_hora"].ToString();

    }
    public DataTable BuscarPorId(string id) //nesta busca simples buscamos por codigo ou nome e retornamos a tabela completa com todos os dados do produto
    {
        string SqlBusca = "SELECT * FROM agendamento WHERE agen_id= " + id + ";";
        DataTable tabelaCompleta = _Pg.ObterTabela(SqlBusca);
        return tabelaCompleta;
    }

    public DataTable BuscarUsuarioPorId(string id)
    {

        string SqlBusca = "SELECT usua_id, usua_nome FROM agendamento join usuario on agendamento.agen_usuario = usuario.usua_id where agendamento.agen_id = " + id + "";

        DataTable tabelaCompleta = _Pg.ObterTabela(SqlBusca);
        return tabelaCompleta;

    }

    public DataTable BuscarPacientePorId(string id)
    {
        string SqlBusca = "SELECT paci_id, paci_nome FROM agendamento join paciente on agendamento.agen_paciente = paciente.paci_id where agendamento.agen_id = " + id + "";

        DataTable tabelaCompleta = _Pg.ObterTabela(SqlBusca);
        return tabelaCompleta;

    }

    public DataTable BuscarClinicaPorId(string id)
    {
        string SqlBusca = "SELECT clin_id, clin_nome FROM agendamento join clinica on agendamento.agen_usuario = clinica.clin_id where agendamento.agen_id = " + id + "";

        DataTable tabelaCompleta = _Pg.ObterTabela(SqlBusca);
        return tabelaCompleta;

    }


    protected void BtnFinalizar_Click(object sender, EventArgs e)
    {
        if (Request.QueryString["Operacao"].ToString() == "editar")
        {
            try
            {
                Editando();
            }
            catch (Exception erro)
            {
                Response.Write("<script language='javascript'>alert('Erro esta aqui:" + erro.Message + "'); </script>");
                Console.Write("Erro esta aqui:" + erro.Message);
            }

        }
        else
        {
            try
            {
                Cadastrar();
            }
            catch (Exception ex)
            {
                Response.Write("<script language='javascript'>alert('" + ex.Message + "'); </script>");
                //Response.Redirect(ex.Message);
                // Email.EnviarEmail("diogo@suasvendas.com", "Falha ao inserir o produto", ex.ToString());
            }
        }

    }


    protected void Cadastrar()
    {
        bool PodeCadadstrar = true;
        int paciente = Convert.ToInt32(DropDownListSolicitante.SelectedValue);
        int usuario = Convert.ToInt32(DropDownListAtendente.SelectedValue);
        string status = DropDownListStatus.SelectedValue; //Convert.ToInt32(DropDownListResponsavel.SelectedValue);

        int clinica = Convert.ToInt32(DropDownListClinica.SelectedValue);
        string data = TextBoxData.Text;
        if (data.Equals(""))
            data = DateTime.Now.ToString("dd/MM/yyyy");

        DateTime horatemp = Convert.ToDateTime(TextBoxHora.Text);
        string hora = horatemp.ToString("hh:mm");
        if (string.IsNullOrEmpty(hora))
            data = DateTime.Now.ToString("hh:mm");

        string sqlCondicaoPaciente = "SELECT agen_id FROM agendamento WHERE agen_paciente=" + paciente + " AND agen_data='" + data + "' AND agen_status='Aguardando atendimento'";
        DataTable TabCondicaoPaciente = _Pg.ObterTabela(sqlCondicaoPaciente);
        if (TabCondicaoPaciente.Rows.Count > 0)
        {
            Response.Write("Motivo:Já existe agendamento deste paciente para esta data");
            PodeCadadstrar = false;
        }


        string sqlCondicaoClinica = "SELECT agen_id FROM agendamento WHERE agen_clinica=" + clinica + " AND agen_data='" + data + "' AND excluido=false";
        DataTable TabCondicaoClinica = _Pg.ObterTabela(sqlCondicaoClinica);
        if (TabCondicaoClinica.Rows.Count > 1)
        {
            Response.Write("Motivo: Existem mais de 20 agendamentos para esta data.");
            PodeCadadstrar = false;
        }


        try
        {
            if (PodeCadadstrar)
            {

                string sql = @"INSERT INTO agendamento (agen_paciente, agen_usuario, agen_clinica, agen_status, criado_por, alterado_por, agen_data, agen_hora) VALUES 
            (" + paciente + ", " + usuario + ", " + clinica + ",'" + status + "','" + _IDUsuario + "', '" + _IDUsuario + "', '" + data + "', '" + hora + "')";
                              
                _Pg.ExecutarSQL(sql);

                Response.Redirect("ListAgendamentos.aspx");
            }
        }
        catch (Exception erro)
        {
            Response.Write("O erro esta: " + erro.ToString());

        }

    }

    protected void Editando()
    {
        string id = Request.QueryString["id"].ToString();
        try
        {
            //string num = TextBoxNumOS.Text.Trim();
            int clinica = Convert.ToInt32(DropDownListClinica.SelectedValue);
            string status = DropDownListStatus.SelectedValue;

            int paciente = Convert.ToInt32(DropDownListSolicitante.SelectedValue);
            int usuario = Convert.ToInt32(DropDownListAtendente.SelectedValue);
            //string dataCadastro = DateTime.Now.ToString("yyyy/MM/dd");
            string data = TextBoxData.Text;
            if (data.Equals(""))
                data = DateTime.Now.ToString("dd/MM/yyyy");

            DateTime horatemp = Convert.ToDateTime(TextBoxHora.Text);
            string hora = horatemp.ToString("hh:MM");
            if (string.IsNullOrEmpty(hora))
                data = DateTime.Now.ToString("hh:MM");
            try
            {
                Alterar(Convert.ToInt32(id), paciente, usuario, clinica, status, data, hora);
                //Response.Redirect("ListOS.aspx");
            }
            catch (Exception erro)
            {
                Response.Write("<script language='javascript'>alert('" + erro.Message + "'); </script>");
                //Console.Write("Erro:" + erro.Message);
            }

        }
        catch (Exception erro)
        {
            Response.Write("<script language='javascript'>alert('" + erro.Message + "'); </script>");
            Console.Write("Erro:" + erro.Message);

        }
    }

    public void Alterar(int id, int paciente, int usuario, int clinica, string status, string data, string hora)
    {

        try
        {
            string SqlAlterar = @"UPDATE agendamento SET agen_usuario= " + usuario + ", agen_paciente= " + paciente + ", agen_status= '" + status + "', agen_clinica= '" + clinica + "', agen_data= '" + data + "', agen_hora= '" + hora + "' WHERE agen_id = " + id + ";";

            _Pg.ExecutarSQL(SqlAlterar);
            Response.Redirect("ListAgendamentos.aspx");
        }
        catch (Exception erro)
        {
            Response.Write("<script language='javascript'>alert('" + erro.Message + "'); </script>");

        }
    }

    protected bool Excluir()
    {
        try
        {
            String SQL = @"UPDATE agendamento SET excluido=TRUE, data_alteracao=NOW() WHERE agen_id=" + id;
                   
            _Pg.ExecutarSQL(SQL);
            return true;
        }
        catch (Exception erro)
        {
            Response.Write("Erro: " + erro.Message + erro.ToString());
            return false;
        }
    }

}
