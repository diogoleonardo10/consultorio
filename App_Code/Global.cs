using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using System.Data;
using System.Net;
using System.Drawing;

public static class Global
{
    public static string Schema { get; set; } 

    #region Fazer Login
    public static List<string> FazerLogin(string Email, string Senha, ref Postgre _Pg)
    {
        List<string> Retorno = new List<string>();

        string SQL = @"
SELECT usua_id, (CASE WHEN usua_tipo IS NULL THEN 'USUARIO' ELSE usua_tipo END) AS tipo, usua_nome FROM usuario WHERE usua_email='" + Email + "' AND usua_senha='" + Senha + @"' 
AND excluido=FALSE";

        //fazer login
        DataTable Tabela = _Pg.ObterTabela(SQL);
       
        string TipoUsuario = String.Empty;
        string NomeUsuario = String.Empty;
        string URLLoginInvalido = String.Empty;

        if (Tabela.Rows.Count >= 1)
        {
          
            TipoUsuario = JJZ.Dados.DataUtil.ParaBase64(JJZ.Dados.DataUtil.ParaBase64(Tabela.Rows[0]["tipo"].ToString()));
            NomeUsuario = Tabela.Rows[0]["clie_nomefantasia"].ToString();
        }
        else
            URLLoginInvalido = "/AcessoSeguro.aspx?M=" + JJZ.Dados.DataUtil.ParaBase64("LoginInvalido");
                
        Retorno.Add(TipoUsuario); //1
        Retorno.Add(NomeUsuario); //2
        Retorno.Add(Email); //3
        Retorno.Add(URLLoginInvalido); //4

        return Retorno;
    }
    #endregion

  
}