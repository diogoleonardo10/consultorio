using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using JJZ.Dados;
using System.Data;
using System.Configuration;
using Npgsql;

public class Postgre
{    
    public BancoPgSQL _Banco;
    //public string nomeBanco;
    //string stringdeconexao = "Server=localhost;Port=5433;User Id=postgres;Password=diogo300689;Database=milhao";
    //NpgsqlConnection conexao;

    public Postgre(string Schema)
    {
       
        _Banco = new BancoPgSQL(ConfigurationManager.AppSettings["StringConexao"], "consultorio");

    }

    public void ExecutarSQL(string Sql)
    {
        _Banco.SQL = Sql;
        _Banco.ExecutarSql();
    }

    public DataTable ObterTabela(string Sql)
    {
        _Banco.SQL = Sql;
        return _Banco.ObterDataTable();
    }

    #region Exluir/Editar com Auditoria
    public bool ExcluirRegistro(string Tabela, int IDRegistro, int IDUsuario)
    {
        return ExcluirRegistro(Tabela, IDRegistro, IDUsuario, null);
    }

    public bool ExcluirRegistro(string Tabela, int IDRegistro, int IDUsuario, string CampoChavePrimaria)
    {
        if (CampoChavePrimaria == null)
            CampoChavePrimaria = Tabela.Substring(0, 2).ToLower() + "_id";

        string SQLExcluir = "UPDATE " + Tabela + " SET excluido=TRUE, data_alteracao=NOW(), alterado_por=" +
            IDUsuario + " WHERE " + CampoChavePrimaria + "=" + IDRegistro;

        try
        {
            _Banco.SQL = SQLExcluir;
            _Banco.ExecutarSql();

            return true;
        }
        catch
        {
            return false;
        }
    }

    public bool EditarRegistro(string SQL, int IDUsuario)
    {
        string SQLEditar = SQL.Substring(0, SQL.ToUpper().IndexOf("WHERE"));
        SQLEditar += ", data_alteracao=NOW(), alterado_por=" + IDUsuario + " ";
        SQLEditar += SQL.Substring(SQL.ToUpper().IndexOf("WHERE"));

        try
        {
            _Banco.SQL = SQLEditar;
            _Banco.ExecutarSql();

            return true;
        }
        catch
        {
            return false;
        }
    }
    #endregion

    public DataTable ObterUsuarioPeloLogin(string email) //e-mail de acesso 
    {
        _Banco.SQL = @"SELECT * FROM usuario WHERE usua_email=@usua_email";
        _Banco.AddParametros("@usua_email", email);

        return _Banco.ObterDataTable();
    }

    public DataTable ObterUsuarioPeloNome(string email) //e-mail de acesso 
    {
        _Banco.SQL = @"SELECT usua_nome FROM usuario WHERE usua_email=@usua_email";
        _Banco.AddParametros("@usua_email", email);

        return _Banco.ObterDataTable();
    }
}