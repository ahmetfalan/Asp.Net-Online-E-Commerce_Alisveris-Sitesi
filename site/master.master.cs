using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data;
using System.Data.OleDb;
using System.Text.RegularExpressions;


public partial class master : System.Web.UI.MasterPage
{
    Class1 c = new Class1();
    void temizle()
    {
        txtAd.Text = "";
        txtAdres.Text = "";
        txtCinsiyet.Text = "";
        txtKuladi.Text = "";
        txtMail.Text = "";
        txtSifre.Text = "";
        txtSoyad.Text = "";
        txtTelNo.Text = "";
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        DataSet ds = c.GetDataSet("select * from reklam");
        DataList1.DataSource = ds;
        DataList1.DataBind();
        //maskededit de silme işleminin çalışması için gerekli kod
        if (Page.ClientScript.IsStartupScriptRegistered(this.GetType(), "MaskedEditFix") == false)
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "MaskedEditFix", string.Format("<script type='text/javascript' src='{0}'></script>", Page.ResolveUrl("~/js/MaskedEditFix.js")));
        }

        txtKullaniciAdi.Focus();
        if (Session["Kullanıcı"] == null && Session["Admin"] == null)
        {
            btnYonetim.Visible = false;
            HyperLink1.Visible = true;
            HyperLink2.Visible = true;
            btnAyarlar.Visible = false;
            cikis.Visible = false;
            btnGuncelle.Visible = false;
            txtSifreTekrar.Visible = true;
            lblSifreTekrar.Visible = true;
            btnKayit.Visible = true;
            lblKayitOl.Text = "Kayıt Ol";
        }
        else if (Session["Admin"] != null)
        {
            btnYonetim.Visible = true;
            HyperLink1.Visible = false;
            HyperLink2.Visible = false;
            btnAyarlar.Visible = true;
            cikis.Visible = true;
            txtSifreTekrar.Visible = false;
            lblSifreTekrar.Visible = false;
            btnGuncelle.Visible = true;
            btnKayit.Visible = false;
            lblKayitOl.Text = "Kullanıcı Bilgileri";
            if (!IsPostBack)
            {
                DataRow dr = c.GetDataRow("select * from kayit where kuladi='" + Session["Admin"] + "'");
                txtAd.Text = dr["ad"].ToString();
                txtAdres.Text = dr["soyad"].ToString();
                txtCinsiyet.Text = dr["cinsiyet"].ToString();
                txtKuladi.Text = dr["kuladi"].ToString();
                txtMail.Text = dr["mail"].ToString();
                txtSifre.Text = dr["sifre"].ToString();
                txtSoyad.Text = dr["soyad"].ToString();
                txtTelNo.Text = dr["telno"].ToString();
            }
        }
        else if (Session["Kullanıcı"] != null)
        {
            btnYonetim.Visible = false;
            HyperLink1.Visible = false;
            HyperLink2.Visible = false;
            btnAyarlar.Visible = true;
            cikis.Visible = true;
            txtSifreTekrar.Visible = false;
            lblSifreTekrar.Visible = false;
            btnGuncelle.Visible = true;
            btnKayit.Visible = false;
            lblKayitOl.Text = "Kullanıcı Bilgileri";
            if (!IsPostBack)
            {
                DataRow dr = c.GetDataRow("select * from kayit where kuladi='" + Session["Kullanıcı"] + "'");
                txtAd.Text = dr["ad"].ToString();
                txtAdres.Text = dr["soyad"].ToString();
                txtCinsiyet.Text = dr["cinsiyet"].ToString();
                txtKuladi.Text = dr["kuladi"].ToString();
                txtMail.Text = dr["mail"].ToString();
                txtSifre.Text = dr["sifre"].ToString();
                txtSoyad.Text = dr["soyad"].ToString();
                txtTelNo.Text = dr["telno"].ToString();
            }
        }

    }
    protected void btnKayit_Click(object sender, EventArgs e)
    {
        OleDbCommand cmd = new OleDbCommand("select count(*) from kayit where kuladi='" + txtKuladi.Text + "'", c.baglanti());
        if (cmd.ExecuteScalar().ToString() == "0")
        {
            if (txtAd.Text == "" || txtAdres.Text == "" || txtKuladi.Text == "" || txtMail.Text == "" || txtSifre.Text == "" || txtSoyad.Text == "" || txtTelNo.Text == "")
            {
                lblKayitHata.Text = "Ad, Adres, Kullanıcı Adı, E-Mail, Şifre, Soyad, Telefon Numarası alanları boş geçilemez !";
            }
            else
            {
                if (txtSifre.Text != txtSifreTekrar.Text)
                {
                    lblKayitHata.Text = "Şifreler uyuşmuyor !";
                    txtSifre.Focus();
                }
                else
                {
                    string mail = txtMail.Text;
                    if (mail.IndexOf("@") < 0 || mail.IndexOf(".com") < 0)
                    {
                        lblKayitHata.Text = "E-Mail hatalı !";
                        txtMail.Focus();
                    }
                    else
                    {
                        c.cmd("insert into kayit (ad,soyad,kuladi,sifre,mail,telno,adres,cinsiyet,unvani) values ('" + txtAd.Text + "','" + txtSoyad.Text + "','" + txtKuladi.Text + "','" + txtSifre.Text + "','" + txtMail.Text + "','" + txtTelNo.Text + "','" + txtAdres.Text + "','" + txtCinsiyet.Text + "','Kullanıcı')");
                        Response.Redirect((HttpContext.Current.Handler as Page).ResolveUrl("giyingiydirin.aspx"));
                    }
                }
            }
        }
        else
        {
            lblKayitHata.Text = "Bu Kullanıcı Adı zaten bulunmakta !";
            txtKuladi.Focus();
        }
    }

    protected void cikis_Click(object sender, EventArgs e)
    {
        Session.Abandon();
        Response.Redirect((HttpContext.Current.Handler as Page).ResolveUrl("giyingiydirin.aspx"));
    }

    protected void btnGiris_Click(object sender, EventArgs e)
    {
        if (txtKullaniciAdi.Text == "")
        {
            lblHata.Text = "Kullanıcı Adı alanı boş geçilemez !";
        }
        else if (txtSif.Text == "")
        {
            lblHata.Text = "Şifre alanı boş geçilemez !";
        }
        else
        {
            OleDbCommand cmd = new OleDbCommand("select count(*) from kayit where kuladi='" + txtKullaniciAdi.Text + "'and Sifre='" + txtSif.Text + "' and unvani='Kullanıcı'", c.baglanti());
            if (cmd.ExecuteScalar().ToString() == "0")
            {
                lblHata.Text = "Giriş bilgilerinizi kontrol edin.";
            }
            else
            {
                Session.Add("Kullanıcı", txtKullaniciAdi.Text);
                Response.Redirect((HttpContext.Current.Handler as Page).ResolveUrl("giyingiydirin.aspx"));
            }
            OleDbCommand cmdd = new OleDbCommand("select count(*) from kayit where kuladi='" + txtKullaniciAdi.Text + "'and Sifre='" + txtSif.Text + "' and unvani='Admin'", c.baglanti());
            if (cmdd.ExecuteScalar().ToString() == "0")
            {
                lblHata.Text = "Giriş bilgilerinizi kontrol edin.";
            }
            else
            {
                Session.Add("Admin", txtKullaniciAdi.Text);
                Response.Redirect((HttpContext.Current.Handler as Page).ResolveUrl("giyingiydirin.aspx"));
            }
        }
    }
    protected void btnGuncelle_Click(object sender, EventArgs e)
    {
        c.cmd("update kayit set ad='" + txtAd.Text + "', soyad='" + txtSoyad.Text + "', kuladi='" + txtKuladi.Text + "', sifre='" + txtSifre.Text + "', mail='" + txtMail.Text + "', adres='" + txtAdres.Text + "', telno='" + txtTelNo.Text + "', cinsiyet='" + txtCinsiyet.Text + "' where kuladi='" + Session["Kullanıcı"] + "'");
    }
    protected void btnYonetim_Click(object sender, EventArgs e)
    {
        Response.Redirect((HttpContext.Current.Handler as Page).ResolveUrl("yonetim.aspx"));
    }
}
