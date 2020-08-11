using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OleDb;
using System.IO;

public partial class yonetim_yonetim : System.Web.UI.Page
{
    Class1 c = new Class1();
    protected void Page_Load(object sender, EventArgs e)
    {
        cek();
        if (GridView1.Rows.Count == 0)
        {
            MultiView1.ActiveViewIndex = 1;
        }
        else
        {
            MultiView1.ActiveViewIndex = 0;
        }
    }
    void cek()
    {
        DataSet ds = c.GetDataSet("select * from giyim");
        GridView1.DataSource = ds;
        GridView1.DataBind();
    }
    void temizle()
    {
        txtAd.Text = "";
        txtBeden.Text = "";
        txtFiyat.Text = "";
        GridView1.SelectedIndex = -1;
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        DataRow dr = c.GetDataRow("select * from giyim  where gid=" + GridView1.SelectedRow.Cells[1].Text + "");
        txtAd.Text = dr["ad"].ToString();
        txtBeden.Text = dr["beden"].ToString();
        txtFiyat.Text = dr["fiyat"].ToString();
        OleDbCommand cmd = new OleDbCommand("select count(*) from giyim where indirim='İndirimde' and gid=" + GridView1.SelectedRow.Cells[1].Text + "", c.baglanti());
        if (cmd.ExecuteScalar().ToString() == "0")
        {
            chİndirim.Checked = false;
        }
        else
        {
            chİndirim.Checked = true;
        }
        drpCesit.Text = dr["cesit"].ToString();
        drpStok.Text = dr["stok"].ToString();
        Label1.Text = dr["resim"].ToString();
    }
    protected void btnKayit_Click(object sender, EventArgs e)
    {
        string dosyaYolu = String.Empty;
        if (FileUpload1.HasFile && FileUpload1.PostedFile.ContentLength <= 1048576 && FileUpload1.PostedFile.ContentType.Contains("image"))
        {
            HttpPostedFile resim = FileUpload1.PostedFile;
            Random r = new Random();
            int sayi = r.Next(0, 1000);
            string fileName = Server.HtmlEncode(FileUpload1.FileName);
            string extension = System.IO.Path.GetExtension(fileName);
            string cumle = fileName;
            string[] dizi = cumle.Split('.');
            string resimAdi = dizi[0] + sayi + extension;
            dosyaYolu = "~/image/" + resimAdi;
            FileUpload1.SaveAs(Server.MapPath(dosyaYolu));
            if (chİndirim.Checked == true)
            {
                c.cmd("insert into giyim (ad,fiyat,stok,indirim,cesit,beden,satma,tarih,resim) values ('" + txtAd.Text + "','" + txtFiyat.Text + "','" + drpStok.SelectedValue + "','İndirimde','" + drpCesit.SelectedValue + "','" + txtBeden.Text + "','0','" + DateTime.Now + "','" + dosyaYolu + "')");
            }
            else if (true)
            {
                c.cmd("insert into giyim (ad,fiyat,stok,indirim,cesit,beden,satma,tarih,resim) values ('" + txtAd.Text + "','" + txtFiyat.Text + "','" + drpStok.SelectedValue + "','','" + drpCesit.SelectedValue + "','" + txtBeden.Text + "','0','" + DateTime.Now + "','" + dosyaYolu + "')");
            }
            cek();
            temizle();
            MultiView1.ActiveViewIndex = 2;
        }
        else
        {
        }

    }
    protected void btnSil_Click(object sender, EventArgs e)
    {
        c.cmd("delete from giyim where gİd=" + GridView1.SelectedRow.Cells[1].Text + "");
        string FileToDelete;
        FileToDelete = Server.MapPath(Label1.Text);
        File.Delete(FileToDelete);
        cek();
        temizle();
        MultiView1.ActiveViewIndex = 3;
    }
    protected void btnGuncelle_Click(object sender, EventArgs e)
    {
        if (chİndirim.Checked == true)
        {
            c.cmd("update giyim set ad='" + txtAd.Text + "',fiyat='" + txtFiyat.Text + "',stok='" + drpStok.Text + "',indirim='İndirimde',cesit='" + drpCesit.Text + "',beden='" + txtBeden.Text + "' where gid=" + GridView1.SelectedRow.Cells[1].Text.ToString() + "");
        }
        else if (chİndirim.Checked == false)
        {
            c.cmd("update giyim set ad='" + txtAd.Text + "',fiyat='" + txtFiyat.Text + "',stok='" + drpStok.Text + "',indirim='',cesit='" + drpCesit.Text + "',beden='" + txtBeden.Text + "' where gid=" + GridView1.SelectedRow.Cells[1].Text.ToString() + "");
        }
        cek();
        temizle();
        MultiView1.ActiveViewIndex = 4;
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        DataSet ds = c.GetDataSet("select * from giyim");
        GridView1.PageIndex = e.NewPageIndex;
        GridView1.DataSource = ds;
        GridView1.DataBind();
    }
}