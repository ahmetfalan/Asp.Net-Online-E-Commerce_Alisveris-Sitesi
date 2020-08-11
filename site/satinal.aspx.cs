using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OleDb;
using System.Collections;
using System.Text.RegularExpressions;

public partial class satinal : System.Web.UI.Page
{
    Class1 c = new Class1();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Kullanıcı"] == null)
        {
            Response.Redirect((HttpContext.Current.Handler as Page).ResolveUrl("giyingiydirin.aspx"));
        }
        else
        {
            if (!IsPostBack)
            {
                int gid = Convert.ToInt32(RouteData.Values["gid"]);
                DataSet ds = c.GetDataSet("select * from giyim where gid=" + gid + "");
                DataSet dss = c.GetDataSet("select * from kayit where kuladi='" + Session["Kullanıcı"] + "'");
                DataSet dsss = c.GetDataSet("select * from giyim where gid=" + gid + "");
                DataSet dssss = c.GetDataSet("select * from kayit where kuladi='" + Session["Kullanıcı"] + "'");
                DataList3.DataSource = dssss;
                DataList3.DataBind();
                DataList4.DataSource = dsss;
                DataList4.DataBind();
                DataList2.DataSource = dss;
                DataList2.DataBind();
                DataList1.DataSource = ds;
                DataList1.DataBind();
            }
        }

    }
    protected void devam1_Click(object sender, EventArgs e)
    {
        TabContainer1.ActiveTabIndex = 1;
        kullanici.Visible = true;
        urun.Enabled = false;
    }
    protected void devam2_Click(object sender, EventArgs e)
    {
        TabContainer1.ActiveTabIndex = 2;
        kullanici.Enabled = false;
        urun.Enabled = false;
        hesap.Visible = true;
    }
    protected void devam3_Click(object sender, EventArgs e)
    {
        if (txtKredAd.Text == "" || txtKredSoy.Text == "" || txtKredNumara.Text == "" || txtKredCW.Text == "" || txtKredSon.Text == "")
        {
            lblHata.Text = "Hata !! Boş alan bırakmayınız !";
        }
        else
        {
            OleDbCommand cmd = new OleDbCommand("select count(*) from CC where ad='" + txtKredAd.Text + "' and soyad='" + txtKredSoy.Text + "' and numara='" + txtKredNumara.Text + "' and sonkullanma='" + txtKredSon.Text + "' and cvv='" + txtKredCW.Text + "'", c.baglanti());
            if (cmd.ExecuteScalar().ToString() == "0")
            {
                lblHata.Text = "Hata !! Böyle bir kayıt bulunmamaktadır !";
            }
            else
            {
                TabContainer1.ActiveTabIndex = 3;
                kullanici.Enabled = false;
                urun.Enabled = false;
                hesap.Enabled = false;
                dogrulama.Visible = true;
                lblHata.Text = "";
                lblKartAd.Text = txtKredAd.Text;
                lblKartSoyad.Text = txtKredSoy.Text;
                lblKartSon.Text = txtKredSon.Text;
                lblKartNumara.Text = txtKredNumara.Text;
                lblKartCw.Text = txtKredCW.Text;
            }
        }
    }
    protected void devam4_Click(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            urun.Visible = false; kullanici.Visible = false; hesap.Visible = false; dogrulama.Visible = false;
            bitis.Visible = true;
            MultiView1.ActiveViewIndex = 0;
            int gid = Convert.ToInt32(RouteData.Values["gid"]);
            c.cmd("insert into alinan (kid,gid,cad,csoyad,cnumara,cson,ccv,atarih) values ('" + Session["Kullanıcı"] + "','" + gid + "','" + lblKartAd.Text + "','" + lblKartSoyad.Text + "','" + lblKartNumara.Text + "','" + lblKartSon.Text + "','" + lblKartCw.Text + "','" + DateTime.Now + "')");
        }
    }
}