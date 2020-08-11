using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.OleDb;
using System.Web.UI;
using System.Web.UI.WebControls;
using System;
using System.Collections.Generic;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Text.RegularExpressions;
using System.Text;

/// <summary>
/// Summary description for Class1
/// </summary>
public class Class1
{
	public Class1()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public static int mno;
    public OleDbConnection baglanti()
    {
        OleDbConnection baglan = new OleDbConnection("Provider=Microsoft.ACE.OLEDB.12.0; Data Source=" + HttpContext.Current.Server.MapPath("~/App_Data/database.accdb"));
        baglan.Open();
        return baglan;
    }
    //Baglanti metodu veritabanına bağlanılırken gerekli olan servis sağlayıcı ve veritabanı adını her seferinde yeniden yazma yükümlülüğünden bizi kurtarmıştır.

    public DataSet GetDataSet(string sqlCumle)
    {
        OleDbConnection baglanti = this.baglanti();
        OleDbDataAdapter adapter = new OleDbDataAdapter(sqlCumle, baglanti);
        DataSet ds = new DataSet();
        try
        {
            adapter.Fill(ds);
        }
        catch (OleDbException ex)
        {
            throw new Exception(ex.Message);
        }
        finally { }
        adapter.Dispose();
        baglanti.Close();
        return ds;
    }
    //GetDataSet metoduyla bağlanmış olduğumuz veritabanındaki bilgiler için geçici bir alan oluşturuyoruz ve ilgili dataset nesnesine gönderiyoruz.

    public DataTable GetDataTable(string sqlCumle)
    {
        OleDbConnection baglanti = this.baglanti();
        OleDbDataAdapter adapter = new OleDbDataAdapter(sqlCumle, baglanti);
        DataTable dt = new DataTable();
        try
        {
            adapter.Fill(dt);
        }
        catch (Exception ex)
        {
            throw new Exception(ex.Message);

        }
        finally { }
        adapter.Dispose();
        baglanti.Close();
        return dt;
    }

    //GetDataTable metoduyla string sorgumuz sonucunda elde edilen verilerimizi Table nesnesine aktarıyoruz.

    public int cmd(string sqlCumle)
    {
        OleDbConnection baglanti = this.baglanti();
        OleDbCommand sorgu = new OleDbCommand(sqlCumle, baglanti);
        int sonuc = 0;
        try
        {
            sonuc = sorgu.ExecuteNonQuery();
        }
        catch (Exception ex)
        {
            throw new Exception(ex.Message);
        }
        finally
        {
            sorgu.Connection.Close();
        }
        sorgu.Dispose();
        baglanti.Close();
        return (sonuc);
    }
    //Cmd metoduyla sorgu sonucunda etkilenen satır sayısını belirliyoruz .Bu metod  kullanıcı girişi yapılırken kullanıcı adi ve şifrenin kayıtlı olup olmadığını belirlerken kullanılmıştır.


    public String GetDataCell(string sqlCumle)
    {
        DataTable table = GetDataTable(sqlCumle);
        if (table.Rows.Count == 0)
            return null;
        return table.Rows[0][0].ToString();
    }
    //GetDataCell metoduyla nokta atışı hücre çekme işlemi yapıyoruz.

    public DataRow GetDataRow(string sqlCumle)
    {
        DataTable table = GetDataTable(sqlCumle);
        if (table.Rows.Count == 0) return null;
        return table.Rows[0];

    }

