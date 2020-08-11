using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OleDb;
using System.IO;

public partial class yonetim_reklam : System.Web.UI.Page
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
        DataSet ds = c.GetDataSet("select * from reklam");
        GridView1.DataSource = ds;
        GridView1.DataBind();
    }
    void temizle()
    {
        GridView1.SelectedIndex = -1;
        Image1.ImageUrl = "";
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        DataRow dr = c.GetDataRow("select * from reklam");
        Label1.Text = dr["reklam"].ToString();
        Image1.ImageUrl = dr["reklam"].ToString();
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
            c.cmd("insert into reklam (reklam,tarih) values ('" + dosyaYolu + "','" + DateTime.Now + "')");
            cek();
            temizle();
            MultiView1.ActiveViewIndex = 2;
        }
        else
        {
        }
    }
    protected void btmSil_Click(object sender, EventArgs e)
    {
        c.cmd("delete from reklam where rid=" + GridView1.SelectedRow.Cells[1].Text + "");
        string FileToDelete;
        FileToDelete = Server.MapPath(Label1.Text);
        File.Delete(FileToDelete);
        cek();
        temizle();
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        DataSet ds = c.GetDataSet("select * from reklam");
        GridView1.PageIndex = e.NewPageIndex;
        GridView1.DataSource = ds;
        GridView1.DataBind();
    }
}