using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

public class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string autenticacao = Convert.ToString(Session["autenticacao"]);
        //Response.Write(Session.SessionID);
        if (autenticacao == "")
        {
            Response.Redirect("AcessoSeguro/Login.aspx");
            Response.End();
        }
    }
	
}