    public string guvenlik(string degistir)
    {
        degistir = Regex.Replace(degistir, ",", "");
        degistir = Regex.Replace(degistir, "/", "");
        degistir = Regex.Replace(degistir, "\n", "");
        degistir = Regex.Replace(degistir, "/?", "");
        degistir = Regex.Replace(degistir, "/*", "");
        degistir = Regex.Replace(degistir, "'", "");
        degistir = Regex.Replace(degistir, "&", "");
        degistir = Regex.Replace(degistir, "<", "");
        degistir = Regex.Replace(degistir, ">", "");
        degistir = Regex.Replace(degistir, "=", "");
        degistir = Regex.Replace(degistir, "%", "[%]");
        degistir = Regex.Replace(degistir, "--", "");
        degistir = Regex.Replace(degistir, ";", "");
        degistir = Regex.Replace(degistir, "AND", "", RegexOptions.IgnoreCase);
        degistir = Regex.Replace(degistir, "OR", "", RegexOptions.IgnoreCase);
        degistir = Regex.Replace(degistir, "LIKE", "", RegexOptions.IgnoreCase);
        degistir = Regex.Replace(degistir, "JOIN", "", RegexOptions.IgnoreCase);
        degistir = Regex.Replace(degistir, "UNION", "", RegexOptions.IgnoreCase);
        degistir = Regex.Replace(degistir, "UPDATE", "", RegexOptions.IgnoreCase);
        degistir = Regex.Replace(degistir, "SELECT", "", RegexOptions.IgnoreCase);
        degistir = Regex.Replace(degistir, "INSERT", "", RegexOptions.IgnoreCase);
        degistir = Regex.Replace(degistir, "İNSERT", "", RegexOptions.IgnoreCase);
        degistir = Regex.Replace(degistir, "CREATE", "", RegexOptions.IgnoreCase);
        degistir = Regex.Replace(degistir, "DELETE", "", RegexOptions.IgnoreCase);
        degistir = Regex.Replace(degistir, "DROP", "", RegexOptions.IgnoreCase);
        degistir = Regex.Replace(degistir, "ALTER", "", RegexOptions.IgnoreCase);
        degistir = Regex.Replace(degistir, "HAVING", "", RegexOptions.IgnoreCase);
        degistir = Regex.Replace(degistir, "GROUP", "", RegexOptions.IgnoreCase);
        degistir = Regex.Replace(degistir, "BY", "", RegexOptions.IgnoreCase);
        degistir = Regex.Replace(degistir, "BETWEEN", "", RegexOptions.IgnoreCase);
        degistir = Regex.Replace(degistir, "IN", "", RegexOptions.IgnoreCase);
        degistir = Regex.Replace(degistir, "INNER", "", RegexOptions.IgnoreCase);
        degistir = Regex.Replace(degistir, "JOİN", "", RegexOptions.IgnoreCase);
        degistir = Regex.Replace(degistir, "SUM", "", RegexOptions.IgnoreCase);
        degistir = Regex.Replace(degistir, "SET", "", RegexOptions.IgnoreCase);
        degistir = Regex.Replace(degistir, "İNNER", "", RegexOptions.IgnoreCase);
        degistir = Regex.Replace(degistir, "İN", "", RegexOptions.IgnoreCase);
        degistir = Regex.Replace(degistir, "HAVİNG", "", RegexOptions.IgnoreCase);
        degistir = Regex.Replace(degistir, "LİKE", "", RegexOptions.IgnoreCase);
        degistir = Regex.Replace(degistir, "UNİON", "", RegexOptions.IgnoreCase);
        return degistir;
    }
    public string guvenlikYorum(string degistir)
    {
        degistir = Regex.Replace(degistir, ",", "");
        degistir = Regex.Replace(degistir, "/", "");
        degistir = Regex.Replace(degistir, "\n", "");
        degistir = Regex.Replace(degistir, "/?", "");
        degistir = Regex.Replace(degistir, "/*", "");
        degistir = Regex.Replace(degistir, "'", "");
        degistir = Regex.Replace(degistir, "&", "");
        degistir = Regex.Replace(degistir, "<", "");
        degistir = Regex.Replace(degistir, ">", "");
        degistir = Regex.Replace(degistir, "=", "");
        degistir = Regex.Replace(degistir, "AND", "an_d", RegexOptions.IgnoreCase);
        degistir = Regex.Replace(degistir, "OR", "o_r", RegexOptions.IgnoreCase);
        degistir = Regex.Replace(degistir, "AS", "a_s", RegexOptions.IgnoreCase);
        degistir = Regex.Replace(degistir, "LIKE", "li_ke", RegexOptions.IgnoreCase);
        degistir = Regex.Replace(degistir, "JOIN", "jo_in", RegexOptions.IgnoreCase);
        degistir = Regex.Replace(degistir, "UNION", "uni_on", RegexOptions.IgnoreCase);
        degistir = Regex.Replace(degistir, "UPDATE", "u_pdate", RegexOptions.IgnoreCase);
        degistir = Regex.Replace(degistir, "SELECT", "se_lect", RegexOptions.IgnoreCase);
        degistir = Regex.Replace(degistir, "INSERT", "i_nsert", RegexOptions.IgnoreCase);
        degistir = Regex.Replace(degistir, "BODY", "bo_dy", RegexOptions.IgnoreCase);
        degistir = Regex.Replace(degistir, "CREATE", "cre_ate", RegexOptions.IgnoreCase);
        degistir = Regex.Replace(degistir, "DELETE", "de_lete", RegexOptions.IgnoreCase);
        degistir = Regex.Replace(degistir, "DROP", "dr_op", RegexOptions.IgnoreCase);
        degistir = Regex.Replace(degistir, "ALTER", "a_lter", RegexOptions.IgnoreCase);
        degistir = Regex.Replace(degistir, "HAVING", "ha_ving", RegexOptions.IgnoreCase);
        degistir = Regex.Replace(degistir, "GROUP", "g_roup", RegexOptions.IgnoreCase);
        degistir = Regex.Replace(degistir, "BY", "b_y", RegexOptions.IgnoreCase);
        degistir = Regex.Replace(degistir, "BETWEEN", "bet_ween", RegexOptions.IgnoreCase);
        degistir = Regex.Replace(degistir, "IN", "i_n", RegexOptions.IgnoreCase);
        degistir = Regex.Replace(degistir, "INNER", "i_nner", RegexOptions.IgnoreCase);
        degistir = Regex.Replace(degistir, "JOIN", "joi_n", RegexOptions.IgnoreCase);
        degistir = Regex.Replace(degistir, "SUM", "s_um", RegexOptions.IgnoreCase);
        degistir = Regex.Replace(degistir, "SET", "s_et", RegexOptions.IgnoreCase);
        degistir = Regex.Replace(degistir, "İNSERT", "i_nsert", RegexOptions.IgnoreCase);
        degistir = Regex.Replace(degistir, "JOİN", "jo_in", RegexOptions.IgnoreCase);
        degistir = Regex.Replace(degistir, "LİKE", "li_ke", RegexOptions.IgnoreCase);
        degistir = Regex.Replace(degistir, "UNİON", "uni_on", RegexOptions.IgnoreCase);
        degistir = Regex.Replace(degistir, "İN", "i_n", RegexOptions.IgnoreCase);
        return degistir;
    }

    

    
}