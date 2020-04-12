using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Configuration;

public class MasterPageUtil : System.Web.UI.MasterPage
{
    public static int _IDUsuarioLogado = 0;
    public static string _TipoUsuarioLogado = String.Empty;
    public static string _NomeUsuarioLogado = String.Empty;
    public static Postgre _Pg;

    protected override void OnLoad(EventArgs e)
    {
        base.OnLoad(e);
        _Pg = new Postgre("consultorio");

       
    }
}
