using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using System.Data;

public class MasterPageAuth : System.Web.UI.MasterPage
{
    public static Postgre _Pg;
    public static int _IdUsuario;
    public static string _Schema;

    protected override void OnLoad(EventArgs e)
    {
        base.OnLoad(e);

        try
        {
            _Schema = Session["consultorio_schema"].ToString();

            _Pg = new Postgre(_Schema);
            _IdUsuario = Convert.ToInt32(Session["autenticacaoid"].ToString());
        }
        catch
        {
            Response.Redirect("/AcessoSeguro/Login.aspx");
            Response.End();
        }

        if (_IdUsuario == 0)
        {
            Response.Redirect("/AcessoSeguro/Login.aspx");
            Response.End();
        }
    }

    protected string ObterSchema()
    {
        return _Schema;
    }
}