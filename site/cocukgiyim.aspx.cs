using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OleDb;

public partial class cocukgiyim : System.Web.UI.Page
{
    Class1 c = new Class1();
    public static string KodOlustur(string Text)
    {
        try
        {
            string strReturn = Text.Trim();
            strReturn = strReturn.Replace("ğ", "g");
            strReturn = strReturn.Replace("Ğ", "G");
            strReturn = strReturn.Replace("ü", "u");
            strReturn = strReturn.Replace("Ü", "U");
            strReturn = strReturn.Replace("ş", "s");
            strReturn = strReturn.Replace("Ş", "S");
            strReturn = strReturn.Replace("ı", "i");
            strReturn = strReturn.Replace("İ", "I");
            strReturn = strReturn.Replace("ö", "o");
            strReturn = strReturn.Replace("Ö", "O");
            strReturn = strReturn.Replace("ç", "c");
            strReturn = strReturn.Replace("Ç", "C");
            strReturn = strReturn.Replace("-", "+");
            strReturn = strReturn.Replace(" ", "+");
            strReturn = strReturn.Trim();
            strReturn = new System.Text.RegularExpressions.Regex("[^a-zA-Z0-9+]").Replace(strReturn, "");
            strReturn = strReturn.Trim();
            strReturn = strReturn.Replace("+", "-");
            return strReturn;
        }
        catch (Exception ex)
        {
            throw ex;
        }

    }
    protected void Page_Load(object sender, EventArgs e)
    {
        DataTable dt = c.GetDataTable("select * from giyim where cesit='Çocuk Giyim'");
        sayfalama1.DataSource = dt.DefaultView;
        sayfalama1.BindToControl = DataList1;
        DataList1.DataSource = sayfalama1.DataSourcePaged;
        DataList1.DataBind();
    }
}