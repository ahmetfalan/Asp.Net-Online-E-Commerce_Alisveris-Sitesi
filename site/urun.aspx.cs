using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OleDb;

public partial class urun : System.Web.UI.Page
{
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
    Class1 c = new Class1();
    void temizle() {
        txtYorum.Text = "";
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            int gid = Convert.ToInt32(RouteData.Values["gid"]);
            DataSet ds = c.GetDataSet("select * from giyim where gid=" + gid + "");
            DataList1.DataSource = ds;
            DataList1.DataBind();
            Repeater1.DataSource = ds;
            Repeater1.DataBind();
            vericek();
        }
        if (Session["Kullanıcı"] == null)
        {
            Repeater1.Visible = false;
            hypSatinal.Visible = true;
        }
        else
        {
            hypSatinal.Visible = false;
            Repeater1.Visible = true;
        }
    }
    void vericek()
    {
        if (!IsPostBack)
        {
            int gid = Convert.ToInt32(RouteData.Values["gid"]);
            DataSet dss = c.GetDataSet("select * from yorum where gid=" + gid + " and onay='Evet'");
            DataList2.DataSource = dss;
            DataList2.DataBind();
        }
    }
    protected void btnYorum_Click(object sender, EventArgs e)
    {
        if (Session["Kullanıcı"] == null)
        {
            lblYHata.Text = "Giriş yapmadan yorum yazılamaz !";
        }
        else
        {
            if (txtYorum.Text == "" && txtYorum.Text == " ")
            {
                lblYHata.Text = "Yorum kısmı boş geçilemez !";
            }
            else
            {
                lblYHata.Text = "";
                int gid = Convert.ToInt32(RouteData.Values["gid"]);
                c.cmd("insert into yorum (gid,kuladi,yorum,onay,tarih) values (" + gid + ",'" + Session["Kullanıcı"] + "','" + txtYorum.Text + "','Hayır','" + DateTime.Now + "')");
                vericek();
                lblYHata.Text = "Yorumunuz gönderildi onaylanmasını bekleyiniz.";
                txtYorum.Text = "";
            }
        }
    }
}