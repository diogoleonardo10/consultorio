using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Configuration;

public class Page : System.Web.UI.Page
{

    public string _Schema = Global.Schema;
   
    public bool _AdmLogado = false;
    HttpCookie _cookie = new HttpCookie("schema");

    public static Postgre _Pg;

    public static int _IDUsuario = 0;

    protected override void OnLoad(EventArgs e)
    {
        base.OnLoad(e);

        try
        {
            _Pg = new Postgre("consultorio");
            //Postgre Pg = new Postgre(ConfigurationManager.AppSettings["Schema"]);

            //Postgre Banco = new Postgre("consultorio");
            //_Pg = new BancoPgSQL(ConfigurationManager.AppSettings["StringConexao"],ConfigurationManager.AppSettings["Schema"]);
            //_IDUsuario = Convert.ToInt32(Session["IDUsuario"].ToString());
            _AdmLogado = _IDUsuario == 0 ? false : true;
            _IDUsuario = Convert.ToInt32(Session["autenticacao_atendimento_id_usuario"].ToString());
        }
        catch
        {
            Response.Redirect("/AcessoSeguro/Login.aspx");
            Response.End();
        }


        if (_IDUsuario == 0)
        {
            Response.Redirect("/AcessoSeguro/Login.aspx");
            Response.End();
        }
    }

    public void Refresh()
    {
        string URL = Request.Url.AbsolutePath;
        Response.Redirect(URL);
    }
}